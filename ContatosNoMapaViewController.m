//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 10/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ContatosNoMapaViewController.h"

@implementation ContatosNoMapaViewController

- (id)init {
    self = [super init];
    if (self) {
        UIImage *icon = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *bar = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:icon tag:0];
        [self setTabBarItem:bar];
    }
    return self;
}

@end
