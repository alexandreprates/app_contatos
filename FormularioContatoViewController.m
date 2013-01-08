//
//  FormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 07/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"

@implementation FormularioContatoViewController
@synthesize campoNome;
@synthesize campoTelefone;
@synthesize campoEmail;
@synthesize campoEndereco;
@synthesize campoSite;
@synthesize contatos = _contatos;

- (id)init {
    self = [super init];
    if (self) {
        [[self navigationItem] setTitle: @"Novo Contato"];
        [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancela" style:UIBarButtonItemStylePlain target:self action:@selector(escondeForm)]];
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)]];
        
    }
    return self;
}


-(void) criaContato {
    Contato *contato = [self pegarDadosFormulario];
    [[self contatos] addObject:contato];
    [self escondeForm];
}

- (Contato *) pegarDadosFormulario {
    Contato *contato = [[Contato alloc] init];
    [contato setNome:[campoNome text]];
    [contato setTelefone:[campoTelefone text]];
    [contato setEmail:[campoEmail text]];
    [contato setEndereco:[campoEndereco text]];
    [contato setSite:[campoSite text]];
    return contato;
}

- (IBAction)proximoCampo:(id)sender {
    if (sender == [self campoNome]) {
        [[self campoTelefone] becomeFirstResponder];
    } else if (sender == [self campoTelefone]) {
        [[self campoEmail] becomeFirstResponder];
    } else if (sender == [self campoEmail]) {
        [[self campoEndereco] becomeFirstResponder];
    } else if (sender == [self campoEndereco]) {
        [[sender campoSite] becomeFirstResponder];
    }
}

- (void) escondeForm {
    [self dismissModalViewControllerAnimated:YES];
}


@end
