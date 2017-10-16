//
//  BOLSASViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"

@interface BOLSASViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *almendra_chocolate;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_almendra_chocolate;
- (IBAction)almendra_chocolate:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *pasas_chocolate;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_pasas_chocolate;
- (IBAction)pasas_chocolate:(id)sender;





- (IBAction)carritoFinal:(id)sender;



@end
