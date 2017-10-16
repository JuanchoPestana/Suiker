//
//  MINI_MUFFINViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/6/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "MINI_MUFFINViewController.h"

@interface MINI_MUFFINViewController (){
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
}

@end

@implementation MINI_MUFFINViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createOrOpenDB];


    _mini_muffin_chocolate.text = @"0";
    _mini_muffin_marmoleado.text = @"0";
    _mini_muffin_coco.text = @"0";
    _mini_muffin_zanahoria.text = @"0";
    _mini_muffin_platanoBetun.text = @"0";
    _mini_muffin_platanoTopping.text = @"0";
    _mini_muffin_redVelvet.text = @"0";
    _mini_muffin_nutella.text = @"0";
    _mini_muffin_limon.text = @"0";
    _mini_muffin_coffeeCake.text = @"0";
    _mini_muffin_coffeeCakeMarmoleado.text = @"0";
    _mini_muffin_blueberry.text = @"0";



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)createOrOpenDB{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"suikerFinal.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &suiker_carrito)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS SUIKERFINAL (ID INTEGER PRIMARY KEY AUTOINCREMENT, MUFFIN_CHOCOLATE INT, MUFFIN_MARMOLEADO INT, MUFFIN_COCO INT, MUFFIN_ZANAHORIA INT, MUFFIN_PLATANO_BETUN INT, MUFFIN_PLATANO_TOPPING INT, MUFFIN_RED_VELVET INT, MUFFIN_NUTELLA INT, MUFFIN_LIMON INT, MUFFIN_COFFEE_CAKE INT, MUFFIN_COFFEE_CAKE_MARMOLEADO INT, MUFFIN_BLUEBERRY INT, MINI_MUFFIN_CHOCOLATE INT, MINI_MUFFIN_MARMOLEADO INT, MINI_MUFFIN_COCO INT, MINI_MUFFIN_ZANAHORIA INT, MINI_MUFFIN_PLATANO_BETUN INT, MINI_MUFFIN_PLATANO_TOPPING INT, MINI_MUFFIN_RED_VELVET INT, MINI_MUFFIN_NUTELLA INT, MINI_MUFFIN_LIMON INT, MINI_MUFFIN_COFFEE_CAKE INT, MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO INT, MINI_MUFFIN_BLUEBERRY INT, PALOMITAS_GRANDE_MACADAMIA_ARANDANO INT, PALOMITAS_GRANDE_NUEZ_ALMENDRA INT, PALOMITAS_GRANDE_PISTACHE INT, PALOMITAS_GRANDE_NATURAL INT, PALOMITAS_GRANDE_NUEZ_INDIA INT, PALOMITAS_CHICA_MACADAMIA_ARANDANO INT, PALOMITAS_CHICA_NUEZ_ALMENDRA INT, PALOMITAS_CHICA_PISTACHE INT, PALOMITAS_CHICA_NATURAL INT, PALOMITAS_CHICA_NUEZ_INDIA INT, BROWNIE INT, GALLETAS_CHOCOLATE_CACAHUATE INT, GALLETAS_CHISPAS_CHOCOLATE INT, GALLETAS_MACADAMIA_CHOCOLATE_BLANCO INT, CONO_GALLETAS INT, BOTE_PVC_CHICO INT, BOTE_PVC_MEDIANO INT, BOTE_PVC_GRANDE INT, BOTE_VIDRIO_CHICO INT, BOTE_VIDRIO_MEDIANO INT, BOTE_VIDRIO_GRANDE INT, CAJA_PALOMITAS_CHICA INT, CAJA_PALOMITAS_GRANDE INT, CAJA_MINI_MUFFIN_CHOCOLATE INT, CAJA_MINI_MUFFIN_MARMOLEADO INT, CAJA_MINI_MUFFIN_COCO INT, CAJA_MINI_MUFFIN_ZANAHORIA INT, CAJA_MINI_MUFFIN_PLATANO_BETUN INT, CAJA_MINI_MUFFIN_PLATANO_TOPPING INT, CAJA_MINI_MUFFIN_RED_VELVET INT, CAJA_MINI_MUFFIN_NUTELLA INT, CAJA_MINI_MUFFIN_LIMON INT, CAJA_MINI_MUFFIN_COFFEE_CAKE INT, CAJA_MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO INT, CAJA_MINI_MUFFIN_BLUEBERRY INT, BOLSA_ALMENDRAS INT, BOLSA_PASITAS INT, REFRESCOS INT, AGUA INT, AGUA_COCO INT, PERRIER INT, VARIABLE INT)";
            sqlite3_exec(suiker_carrito, sql_stmt, NULL, NULL, &error);
            sqlite3_close(suiker_carrito);
        }
    }
}








