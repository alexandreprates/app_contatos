//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3105 on 07/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormularioContatoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *campoNome;
@property (weak, nonatomic) IBOutlet UITextField *campoTelefone;
@property (weak, nonatomic) IBOutlet UITextField *campoEmail;
@property (weak, nonatomic) IBOutlet UITextField *campoEndereco;
@property (weak, nonatomic) IBOutlet UITextField *campoSite;

@property (strong, nonatomic) NSMutableArray *contatos;

- (IBAction)pegarDadosFormulario:(id)sender;
- (IBAction)proximoCampo:(id)sender;

@end
