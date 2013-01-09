//
//  Contato.m
//  ContatosIP67
//
//  Created by ios3105 on 08/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@synthesize nome = _nome;
@synthesize telefone = _telefone;
@synthesize email = _email;
@synthesize endereco = _endereco;
@synthesize site = _site;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self nome] forKey:@"nome"];
    [aCoder encodeObject:[self telefone] forKey:@"telefone"];
    [aCoder encodeObject:[self email] forKey:@"email"];
    [aCoder encodeObject:[self endereco] forKey:@"endereco"];
    [aCoder encodeObject:[self site] forKey:@"site"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        [self setNome:[coder decodeObjectForKey:@"nome"]];
        [self setTelefone:[coder decodeObjectForKey:@"telefone"]];
        [self setEmail:[coder decodeObjectForKey:@"email"]];
        [self setEndereco:[coder decodeObjectForKey:@"endereco"]];
        [self setSite:[coder decodeObjectForKey:@"site"]];
    }
    return self;
}

- (NSString *) description
{
    NSString *text = [[NSString alloc] initWithFormat:@"contato:\nnome: %@\ntelefone: %@\nemail: %@\nendereco: %@\nsite: %@", self.nome, self.telefone, self.email, self.endereco, self.site];
    return text;
}

@end
