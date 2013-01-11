//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 10/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ContatosNoMapaViewController.h"
#import <MapKit/MKUserTrackingBarButtonItem.h>

@implementation ContatosNoMapaViewController
@synthesize mapView, contatos;

- (id)init {
    self = [super init];
    if (self) {
        UIImage *icon = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *bar = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:icon tag:0];
        [self setTabBarItem:bar];
        [[self navigationItem] setTitle:@"Localização"];
    }
    return self;
}

- (void)viewDidLoad
{
    MKUserTrackingBarButtonItem *button = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapView];
    [[self navigationItem] setLeftBarButtonItem:button];
}

- (void)viewDidUnload 
{
    [self setMapView:nil];
    [super viewDidUnload];
}


- (void)viewWillAppear:(BOOL)animated
{
    [self.mapView addAnnotations:contatos];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [self.mapView removeAnnotations:contatos];
}

@end
