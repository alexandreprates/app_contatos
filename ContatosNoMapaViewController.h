//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios3105 on 10/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MKMapView.h>

@interface ContatosNoMapaViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSMutableArray *contatos;

@end
