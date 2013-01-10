//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController

@synthesize contatos = _contatos;
@synthesize linhaDestaque;

- (id)init
{
    self = [super init];
    if (self) {
        [[self navigationItem] setTitle: @"Contatos"];
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                                                                                   target:self 
                                                                                                   action:@selector(exibeForm)]];
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
        [self setLinhaDestaque:-1];
    }
    return self;
}

- (void)exibeForm
{
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] init];
    [form setDelegate:self];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[self tableView] reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self contatos] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celula"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celula"];
    }
    Contato *contato = [[self contatos] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[contato nome]];
    [[cell detailTextLabel] setText:[contato email]];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[self contatos] removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contato *contato = [[self contatos] objectAtIndex:[indexPath row]];
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] initWithContato:contato];
    [form setDelegate:self];
    [[self navigationController] pushViewController:form animated:YES];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Contato *contato = [[self contatos] objectAtIndex:[sourceIndexPath row]];
    [[self contatos] removeObjectAtIndex:[sourceIndexPath row]];
    [[self contatos] insertObject:contato atIndex:[destinationIndexPath row]];
}

- (void)contatoAtualizado:(Contato *) contato;
{
    linhaDestaque = [[self contatos] indexOfObject:contato];
}

- (void) contatoAdicionado:(Contato *) contato
{
    linhaDestaque = [[self contatos] indexOfObject:contato];
    [[self contatos] addObject:contato];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (linhaDestaque >= 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:linhaDestaque inSection:0];
        [[self tableView] selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [[self tableView] scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(exibeMaisAcoes:)];
    [[self tableView] addGestureRecognizer:longPress];
}

- (void)exibeMaisAcoes:(UIGestureRecognizer *)gesto
{
    if (gesto.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesto locationInView:[self tableView]];
        NSIndexPath *index = [[self tableView] indexPathForRowAtPoint:ponto];
        Contato *contato = [[self contatos] objectAtIndex:[index row]];
        
        contatoSelectionado = contato;
        
        UIActionSheet *opcoes = [[UIActionSheet alloc] initWithTitle:[contato nome] delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ligar", @"Enviar e-mail", @"Visualizar site", @"Abrir mapa", @"Enviar Tweet", nil];
        [opcoes showInView:[self view]];
    }
}

- (void)abrirComUrl:(NSString *)url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}


- (void)ligar
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"]) {
        NSString *numero = [NSString stringWithFormat:@"tel:%@", contatoSelectionado.telefone];
        [self abrirComUrl:numero];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Impossível realizar ligação" message:@"Seu dispositivo não é um iPhone" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
}


- (void)abrirSite
{
    NSString *url = contatoSelectionado.site;
    [self abrirComUrl:url];
}

- (void)mostrarMapa
{
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", contatoSelectionado.endereco] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirComUrl:url];
}

- (void)enviarEmail
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *enviadorEmail = [[MFMailComposeViewController alloc] init];
        enviadorEmail.mailComposeDelegate = self;
        [enviadorEmail setToRecipients:[NSArray arrayWithObject:contatoSelectionado.email]];
        [enviadorEmail setSubject:@"Caelum"];
        [self presentModalViewController:enviadorEmail animated:YES];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Impossível enviar E-mail" message:@"Alguma coisa está muito errada" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
}

- (void)enviarTweet
{
    TWTweetComposeViewController *tw = [[TWTweetComposeViewController alloc] init];
    [tw setInitialText:[contatoSelectionado twitter]];
    [self presentModalViewController:tw animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self enviarEmail];
            break;
        case 2:
            [self abrirSite];
            break;
        case 3:
            [self mostrarMapa];
            break;
        case 4:
            [self enviarTweet];
            break;
        default:
            break;
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

@end