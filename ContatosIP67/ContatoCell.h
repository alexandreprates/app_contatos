//
//  ContatoCell.h
//  ContatosIP67
//
//  Created by ios3105 on 10/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContatoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *Nome;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;

@end
