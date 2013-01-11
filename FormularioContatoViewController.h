//
//  FormularioContatoViewController.h
//  ContatosIP67
//
//  Created by ios3105 on 07/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ListaContatosProtocol.h"
#import "Contato.h"

@interface FormularioContatoViewController : UIViewController <ListaContatosProtocol, UIImagePickerControllerDelegate>
 
@property (weak, nonatomic) IBOutlet UITextField *campoNome;
@property (weak, nonatomic) IBOutlet UITextField *campoTelefone;
@property (weak, nonatomic) IBOutlet UITextField *campoEmail;
@property (weak, nonatomic) IBOutlet UITextField *campoEndereco;
@property (weak, nonatomic) IBOutlet UITextField *campoSite;
@property (weak, nonatomic) IBOutlet UIButton *botaoFoto;
@property (weak, nonatomic) IBOutlet UITextField *campoTwitter;
@property (weak, nonatomic) IBOutlet UITextField *campoLatitude;
@property (weak, nonatomic) IBOutlet UITextField *campoLongitude;
@property (weak, nonatomic) IBOutlet UIButton *botaoGeocode;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@property (weak)id<ListaContatosProtocol> delegate;
@property (strong, nonatomic) Contato *contato;
@property (weak, nonatomic) NSManagedObjectContext *contexto;

- (id)initWithContato:(Contato *) contato;

- (IBAction) proximoCampo:(id)sender;
- (IBAction)selecionaFoto:(id)sender;
- (IBAction)buscarCoordenadas:(id)sender;

- (Contato *) pegarDadosFormulario;
- (void) escondeForm; 

@end
