//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <Twitter/TWTweetComposeViewController.h>
#import "ListaContatosProtocol.h"
#import "ContatoCell.h"

@interface ListaContatosViewController : UITableViewController <ListaContatosProtocol, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
{
    Contato* contatoSelectionado;
}

@property (weak, nonatomic) NSMutableArray *contatos;
@property (weak, nonatomic) NSManagedObjectContext *contexto;
@property NSInteger linhaDestaque;

- (void)exibeMaisAcoes:(UIGestureRecognizer *) gesto;
@end
