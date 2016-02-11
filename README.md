# EasyNumberPad
Simple Number Pad for iPad


![ScreenShot](ScreenShot.png?raw=true "EasyNumberPad Screenshot")

Overview
------------------------
We built this component for our [**Phew!**](http://www.phew.co) app and decided to open-source it.

EasyNumberPad consists of a single component:
                            
**`EasyNumberPadViewController`** - a `UIViewController` that contains a simple kid-styled number keypad for iPad.

*`EasyNumberPadViewController` must be presented modally.*

**Use:**
```objective-c
EasyNumberPadViewController *pad = [[EasyNumberPadViewController alloc] init];
pad.delegate = self;
[self presentViewController:pad animated:YES completion:nil];
```

See `EasyNumberPadDemo` for an example.

Installation
------------------------

Copy the contents of the `EasyNumberPad` folder into your project.



Implementing `EasyNumberPadDelegate` Protocol
------------------------
`EasyNumberPadDelegate` is a set of `@required` callback methods to handle the delegate messages corresponding to button actions:

```objective-c
-(void) done:(EasyNumberPadViewController *)controller withText:(NSString *)text;
-(void) cancelled:(EasyNumberPadViewController *)controller;
```

The delegate must implement the `done:` message to respond when a user is finished entering the numeric value. 
Implement the `cancelled:` method to take the appropriate action when the user cancels the control.

See `EasyNumberPadDemo` for an example.

Acknowledgements
------------------------

* Lee Loughnane for design and button graphics
* Uses [RZNumberPad](https://github.com/Raizlabs/RZNumberPad/) Copyright 2014 Raizlabs and other contributors
   http://raizlabs.com/
* Uses Google's [Slackey](https://www.google.com/fonts/specimen/Slackey) font.
   
   
