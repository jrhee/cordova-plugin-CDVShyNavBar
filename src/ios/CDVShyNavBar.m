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

- (void)setupLeftButton:(CDVInvokedUrlCommand*)command
{
    NSLog(@"SetupLeftButton");
    
    NSString *title = [command argumentAtIndex:0];
    NSString *imageName = [command argumentAtIndex:1];
    NSDictionary *options = [command argumentAtIndex:2];
    
    self.navBarController.topViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonTapped)];
}

- (void) leftButtonTapped
{
    UIWebView *uiwebview = nil;
    if ([self.webView isKindOfClass:[UIWebView class]]) {
        uiwebview = ((UIWebView*)self.webView);
    }
    
    NSString * jsCallBack = @"cdvShyNavBar.leftButtonTapped();";
    [uiwebview stringByEvaluatingJavaScriptFromString:jsCallBack];
}


- (UIBarButtonItem*)makeButton: (NSString*)title imageName:(NSString*)imageName actionOnSelf:(SEL)actionOnSelf
{
    UIBarButtonItem *button = nil;
    
    if (title && title.length > 0)
    {
        button = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:actionOnSelf];
    }
    else if (imageName && imageName.length > 0)
    {
        button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:actionOnSelf];
    }
    else
    {
        NSLog(@"Invalid button parameters");
    }
    
    return button;
}

@end
