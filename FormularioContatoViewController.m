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
@synthesize contato = _contato;

- (id)init
{
    self = [super init];
    if (self) {
        [[self navigationItem] setTitle: @"Novo Contato"];
        [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancela" 
                                                                                     style:UIBarButtonItemStylePlain 
                                                                                    target:self 
                                                                                    action:@selector(escondeForm)]];
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Adiciona" 
                                                                                      style:UIBarButtonItemStylePlain 
                                                                                     target:self 
                                                                                     action:@selector(criaContato)]];
        
    }
    return self;
}

- (id)initWithContato:(Contato *) contato
{
    self = [super init];
    if (self) {
        [self setContato: contato];
        [[self navigationItem] setTitle:[contato nome]];
    }
    return self;
}


- (void)criaContato
{
    Contato *contato = [self pegarDadosFormulario];
    [[self contatos] addObject:contato];
    [self escondeForm];
}

- (Contato *)pegarDadosFormulario
{
    Contato *contato = [[Contato alloc] init];
    [contato setNome:[campoNome text]];
    [contato setTelefone:[campoTelefone text]];
    [contato setEmail:[campoEmail text]];
    [contato setEndereco:[campoEndereco text]];
    [contato setSite:[campoSite text]];
    return contato;
}

- (IBAction)proximoCampo:(id)sender
{
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

- (void)escondeForm 
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    if ([self contato]) {
        [[self campoNome] setText:[[self contato] nome]];
        [[self campoTelefone] setText:[[self contato] telefone]];
        [[self campoEmail] setText:[[self contato] email]];
        [[self campoEndereco] setText:[[self contato] endereco]];
        [[self campoSite] setText:[[self contato] site]];
    }
}

@end
