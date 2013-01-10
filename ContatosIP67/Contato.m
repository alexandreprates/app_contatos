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
@synthesize twitter = _twitter;
@synthesize foto = _foto;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self nome] forKey:@"nome"];
    [aCoder encodeObject:[self telefone] forKey:@"telefone"];
    [aCoder encodeObject:[self email] forKey:@"email"];
    [aCoder encodeObject:[self endereco] forKey:@"endereco"];
    [aCoder encodeObject:[self site] forKey:@"site"];
    [aCoder encodeObject:[self twitter] forKey:@"twitter"];
    [aCoder encodeObject:[self foto] forKey:@"foto"];
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
        [self setTwitter:[coder decodeObjectForKey:@"twitter"]];
        [self setFoto:[coder decodeObjectForKey:@"foto"]];
    }
    return self;
}

- (NSString *) description
{
    NSString *text = [[NSString alloc] initWithFormat:@"contato:\nnome: %@\ntelefone: %@\nemail: %@\nendereco: %@\nsite: %@\n twitter: %@", self.nome, self.telefone, self.email, self.endereco, self.site, self.twitter];
    return text;
}

@end
