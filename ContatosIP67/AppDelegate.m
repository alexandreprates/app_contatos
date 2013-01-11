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
@synthesize arquivoContatos = _arquivoContatos;
@synthesize contexto = _contexto;

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
    
    ListaContatosViewController *listaContatosViewController = [[ListaContatosViewController alloc] init];
    [listaContatosViewController setContatos:[self contatos]];
    UINavigationController *listaContatosNavigationBar = [[UINavigationController alloc] initWithRootViewController:listaContatosViewController];
    
    ContatosNoMapaViewController *contatosMapa = [[ContatosNoMapaViewController alloc] init];
    [contatosMapa setContatos:[self contatos]];
    UINavigationController *contatosMapaNavigationBar = [[UINavigationController alloc] initWithRootViewController:contatosMapa];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    [tab setViewControllers:[NSArray arrayWithObjects:listaContatosNavigationBar, contatosMapaNavigationBar, nil]];
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [NSKeyedArchiver archiveRootObject:self.contatos toFile:self.arquivoContatos];
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ModeloContatos" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)coordinator
{
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *pastaDocuments = [self applicationDocumentsDirectory];
    NSURL *bancoDeDados = [pastaDocuments URLByAppendingPathComponent:@"c ontatos.sqlite"];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:bancoDeDados options:nil error:nil];
    return coordinator;
}

- (NSManagedObjectContext *)contexto
{
    if (_contexto != nil) {
        return _contexto;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self coordinator];
    _contexto = [[NSManagedObjectContext alloc] init];
    [_contexto setPersistentStoreCoordinator:coordinator];
    return _contexto;
}

@end
