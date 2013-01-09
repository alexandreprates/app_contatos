//
//  ListaContatosProtocol.h
//  ContatosIP67
//
//  Created by ios3105 on 09/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@protocol ListaContatosProtocol <NSObject>

- (void)contatoAtualizado:(Contato *) contato;
- (void)contatoAdicionado:(Contato *) contato;

@end
