//
//  AppDelegate.m
//  ContatosIP67
//
//  Created by ios3105 on 07/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ListaContatosViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize contatos = _contatos;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self setContatos:[[NSMutableArray alloc] init]];
    
    ListaContatosViewController *listaContatos = [[ListaContatosViewController alloc] init];
    [listaContatos setContatos: [self contatos]];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:listaContatos];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
