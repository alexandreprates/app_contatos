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
@synthesize botaoFoto;
@synthesize campoTwitter;
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
    [[self contato] setTwitter:[campoTwitter text]];
    if ([[botaoFoto imageView] image]) {
        [[self contato] setFoto:[[botaoFoto imageView] image]];
    }
    
    return [self contato];
}

- (IBAction)proximoCampo:(id)sender
{
    if (sender == [self campoNome]) {
        [[self campoEmail] becomeFirstResponder];
    } else if (sender == [self campoEmail]) {
        [[self campoTelefone] becomeFirstResponder];
    } else if (sender == [self campoTelefone]) {
        [[self campoTwitter] becomeFirstResponder];
    } else if (sender == [self campoTwitter]) {
        [[sender campoSite] becomeFirstResponder];
    } else if (sender == [self campoSite]) {
        [[sender campoEndereco] becomeFirstResponder];
    } else if (sender == [self campoEndereco]) {
        [[sender campoSite] becomeFirstResponder];
    }
}

- (void)escondeForm 
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)selecionaFoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        <#statements#>
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentModalViewController:picker animated:YES];
    }
    
}

- (void)tecladoApareceu:(NSNotification *)notificacao {
    NSLog(@"O teclado apareceu na tela");
}

- (void)tecladoSumiu:(NSNotification *)notificacao {
    NSLog(@"Um teclado sumiu da tela");
}


- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(tecladoApareceu:) 
                                                 name:UIKeyboardDidShowNotification 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(tecladoSumiu:) 
                                                 name:UIKeyboardDidHideNotification 
                                               object:nil];
    
    if ([self contato]) {
        [[self campoNome] setText:[[self contato] nome]];
        [[self campoTelefone] setText:[[self contato] telefone]];
        [[self campoEmail] setText:[[self contato] email]];
        [[self campoEndereco] setText:[[self contato] endereco]];
        [[self campoSite] setText:[[self contato] site]];
        [[self campoTwitter] setText:[[self contato] twitter]];
        if ([[self contato] foto]) {
            [[self botaoFoto] setImage:[[self contato] foto] forState:UIControlStateNormal];
        }
    }
}

- (void)contatoAtualizado:(Contato *) contato
{
}

- (void)contatoAdicionado:(Contato *) contato
{
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [botaoFoto setImage:imagemSelecionada forState:UIControlStateNormal];
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setBotaoFoto:nil];
    [self setCampoTwitter:nil];
    [super viewDidUnload];
}
@end
