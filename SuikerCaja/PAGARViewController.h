//
//  PAGARViewController.h
//  SuikerCaja
//
//  Created by Juan Pestana on 8/7/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"
#import "Pago.h"
#import "PagoFinal.h"






@interface PAGARViewController : ViewController <UITableViewDelegate, UITableViewDataSource>



@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)pagar:(id)sender;


@end
