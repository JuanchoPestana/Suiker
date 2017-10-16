//
//  MUFFINViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/6/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface MUFFINViewController : ViewController



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_chocolate;
@property (weak, nonatomic) IBOutlet UILabel *muffin_chocolate;
- (IBAction)muffin_chocolate:(id)sender;




@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_marmoleado;
@property (weak, nonatomic) IBOutlet UILabel *muffin_marmoleado;
- (IBAction)muffin_marmoleado:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_coco;
@property (weak, nonatomic) IBOutlet UILabel *muffin_coco;
- (IBAction)muffin_coco:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_zanahoria;
@property (weak, nonatomic) IBOutlet UILabel *muffin_zanahoria;
- (IBAction)muffin_zanahoria:(id)sender;


@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_platanoBetun;
@property (weak, nonatomic) IBOutlet UILabel *muffin_platanoBetun;
- (IBAction)muffin_platanoBetun:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_platanoTopping;
@property (weak, nonatomic) IBOutlet UILabel *muffin_platanoTopping;
- (IBAction)muffin_platanoTopping:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_redVelvet;
@property (weak, nonatomic) IBOutlet UILabel *muffin_redVelvet;
- (IBAction)muffin_redVelvet:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_nutella;
@property (weak, nonatomic) IBOutlet UILabel *muffin_nutella;
- (IBAction)muffin_nutella:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_limon;
@property (weak, nonatomic) IBOutlet UILabel *muffin_limon;
- (IBAction)muffin_limon:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_coffeeCake;
@property (weak, nonatomic) IBOutlet UILabel *muffin_coffeeCake;
- (IBAction)muffin_coffeeCake:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_coffeeCakeMarmoleado;
@property (weak, nonatomic) IBOutlet UILabel *muffin_coffeeCakeMarmoleado;
- (IBAction)muffin_coffeeCakeMarmoleado:(id)sender;



@property (weak, nonatomic) IBOutlet UIStepper *stepper_muffin_blueberry;
@property (weak, nonatomic) IBOutlet UILabel *muffin_blueberry;
- (IBAction)muffin_blueberry:(id)sender;





- (IBAction)carritoFInal:(id)sender;







@end
