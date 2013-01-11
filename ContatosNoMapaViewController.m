//
//  ContatosNoMapaViewController.m
//  ContatosIP67
//
//  Created by ios3105 on 10/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ContatosNoMapaViewController.h"
#import <MapKit/MapKit.h>
#import "Contato.h"

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

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
         
    static NSString *identifier = @"pino";
    MKPinAnnotationView *pino = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!pino) {
        pino = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    } else {
        pino.annotation = annotation;
    }
    
    Contato *contato = (Contato *) annotation;
    pino.pinColor = MKPinAnnotationColorRed;
    pino.canShowCallout = YES;
    if (contato.foto) {
        UIImageView *imagemContato = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        imagemContato.image = contato.foto;
        pino.leftCalloutAccessoryView = imagemContato;
    }
    return pino;
}

@end
