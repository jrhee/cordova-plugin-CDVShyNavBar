//
//  ShyNavBar.h
//
//
//  Created by Jake Rhee on 10/25/16.
//
//

#import <WebKit/WebKit.h>
#import "Cordova/CDV.h"

@interface CDVShyNavBar: CDVPlugin

@property UINavigationController *navBarController;
@property UIBarButtonItem *leftButton;
@property UIBarButtonItem *rightButton;

- (void)setTitle:(CDVInvokedUrlCommand*)command;

- (void)setupLeftButton:(CDVInvokedUrlCommand*)command;
- (void)setupRightButton:(CDVInvokedUrlCommand*)command;

- (void)leftButtonTapped;
- (void)rightButtonTapped;

- (void)setLeftButtonEnabled:(CDVInvokedUrlCommand*)command;
- (void)setRightButtonEnabled:(CDVInvokedUrlCommand*)command;

@end
