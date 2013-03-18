# CustomUIAlertViewFactory #


UIAlertView is both limited and comes with a variety of irritations and problems. This project presents a solution by using blocks for the callbacks, and allowing custom views to be used instead of the default blue alert view.

## How To Use ##

Step 1-
Option a) Add the source files to your project
Option b) Add the precompiled framework to your project

Step 2-
Option a) Use a standard styled UIAlert by doing:
```
    [CAVAlertViewFactory alertViewWithTitle:@"Standard Title"
                                       body:@"This is a standard alert"
                               cancelButton:@"Cancel"
                          otherButtonTitles:@[@"Okay",@"Not okay"]
                                 completion:^(NSInteger selectedButtonIndex, id customObj) {
                                     [self updateDisplayForIndex:selectedButtonIndex];
                                 }];
```

Option b) Subcless CAVAlertView for your custom stylings, as seen in the demo project, and do the following:
```
    CAVDemoAlert *alert = [CAVDemoAlert demoAlert];
    [CAVAlertViewFactory showCAVAlert:alert
                       withCompletion:^(NSInteger selectedButtonIndex, id customObj) {
                           [self updateDisplayForIndex:selectedButtonIndex];
                       }];
```

## License ##

![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png) [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).


== Known issues with the framework ==

Projects must link to QuartzCore.framework as well as this one

armv7s is not supported yet. Adjust the architectures of a target project to be just armv7 until this is fixed.
