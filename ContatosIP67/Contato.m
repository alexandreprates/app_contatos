//
//  Contato.m
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@dynamic nome, telefone, email, endereco, site, latitude, longitude;
@synthesize foto;

- (NSString *) description
{
    NSString *text = [[NSString alloc] initWithFormat:@"contato:\nnome: %@\ntelefone: %@\nemail: %@\nendereco: %@\nsite: %@\n twitter: %@", self.nome, self.telefone, self.email, self.endereco, self.site, self.twitter];
    return text;
}

- (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake([self.latitude floatValue], [self.longitude floatValue]);
}

- (NSString *) title
{
    return self.nome;
}

- (NSString *) subtitle
{
    return self.endereco;
}

@end
