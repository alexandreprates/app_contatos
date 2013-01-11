//
//  AppDelegate.h
//  ContatosIP67
//
//  Created by ios3105 on 07/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListaContatosViewController.h"
#import "ContatosNoMapaViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *contatos;
@property (strong, nonatomic) NSString *arquivoContatos;
@property (readonly, strong) NSManagedObjectContext *contexto;

- (void) inserirDados;
- (void) buscarContatos;

@end
