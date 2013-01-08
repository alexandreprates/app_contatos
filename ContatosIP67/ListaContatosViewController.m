//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

@synthesize contatos = _contatos;

- (id)init {
    self = [super init];
    if (self) {
        [[self navigationItem] setTitle: @"Contatos"];
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeForm)]];
    }
    return self;
}

- (void) exibeForm {
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] init];
    [form setContatos:[self contatos]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    NSLog(@"contatos: %i", [[self contatos] count]);
}

@end
