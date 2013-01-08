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

- (id)init {
    self = [super init];
    if (self) {
        [[self navigationItem] setTitle: @"Contatos"];
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeForm)]];
    }
    return self;
}

- (void) exibeForm {
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] init];
    [form setContatos: [self contatos]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:form];
    [self presentModalViewController:nav animated:YES];
}

- (void) viewWillAppear:(BOOL)animated {
    [[self tableView] reloadData];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self contatos] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celula"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celula"];
    }
    Contato *contato = [[self contatos] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[contato nome]];
    [[cell detailTextLabel] setText:[contato email]];
    return cell;
}

@end