- (IBAction)mini_muffin_chocolate:(id)sender {
    double valor = [_stepper_mini_muffin_chocolate value];
    
    [_mini_muffin_chocolate
     setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}
- (IBAction)mini_muffin_marmoleado:(id)sender {
    
    double valor = [_stepper_mini_muffin_marmoleado value];
    
[_mini_muffin_marmoleado setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_coco:(id)sender {
    
    double valor = [_stepper_mini_muffin_coco value];
    
    [_mini_muffin_coco setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_zanahoria:(id)sender {
    
    double valor = [_stepper_mini_muffin_zanahoria value];
    
    [_mini_muffin_zanahoria setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}
- (IBAction)mini_muffin_platanoBetun:(id)sender {
    
    double valor = [_stepper_mini_muffin_platanoBetun value];
    
    [_mini_muffin_platanoBetun setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_platanoTopping:(id)sender {
    
    double valor = [_stepper_mini_muffin_platanoTopping value];
    
    [_mini_muffin_platanoTopping setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_redVelvet:(id)sender {
    
    double valor = [_stepper_mini_muffin_redVelvet value];
    
    [_mini_muffin_redVelvet setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_nutella:(id)sender {
    
    double valor = [_stepper_mini_muffin_nutella value];
    
    [_mini_muffin_nutella setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_limon:(id)sender {
    
    double valor = [_stepper_mini_muffin_limon value];
    
    [_mini_muffin_limon setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_coffeeCake:(id)sender {
    
    double valor = [_stepper_mini_muffin_coffeeCake value];
    
    [_mini_muffin_coffeeCake setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_coffeeCakeMarmoleado:(id)sender {
    
    double valor = [_stepper_mini_muffin_coffeeCakeMarmoleado value];
    
    [_mini_muffin_coffeeCakeMarmoleado setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)mini_muffin_blueberry:(id)sender {
    
    
    double valor = [_stepper_mini_muffin_blueberry value];
    
    [_mini_muffin_blueberry setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}



- (IBAction)carritoFinal:(id)sender {
    
    
    
    
    
    int chocolate = [self.mini_muffin_chocolate.text intValue];
    int marmoleado = [self.mini_muffin_marmoleado.text intValue];
    int coco = [self.mini_muffin_coco.text intValue];
    int zanahoria = [self.mini_muffin_zanahoria.text intValue];
    int platano_betun = [self.mini_muffin_platanoBetun.text intValue];
    int platano_topping = [self.mini_muffin_platanoTopping.text intValue];
    int red_velvet = [self.mini_muffin_redVelvet.text intValue];
    int nutella = [self.mini_muffin_nutella.text intValue];
    int limon = [self.mini_muffin_limon.text intValue];
    int coffee_cake = [self.mini_muffin_coffeeCake.text intValue];
    int coffee_cake_marmoleado = [self.mini_muffin_coffeeCakeMarmoleado.text intValue];
    int blueberry = [self.mini_muffin_blueberry.text intValue];
    
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE SUIKERFINAL SET MINI_MUFFIN_CHOCOLATE = MINI_MUFFIN_CHOCOLATE + %d, MINI_MUFFIN_MARMOLEADO = MINI_MUFFIN_MARMOLEADO + %d, MINI_MUFFIN_COCO = MINI_MUFFIN_COCO + %d, MINI_MUFFIN_ZANAHORIA = MINI_MUFFIN_ZANAHORIA + %d, MINI_MUFFIN_PLATANO_BETUN = MINI_MUFFIN_PLATANO_BETUN + %d, MINI_MUFFIN_PLATANO_TOPPING = MINI_MUFFIN_PLATANO_TOPPING + %d, MINI_MUFFIN_RED_VELVET = MINI_MUFFIN_RED_VELVET + %d, MINI_MUFFIN_NUTELLA = MINI_MUFFIN_NUTELLA + %d, MINI_MUFFIN_LIMON = MINI_MUFFIN_LIMON + %d, MINI_MUFFIN_COFFEE_CAKE = MINI_MUFFIN_COFFEE_CAKE + %d, MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO = MINI_MUFFIN_COFFEE_CAKE_MARMOLEADO + %d, MINI_MUFFIN_BLUEBERRY = MINI_MUFFIN_BLUEBERRY + %d", chocolate, marmoleado, coco, zanahoria, platano_betun, platano_topping, red_velvet, nutella, limon, coffee_cake, coffee_cake_marmoleado, blueberry];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"AGREGADO MINI MUFFIN");
            
            
        }
        sqlite3_close(suiker_carrito);
    }
    
    
    

}
@end
