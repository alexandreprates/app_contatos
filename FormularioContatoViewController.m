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
@synthesize delegate;
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
        UIBarButtonItem *confimar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizaContato)];
        [[self navigationItem] setRightBarButtonItem:confimar];
    }
    return self;
}


- (void)criaContato
{
    Contato *contato = [self pegarDadosFormulario];
    if (self.delegate) {
        [self.delegate contatoAdicionado:contato];
    }
    [self escondeForm];
}

- (void) atualizaContato
{
    Contato *contato = [self pegarDadosFormulario];
    if (self.delegate) {
        [self.delegate contatoAtualizado:contato];
    }
    [[self navigationController] popViewControllerAnimated:YES];
}

- (Contato *)pegarDadosFormulario
{
    if (![self contato]) {
        [self setContato:[[Contato alloc] init]];
    }
    
    [[self contato] setNome:[campoNome text]];
    [[self contato] setTelefone:[campoTelefone text]];
    [[self contato] setEmail:[campoEmail text]];
    [[self contato] setEndereco:[campoEndereco text]];
    [[self contato] setSite:[campoSite text]];
    
    return [self contato];
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
