//
//  FormularioContatoViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 07/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FormularioContatoViewController.h"

@implementation FormularioContatoViewController
@synthesize campoNome;
@synthesize campoTelefone;
@synthesize campoEmail;
@synthesize campoEndereco;
@synthesize campoSite;

- (IBAction)gravarContato:(id)sender {
    
    NSMutableDictionary *contato = [[NSMutableDictionary alloc] init];
    [contato setObject:[campoNome text] forKey:@"nome"];
    [contato setObject:[campoTelefone text] forKey:@"telefone"];
    [contato setObject:[campoEmail text] forKey:@"e-mail"];
    [contato setObject:[campoEndereco text] forKey:@"endereco"];
    [contato setObject:[campoSite text] forKey:@"site"];
    
    NSLog(@"dados: %@", contato);

}


@end
