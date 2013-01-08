//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatosViewController

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
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

@end
