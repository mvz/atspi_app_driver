require_relative '../test_helper'
require 'atspi_app_driver'

describe 'When test driving a dummy application' do
  before do
    @driver = AtspiAppDriver.new('dummy', app_file: 'test/bin/dummy')
    @driver.boot
  end

  it 'starts and can be quit with Ctrl-q' do
    @driver.press_ctrl_q

    status = @driver.cleanup
    status.exitstatus.must_equal 0
  end

  after do
    @driver.cleanup
  end
end
