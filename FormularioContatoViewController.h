//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3105 on 07/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListaContatosProtocol.h"
#import "Contato.h"

@interface FormularioContatoViewController : UIViewController<ListaContatosProtocol>

@property(weak, nonatomic) IBOutlet UITextField *campoNome;
@property(weak, nonatomic) IBOutlet UITextField *campoTelefone;
@property(weak, nonatomic) IBOutlet UITextField *campoEmail;
@property(weak, nonatomic) IBOutlet UITextField *campoEndereco;
@property(weak, nonatomic) IBOutlet UITextField *campoSite;

@property(weak)id<ListaContatosProtocol> delegate;
@property(strong, nonatomic) Contato *contato;

- (id)initWithContato:(Contato *) contato;

- (IBAction) proximoCampo:(id)sender;

- (Contato *) pegarDadosFormulario;
- (void) escondeForm; 

@end
