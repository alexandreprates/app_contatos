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
@synthesize viewController = _viewController;
@synthesize arquivoContatos = _arquivoContatos;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSArray *userDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [userDirs objectAtIndex:0];
    self.arquivoContatos = [NSString stringWithFormat:@"%@/ArquivoContatos", documentDir];
    
    [self setContatos:[NSKeyedUnarchiver unarchiveObjectWithFile:[self arquivoContatos]]];
    
    if (![self contatos]) {
        [self setContatos:[[NSMutableArray alloc] init]];
    }
    
    [self setViewController:[[ListaContatosViewController alloc] init]];
    [[self viewController] setContatos:[self contatos]];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[self viewController]];
    ContatosNoMapaViewController *contatosMapa = [[ContatosNoMapaViewController alloc] init];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    [tab setViewControllers:[NSArray arrayWithObjects:nav, contatosMapa, nil]];
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [NSKeyedArchiver archiveRootObject:self.contatos toFile:self.arquivoContatos];
}

@end
