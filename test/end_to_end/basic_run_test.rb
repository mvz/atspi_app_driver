# frozen_string_literal: true

require_relative '../test_helper'
require 'atspi_app_driver'

describe 'test driving a dummy application' do
  before do
    @driver = AtspiAppDriver.new('dummy', app_file: 'test/bin/dummy')
    @driver.boot
  end

  it 'starts and can be quit with Ctrl-q' do
    @driver.press_ctrl_q

    status = @driver.cleanup
    _(status.exitstatus).must_equal 0
  end

  it 'can be interacted with' do
    frame = @driver.frame.find_role :frame
    _(frame).wont_be_nil

    @driver.press_ctrl_q
  end

  after do
    @driver.cleanup
  end
end

describe 'test driving an application without an accessible window' do
  before do
    @driver = AtspiAppDriver.new('dummy', app_file: 'test/bin/no_window')
  end

  it 'will fail to boot' do
    _(proc { @driver.boot }).must_raise RuntimeError, /App not/
  end

  after do
    @driver.cleanup
  end
end
