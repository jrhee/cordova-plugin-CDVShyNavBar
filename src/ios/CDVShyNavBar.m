//
//  ShyNavBar.m
//
//
//  Created by Jake Rhee on 10/25/16.
//
//
#import "CDVShyNavBar.h"
#import <WebKit/WebKit.h>
#import "Cordova/CDV.h"
#import "MainViewController.h"
#import "TLYShyNavBar/TLYShyNavBarManager.h"

@implementation CDVShyNavBar

@synthesize navBarController;

- (void) pluginInitialize {
    
    // Get the rootViewController
    MainViewController *mainViewController = (MainViewController *)[[[[UIApplication sharedApplication]delegate] window] rootViewController];
    
    // Create NavigationBarController and attach the current rootViewController
    self.navBarController = [[UINavigationController alloc] initWithRootViewController: mainViewController];
    
    // NavigationBarController is the new rootViewController
    [[[[UIApplication sharedApplication]delegate] window] setRootViewController:navBarController];
    
    // Set the scrollView for the TLYShyNavBarManager
    mainViewController.shyNavBarManager.scrollView = self.webView.scrollView;
}

- (void) setTitle: (CDVInvokedUrlCommand*)command
{
    NSString *title = [command.arguments objectAtIndex:0];
    self.navBarController.topViewController.title = title;
}



@end
