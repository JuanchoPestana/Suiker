//
//  BOTE_VIDRIOViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/8/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "BOTE_VIDRIOViewController.h"

@interface BOTE_VIDRIOViewController (){
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
}

@end

@implementation BOTE_VIDRIOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createOrOpenDB];
    
    
    _chico.text = @"0";
    _mediano.text = @"0";
    _grande.text = @"0";
    
    
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






- (IBAction)chico:(id)sender {
    
    double valor = [_stepper_chico value];
    
    [_chico setText:[NSString stringWithFormat:@"%d", (int)valor]];
}
- (IBAction)mediano:(id)sender {
    
    double valor = [_stepper_mediano value];
    
    [_mediano setText:[NSString stringWithFormat:@"%d", (int)valor]];
}
- (IBAction)grande:(id)sender {
    
    double valor = [_stepper_grande value];
    
    [_grande setText:[NSString stringWithFormat:@"%d", (int)valor]];
}



- (IBAction)carritoFinal:(id)sender {
    
    
    
    
    int chico = [self.chico.text intValue];
    int mediano = [self.mediano.text intValue];
    int grande = [self.grande.text intValue];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE SUIKERFINAL SET BOTE_VIDRIO_CHICO = BOTE_VIDRIO_CHICO + %d, BOTE_VIDRIO_MEDIANO = BOTE_VIDRIO_MEDIANO + %d, BOTE_VIDRIO_GRANDE = BOTE_VIDRIO_GRANDE + %d", chico, mediano, grande];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"AGREGADO BOTE VIDRIO");
            
            
        }
        sqlite3_close(suiker_carrito);
    }
    
    
    
    
    
    

    
    
}
@end
