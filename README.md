# Atspi App Driver

Test driver for the Atspi-enabled applications. Takes care of boot and
shutdown, and provides a handle on the GUI's main UI frame.

## Usage

This driver assumes your application lives in `bin/` and uses additional ruby
code in `lib/`.

Say, your application is called `foo`. Then, in your tests, do something like this:

    require 'atspi_app_driver'

    describe 'The application' do
      before do
        @driver = AtspiAppDriver.new('foo')

        # This will boot `ruby -Ilib bin/foo`, wait for its main window to appear,
        # and focus it.
        @driver.boot
      end

      it 'does stuff' do
        # Fetch the main window's atspi object
        frame = @driver.frame

        # You can now interact with the window's objects

        # Select item matching /bar/ from combo box:
        box = frame.find_role :combo_box
        item = box.find_role :menu_item, /bar/
        box.get_action_name(0).must_equal 'press'
        box.do_action 0
        item.get_action_name(0).must_equal 'click'
        item.do_action 0

        # Fetch contents of a text box
        textbox = frame.find_role :text
        textbox.get_text(0, 100).must_equal 'Foo bar baz'

        # Quit application
        @driver.press_ctrl_q

        # Check exit status
        status = @driver.cleanup
        status.exitstatus.must_equal 0
      end

      after do
        # Ensure application is cleaned up
        @driver.cleanup
      end
    end

## Installation

    gem install atspi_app_driver

## Dependencies

Atspi App Driver needs atspi's GIR data, and needs to be able to interact with
the application via atspi and atk. The below are suggested packages to install.
Corrections are welcome, of course.

### Debian

This should work on Debian unstable.

    sudo apt-get install dbus
    sudo apt-get install libgirepository1.0-dev gobject-introspection
    sudo apt-get install gir1.2-atspi-2.0 libatk-adaptor

### Ubuntu

Please try the instructions for Debian. This will probably not work on Ubuntu
12.04. Again, corrections and additions are welcome.

### Other OS

To be determined. Please contribute back your experience in getting Atspi App
Driver working on your favorite operation system.

## Contributing

Contributions are welcome! Please feel free to create issues or pull requests
on GitHub.

## License

Copyright &copy; 2015 [Matijs van Zuijlen](http://www.matijs.net).
See LICENSE for details.
