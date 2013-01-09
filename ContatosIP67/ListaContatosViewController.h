//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListaContatosProtocol.h"

@interface ListaContatosViewController : UITableViewController <ListaContatosProtocol, UIActionSheetDelegate>
{
    Contato* contatoSelectionado;
}

@property (weak, nonatomic) NSMutableArray *contatos;
@property NSUInteger *linhaDestaque;

- (void)exibeMaisAcoes:(UIGestureRecognizer *) gesto;

@end
