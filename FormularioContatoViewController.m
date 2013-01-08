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
        _contatos = [[NSMutableArray alloc] init];

        [[self navigationItem] setTitle: @"Novo Contato"];
        [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancela" style:UIBarButtonItemStylePlain target:self action:@selector(escondeForm)]];
                                                        
    }
    return self;
}

- (IBAction)pegarDadosFormulario:(id)sender {
    //    NSMutableDictionary *contato = [[NSMutableDictionary alloc] init];
    //    [contato setObject:[campoNome text] forKey:@"nome"];
    //    [contato setObject:[campoTelefone text] forKey:@"telefone"];
    //    [contato setObject:[campoEmail text] forKey:@"e-mail"];
    //    [contato setObject:[campoEndereco text] forKey:@"endereco"];
    //    [contato setObject:[campoSite text] forKey:@"site"];
    
    Contato *contato = [[Contato alloc] init];
    
    [contato setNome:[campoNome text]];
    [contato setTelefone:[campoTelefone text]];
    [contato setEmail:[campoEmail text]];
    [contato setEndereco:[campoEndereco text]];
    [contato setSite:[campoSite text]];
    
    [[self contatos] addObject:contato];
    
    [campoSite resignFirstResponder];
    
    NSLog(@"contatos: %@", [self contatos]);
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
