//
//  BEBIDAViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface BEBIDAViewController : ViewController




@property (weak, nonatomic) IBOutlet UILabel *refrescos;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_refrescos;
- (IBAction)refrescos:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *agua;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_agua;
- (IBAction)agua:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *agua_coco;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_agua_coco;
- (IBAction)agua_coco:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *perrier;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_perrier;
- (IBAction)perrier:(id)sender;





- (IBAction)carritoFinal:(id)sender;


@end
