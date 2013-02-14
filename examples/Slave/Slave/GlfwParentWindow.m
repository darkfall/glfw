//
//  GlfwParentWindow.m
//  Slave
//
//  Created by Robert Bu on 2/14/13.
//  Copyright (c) 2013 Robert Bu. All rights reserved.
//

#import "GlfwParentWindow.h"

static void WindowSizeFunc(GLFWwindow* window, int w, int h) {
    printf("size: %d, %d\n", w, h);
}

static int WindowCloseFunc(GLFWwindow* window) {
    return 1;
}

static void WindowRefreshFunc(GLFWwindow* window) {
    //    GLWindow* glwnd = (GLWindow*)glfwGetWindowUserPointer(window);
    printf("Refresh\n");
}

static void WindowFocusFunc(GLFWwindow* window, int f) {
    printf("focus\n");
}

static void WindowIconifyFunc(GLFWwindow* window, int f) {
    printf("iconify\n");
}

static void MouseButtonFunc(GLFWwindow* window, int btn, int state) {
    printf("mouse button: %d, %d\n", btn, state);
}

static void MousePosFunc(GLFWwindow* window, int x, int y) {
    printf("mouse pos: %d, %d\n", x, y);
}

static void ScrollFunc(GLFWwindow* window, double a, double b) {
    printf("scroll: %.2f, 0.2f\n", a, b);
}

static void KeyFunc(GLFWwindow* window, int key, int state) {
    printf("key: %d, %d\n", key, state);
}

static void CharFunc(GLFWwindow* window, int c) {
    printf("char: %c\n", c);
}

static void ErrorCallback(int i, const char* error) {
    printf("%s\n", error);
}


@implementation GlfwParentWindow



- (id)initWithFrame:(NSRect)frameRect {
    if(self = [super initWithFrame:frameRect]) {
        [NSTimer scheduledTimerWithTimeInterval:1.f/60
                                         target:self
                                       selector:@selector(updateSurface)
                                       userInfo:nil
                                        repeats:YES];
    }

    return self;
}

- (void) updateSurface
{
    [self setNeedsDisplay:YES];
}

- (bool)setupGlfw {
    glfwInit();
    _glfwWindow = glfwCreateWindowSlave((__bridge void*)self, 0);
    
    glfwSetErrorCallback(ErrorCallback);
    glfwSetWindowSizeCallback(_glfwWindow, WindowSizeFunc);
    glfwSetWindowCloseCallback(_glfwWindow, WindowCloseFunc);
    glfwSetWindowRefreshCallback(_glfwWindow, WindowRefreshFunc);
    glfwSetWindowFocusCallback(_glfwWindow, WindowFocusFunc);
    glfwSetWindowIconifyCallback(_glfwWindow, WindowIconifyFunc);
    glfwSetWindowRefreshCallback(_glfwWindow, WindowRefreshFunc);
    
    glfwSetKeyCallback(_glfwWindow, KeyFunc);
    glfwSetCursorPosCallback(_glfwWindow, MousePosFunc);
    glfwSetMouseButtonCallback(_glfwWindow, MouseButtonFunc);
    glfwSetScrollCallback(_glfwWindow, ScrollFunc);
    glfwSetCharCallback(_glfwWindow, CharFunc);
    
    glfwMakeContextCurrent(_glfwWindow);
    
    // to do with joysticks
    
    glfwSwapInterval(0);

    return _glfwWindow != 0;
}

- (void)drawRect:(NSRect)dirtyRect {
    glClearColor(0, 0, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    
    glBegin(GL_TRIANGLES);
        glVertex3f(0, 0.5, 0);
        glColor3f(1, 0, 0);
        glVertex3f(-0.5, -0.5, 0);
        glColor3f(0, 1, 0);
        glVertex3f(0.5, -0.5, 0);
        glColor3f(0, 0, 1);
    glEnd();
    
    glfwSwapBuffers(_glfwWindow);
    
}

@end
