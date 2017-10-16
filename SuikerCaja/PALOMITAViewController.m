//
//  PALOMITAViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/7/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "PALOMITAViewController.h"

@interface PALOMITAViewController (){
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
}

@end

@implementation PALOMITAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createOrOpenDB];
    
    _grande_macadamia_arandano.text = @"0";
    _grande_pistache.text = @"0";
    _grande_nuez_almendra.text = @"0";
    _grande_natural.text = @"0";
    _grande_nuez_india.text = @"0";
    
    _chica_macadamia_arandano.text = @"0";
    _chica_pistache.text = @"0";
    _chica_nuez_almendra.text = @"0";
    _chica_natural.text = @"0";
    _chica_nuez_india.text = @"0";
    
    
    
    
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






- (IBAction)grande_macadamia_arandano:(id)sender {
    
    
    double valor = [_steper_grande_macadamia_arandano value];
    
    [_grande_macadamia_arandano setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
    
}
- (IBAction)grande_pistache:(id)sender {
    
    
    double valor = [_stepper_grande_pistache value];
    
    [_grande_pistache setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}
- (IBAction)grande_nuez_almendra:(id)sender {
    
    
    double valor = [_stepper_grande_nuez_almendra value];
    
    [_grande_nuez_almendra setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)grande_natural:(id)sender {
    
    
    double valor = [_stepper_grande_natural value];
    
    [_grande_natural setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)grande_nuez_india:(id)sender {
    
    
    double valor = [_stepper_grande_nuez_india value];
    
    [_grande_nuez_india setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}
- (IBAction)chica_macadamia_arandano:(id)sender {
    
    
    double valor = [_stepper_chica_macadamia_arandano value];
    
    [_chica_macadamia_arandano setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)chica_nuez_almendra:(id)sender {
    
    
    double valor = [_stepper_chica_nuez_almendra value];
    
    [_chica_nuez_almendra setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}
- (IBAction)chica_pistache:(id)sender {
    
    
    double valor = [_stepper_chica_pistache value];
    
    [_chica_pistache setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

    
}
- (IBAction)chica_natural:(id)sender {
    
    
    double valor = [_stepper_chica_natural value];
    
    [_chica_natural setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}
- (IBAction)chica_nuez_india:(id)sender {
    
    
    double valor = [_stepper_chica_nuez_india value];
    
    [_chica_nuez_india setText:[NSString stringWithFormat:@"%d", (int)valor]];
    

}

- (IBAction)carrito:(id)sender {
    
    
    
    
    
    int grande_macadamia_arandano = [self.grande_macadamia_arandano.text intValue];
    int grande_pistache = [self.grande_pistache.text intValue];
    int grande_nuez_almendra = [self.grande_nuez_almendra.text intValue];
    int grande_natural = [self.grande_natural.text intValue];
    int grande_nuez_india = [self.grande_nuez_india.text intValue];
   
    int chica_macadamia_arandano = [self.chica_macadamia_arandano.text intValue];
    int chica_pistache = [self.chica_pistache.text intValue];
    int chica_nuez_almendra = [self.chica_nuez_almendra.text intValue];
    int chica_natural = [self.chica_natural.text intValue];
    int chica_nuez_india = [self.chica_nuez_india.text intValue];
    

    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE SUIKERFINAL SET PALOMITAS_GRANDE_MACADAMIA_ARANDANO = PALOMITAS_GRANDE_MACADAMIA_ARANDANO + %d, PALOMITAS_GRANDE_PISTACHE = PALOMITAS_GRANDE_PISTACHE + %d, PALOMITAS_GRANDE_NUEZ_ALMENDRA = PALOMITAS_GRANDE_NUEZ_ALMENDRA + %d, PALOMITAS_GRANDE_NATURAL = PALOMITAS_GRANDE_NATURAL + %d, PALOMITAS_GRANDE_NUEZ_INDIA = PALOMITAS_GRANDE_NUEZ_INDIA + %d, PALOMITAS_CHICA_MACADAMIA_ARANDANO = PALOMITAS_CHICA_MACADAMIA_ARANDANO + %d, PALOMITAS_CHICA_PISTACHE = PALOMITAS_CHICA_PISTACHE + %d, PALOMITAS_CHICA_NUEZ_ALMENDRA = PALOMITAS_CHICA_NUEZ_ALMENDRA + %d, PALOMITAS_CHICA_NATURAL = PALOMITAS_CHICA_NATURAL + %d, PALOMITAS_CHICA_NUEZ_INDIA = PALOMITAS_CHICA_NUEZ_INDIA + %d", grande_macadamia_arandano, grande_pistache, grande_nuez_almendra, grande_natural, grande_nuez_india, chica_macadamia_arandano, chica_pistache, chica_nuez_almendra, chica_natural, chica_nuez_india];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"AGREGADO PALOMITAS");
            
            
        }
        sqlite3_close(suiker_carrito);
    }
    
    

    
    
    
    
    
    
}

- (IBAction)carritoFinal:(id)sender {
    
    
    
    
    int grande_macadamia_arandano = [self.grande_macadamia_arandano.text intValue];
    int grande_pistache = [self.grande_pistache.text intValue];
    int grande_nuez_almendra = [self.grande_nuez_almendra.text intValue];
    int grande_natural = [self.grande_natural.text intValue];
    int grande_nuez_india = [self.grande_nuez_india.text intValue];
    
    int chica_macadamia_arandano = [self.chica_macadamia_arandano.text intValue];
    int chica_pistache = [self.chica_pistache.text intValue];
    int chica_nuez_almendra = [self.chica_nuez_almendra.text intValue];
    int chica_natural = [self.chica_natural.text intValue];
    int chica_nuez_india = [self.chica_nuez_india.text intValue];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE SUIKERFINAL SET PALOMITAS_GRANDE_MACADAMIA_ARANDANO = PALOMITAS_GRANDE_MACADAMIA_ARANDANO + %d, PALOMITAS_GRANDE_PISTACHE = PALOMITAS_GRANDE_PISTACHE + %d, PALOMITAS_GRANDE_NUEZ_ALMENDRA = PALOMITAS_GRANDE_NUEZ_ALMENDRA + %d, PALOMITAS_GRANDE_NATURAL = PALOMITAS_GRANDE_NATURAL + %d, PALOMITAS_GRANDE_NUEZ_INDIA = PALOMITAS_GRANDE_NUEZ_INDIA + %d, PALOMITAS_CHICA_MACADAMIA_ARANDANO = PALOMITAS_CHICA_MACADAMIA_ARANDANO + %d, PALOMITAS_CHICA_PISTACHE = PALOMITAS_CHICA_PISTACHE + %d, PALOMITAS_CHICA_NUEZ_ALMENDRA = PALOMITAS_CHICA_NUEZ_ALMENDRA + %d, PALOMITAS_CHICA_NATURAL = PALOMITAS_CHICA_NATURAL + %d, PALOMITAS_CHICA_NUEZ_INDIA = PALOMITAS_CHICA_NUEZ_INDIA + %d", grande_macadamia_arandano, grande_pistache, grande_nuez_almendra, grande_natural, grande_nuez_india, chica_macadamia_arandano, chica_pistache, chica_nuez_almendra, chica_natural, chica_nuez_india];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"AGREGADO PALOMITAS");
            
            
        }
        sqlite3_close(suiker_carrito);
    }
    
    
    
    
    
    
    

}
@end
