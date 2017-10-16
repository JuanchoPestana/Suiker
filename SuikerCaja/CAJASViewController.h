//
//  CAJASViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface CAJASViewController : ViewController


@property (weak, nonatomic) IBOutlet UILabel *chocolate;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_chocolate;
- (IBAction)chocolate:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *marmoleado;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_marmoleado;
- (IBAction)marmoleado:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *coco;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_coco;
- (IBAction)coco:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *zanahoria;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_zanahoria;
- (IBAction)zanahoria:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *platanoBetun;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_platano_betun;
- (IBAction)platano_betun:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *platanoTopping;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_platano_topping;
- (IBAction)platano_topping:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *red_velvet;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_red_velvet;
- (IBAction)red_velvet:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *nutella;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_nutella;
- (IBAction)nutella:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *limon;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_limon;
- (IBAction)limon:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *coffee_cake;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_coffee_cake;
- (IBAction)coffee_cake:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *coffee_cake_marmoleado;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_coffee_cake_marmoleado;
- (IBAction)coffee_cake_marmoleado:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *blueberry;
@property (weak, nonatomic) IBOutlet UIStepper *stepper_blueberry;
- (IBAction)blueberry:(id)sender;




- (IBAction)carritoFinal:(id)sender;




@end
