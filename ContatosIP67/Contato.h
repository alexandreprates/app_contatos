//
//  Contato.h
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject <NSCoding>

@property (strong) NSString *nome;
@property (strong) NSString *telefone;
@property (strong) NSString *email;
@property (strong) NSString *endereco;
@property (strong) NSString *site;
@property (strong) NSString *twitter;
@property (strong) NSNumber *latitude;
@property (strong) NSNumber *longitude;
@property (strong) UIImage *foto;

@end