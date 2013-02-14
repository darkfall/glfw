//
//  AppDelegate.m
//  Slave
//
//  Created by Robert Bu on 2/14/13.
//  Copyright (c) 2013 Robert Bu. All rights reserved.
//

#import "AppDelegate.h"

#import "GlfwParentWindow.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    GlfwParentWindow* wnd = [[GlfwParentWindow alloc] initWithFrame:CGRectMake(0,
                                                                               [_window frame].size.height - 400,
                                                                               400,
                                                                               400)];
    [[[self window] contentView] addSubview:wnd];

    [wnd setupGlfw];
}

@end
