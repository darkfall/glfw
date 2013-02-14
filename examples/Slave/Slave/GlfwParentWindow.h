//
//  GlfwParentWindow.h
//  Slave
//
//  Created by Robert Bu on 2/14/13.
//  Copyright (c) 2013 Robert Bu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <GL/glfw3.h>

@interface GlfwParentWindow : NSView {
    GLFWwindow* _glfwWindow;
    
}

- (bool)setupGlfw;

@end
