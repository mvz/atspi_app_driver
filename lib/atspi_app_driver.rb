# frozen_string_literal: true

require "gir_ffi-atspi"

# Utility monkey-patches for the Atspi::Accessible class
module AtspiAccessiblePatches
  def each_child
    child_count.times do |i|
      child = get_child_at_index i
      yield child if child
    end
  end

  def find_role(role, regex = //)
    return self if role == self.role && name =~ regex

    each_child do |child|
      result = child.find_role role, regex
      return result if result
    end
    nil
  end

  def inspect_recursive(level = 0, maxlevel = 5)
    puts "#{"  " * level} > name: #{name}; role: #{role}"
    each_child do |child|
      child.inspect_recursive(level + 1) unless level >= maxlevel
    end
  end
end

Atspi::Accessible.include AtspiAccessiblePatches

# Test driver for the Atspi-enabled applications. Takes care of boot and
# shutdown, and provides a handle on the GUI's main UI frame.
class AtspiAppDriver
  def initialize(app_name, app_file: nil, verbose: false)
    @app_file = app_file || "bin/#{app_name}"
    @lib_dir = "lib"
    @app_name = app_name
    @pid = nil
    @verbose = verbose
    @frame = nil
    @thread = nil
  end

  attr_reader :frame, :application

  def boot(test_timeout: 30, exit_timeout: 10, arguments: [])
    raise "Already booted" if @pid

    spawn_process(arguments)

    @cleanup = false

    @frame = find_and_focus_frame

    @thread = Thread.new do
      wait_for("test to be done", test_timeout) { @cleanup }
      wait_for("pid to go away", exit_timeout) { !@pid }
      kill_process if @pid
    end
  end

  def spawn_process(arguments)
    command = "ruby -I#{@lib_dir} #{@app_file} #{arguments.join(" ")}"
    log "About to spawn: `#{command}`"
    @pid = Process.spawn command
  end

  def cleanup
    status = exit_status
    @pid = nil
    @thread&.join
    status
  end

  private

  def find_and_focus_frame
    @application = wait_for("app to appear", 10) { find_app }
    raise "App not found" unless @application

    frame = @application.get_child_at_index 0
    role = frame.role
    raise "Frame has unexpected role #{role.inspect}" unless role == :frame

    wait_for("frame to be focused", 10) do
      frame.get_state_set.get_states.to_a.include? :active
    end

    frame
  end

  def kill_process
    log "About to kill child process #{@pid}"
    Process.kill "KILL", @pid
  end

  def log(message)
    warn message if @verbose
  end

  def find_app
    desktop = Atspi.get_desktop(0)
    desktop.each_child do |child|
      return child if child.name == @app_name
    end
    nil
  end

  # TODO: Use timeout
  def wait_for(description, _timeout)
    start = Time.now
    result = nil
    # Try for 0.01 * 50 * (50 + 1) / 2 = 12.75 seconds
    50.times do |num|
      result = yield
      break if result

      sleep 0.01 * (num + 1)
    end
    log "Waited #{Time.now - start} seconds for #{description}"
    result
  end

  def exit_status
    return unless @pid

    @cleanup = true
    _, status = Process.wait2 @pid
    status
  end
end

require_relative "atspi_app_driver/version"
