CustomUIAlertViewFactory
========================

UIAlertView is both limited and comes with a variety of irritations and problems. This project presents a solution by using blocks for the callbacks, and allowing custom views to be used instead of the default blue alert view.

= Welcome =

Hopefully you find this mini-project helpful, or at the very least, mildly interesting.

== Known issues with the framework ==

1. Projects must link to QuartzCore.framework as well as this one

2. armv7s is not supported yet. Adjust the architectures of a target project to be just armv7 until this is fixed.
