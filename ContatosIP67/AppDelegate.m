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
    
    [self inserirDados];
    [self buscarContatos];
    if (![self contatos]) {
        [self setContatos:[[NSMutableArray alloc] init]];
    }
    
    ListaContatosViewController *listaContatosViewController = [[ListaContatosViewController alloc] init];
    [listaContatosViewController setContatos:[self contatos]];
    [listaContatosViewController setContexto:[self contexto]];
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
    NSURL *bancoDeDados = [pastaDocuments URLByAppendingPathComponent:@"contatos.sqlite"];
    
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

- (void) salvaContexto
{
    NSError *error;
    if (![self.contexto save:&error]) {
        NSDictionary *informacoes = [error userInfo];
        NSArray *multiplosErros = [informacoes objectForKey:NSDetailedErrorsKey];
        if (multiplosErros) {
            for (NSError *erro in multiplosErros) {
                NSLog(@"Ocorreu um problema: %@", [erro userInfo]);
            }
        } else {
            NSLog(@"Ocorreu um problema: %@", informacoes);
        }
    }
}

- (void)inserirDados
{
    NSUserDefaults *configuracoes = [NSUserDefaults standardUserDefaults];
    BOOL dadosInseridos = [configuracoes boolForKey:@"dados_inseridos"];
    if (!dadosInseridos) {
        Contato *caelumSP = [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:self.contexto];
        caelumSP.nome = @"Caelum";
        caelumSP.email = @"contato@caelum.com.br";
        caelumSP.endereco = @"Sao Paulo, SP, Rua Vergueiro, 3185";
        caelumSP.telefone = @"01155712751";
        caelumSP.site = @"http://www.caelum.com.br";
        caelumSP.latitude = [NSNumber numberWithDouble:-23.5883034];
        caelumSP.longitude = [NSNumber numberWithDouble:-46.632369];
        [self salvaContexto];
        [configuracoes setBool:TRUE forKey:@"dados_inseridos"];
        [configuracoes synchronize];
    }
}

- (void) buscarContatos
{
    NSFetchRequest *buscaContatos = [NSFetchRequest fetchRequestWithEntityName:@"Contato"];
    NSSortDescriptor *ordenarPorNome = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    [buscaContatos setSortDescriptors:[NSArray arrayWithObject:ordenarPorNome]];
    NSArray *contatosImutaveis = [self.contexto executeFetchRequest:buscaContatos error:nil];
    self.contatos = [contatosImutaveis mutableCopy];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self salvaContexto];
}

@end
