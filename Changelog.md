# Changelog

## 0.10.1 / 2025-03-23

* Depend on GirFFI-Atspi to provide Atspi bindings. This makes overrides from
  that gem available, fixing an incompatibility with newer Atspi GIR data.
  ([#109] by [mvz])

[#109]: https://github.com/mvz/atspi_app_driver/pull/109

## 0.10.0 / 2025-02-07

* Support Ruby 3.1 through 3.4, dropping support for Ruby 3.0 ([#106] by [mvz])
* Update `gir_ffi` and `gir_ffi-gtk` dependencies to version 0.18.0 ([#107] by [mvz])

[mvz]: https://github.com/mvz

[#106]: https://github.com/mvz/atspi_app_driver/pull/106
[#107]: https://github.com/mvz/atspi_app_driver/pull/107

## 0.9.0 / 2023-12-31

* Drop support for Ruby version 2.7
* Depend on GirFFI 0.17.0 (and GirFFI-Gtk 0.17.0 in development)

## 0.8.0 / 2022-05-21

* Drop support for Ruby version 2.6
* Depend on `gir_ffi` 0.16.0 and `gir_ffi-gtk` 0.16.0

## 0.7.2 / 2022-02-11

* Add missing version.rb file

## 0.7.1 / 2022-01-23

* Drop support for Ruby version 2.5
* Support up to Ruby 3.1

## 0.7.0 / 2020-11-14

* Drop support for Ruby version 2.4
* Remove `AtspiAppDriver#press_ctrl_q` because it does not and likely will
  never work on Wayland. Use a regular action to quit your application instead.
* Provide access to the main application Atspi object through
  AtspiAppDriver#application

## 0.6.0 / 2019-10-19

* Depend on GirFFI 0.15.0 and GirFFI-Gtk 0.15.0
* Drop support for Ruby versions 2.2 and 2.3

## 0.5.0 / 2018-09-27

* Depend on GirFFI 0.14.0 and GirFFI-Gtk 0.14.0

## 0.4.0 / 2018-09-08

* Drop support for Ruby 2.1
* Depend on GirFFI 0.13.0 and GirFFI-Gtk 0.13.0

## 0.3.1 / 2018-05-31

* Restore support for Ruby 2.1 and 2.2

## 0.3.0 / 2018-03-25

* Depend on GirFFI 0.12.0 and GirFFI-Gtk 0.12.0
* Drop support for Ruby versions below 2.3

## 0.2.0 / 2017-11-05

* Revert to using GirFFI to provide GLib bindings. Use `gnome_app_driver` if you
  want to drive a Ruby-GNOME2 application.

## 0.1.0 / 2017-04-25

* Use Ruby-GNOME2 instead of GirFFI to provide GLib bindings

## 0.0.7 / 2016-10-16

* Depend on GirFFI 0.11.x

## 0.0.6 / 2016-03-23

* Depend on GirFFI 0.10.x

## 0.0.5 / 2016-02-04

* Depend on GirFFI 0.9.x
* Fix boot failure handling

## 0.0.4 / 2015-12-12

* Loosen dependencies

## 0.0.3 / 2015-10-29

* Ensure frame is focused by waiting for it to be :active

## 0.0.2 / 2015-09-20

* Print self during recursive inspect
* Update dependencies

## 0.0.1 / 2015-05-29

* Initial release
