//
//  PAGARViewController.m
//  SuikerCaja
//
//  Created by Juan Pestana on 8/7/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "PAGARViewController.h"



double precio_variable = 0.0;

@interface PAGARViewController ()
{
    sqlite3 *suiker_carrito;
    NSString *dbPathString;
    
    NSMutableArray *arrayOfPago;

    NSMutableArray *arrayPagoFinal;
    
}




@end

@implementation PAGARViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    arrayOfPago = [[NSMutableArray alloc]init];
    arrayPagoFinal = [[NSMutableArray alloc]init];
  
    
    [self createOrOpenDBVARIABLE];
    [self selfActualizarVARIABLE];
    [self createOrOpenDB];
    
    [self selfActualizar];
    
    
    
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


/////////////////////////////// BUSCAR PERECIO VARIABLE



-(void)createOrOpenDBVARIABLE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"variable.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &suiker_carrito)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS VARIABLE (ID INTEGER PRIMARY KEY AUTOINCREMENT, VARIABLE DOUBLE)";
            sqlite3_exec(suiker_carrito, sql_stmt, NULL, NULL, &error);
            sqlite3_close(suiker_carrito);
        }
    }
}



-(void)selfActualizarVARIABLE{
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM VARIABLE"];
        const char* query_sql = [querySql UTF8String];
        
        
        if (sqlite3_prepare(suiker_carrito, query_sql, -1, &statement, NULL)==SQLITE_OK) {
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                
                // MUFFINS
                NSNumber *variable = [NSNumber numberWithDouble:(double)sqlite3_column_double(statement, 1)];
                
                precio_variable = [variable doubleValue];
                
                NSLog(@"precio %f", precio_variable);
                
                
                
            }
        }
    }
    
}





/////////////////////////////////// INICIA TABLEVIEW PROPERTIES //////////////////////////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [arrayPagoFinal count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    PagoFinal *apagofinal = [arrayPagoFinal objectAtIndex:indexPath.row];
    
    NSString *titulo = [[NSString alloc]initWithFormat:@"%@ - %@  ($ %@)", apagofinal.cantidad, apagofinal.nombre, apagofinal.precio];
    
    
    cell.textLabel.text = titulo;
    return cell;
    
}

/////////////////////////////////// TERMINA TABLEVIEW PROPERTIES //////////////////////////////



-(void)selfActualizar{
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        [arrayOfPago removeAllObjects];
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM SUIKERFINAL"];
        const char* query_sql = [querySql UTF8String];
        
        
        if (sqlite3_prepare(suiker_carrito, query_sql, -1, &statement, NULL)==SQLITE_OK) {
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                
                // MUFFINS
                NSNumber *muffin_chocolate = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 1)];
                NSNumber *muffin_marmoleado = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 2)];
                NSNumber *muffin_coco = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 3)];
                NSNumber *muffin_zanahoria = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 4)];
                NSNumber *muffin_platano_betun = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 5)];
                NSNumber *muffin_platano_topping = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 6)];
                NSNumber *muffin_red_velvet = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 7)];
                NSNumber *muffin_nutella = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 8)];
                NSNumber *muffin_limon = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 9)];
                NSNumber *muffin_coffee_cake = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 10)];
                NSNumber *muffin_coffee_cake_marmoleado = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 11)];
                NSNumber *muffin_blueberry = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 12)];
                
                // MINI MUFFINS
                NSNumber *mini_muffin_chocolate = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 13)];
                NSNumber *mini_muffin_marmoleado = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 14)];
                NSNumber *mini_muffin_coco = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 15)];
                NSNumber *mini_muffin_zanahoria = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 16)];
                NSNumber *mini_muffin_platano_betun = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 17)];
                NSNumber *mini_muffin_platano_topping = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 18)];
                NSNumber *mini_muffin_red_velvet = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 19)];
                NSNumber *mini_muffin_nutella = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 20)];
                NSNumber *mini_muffin_limon = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 21)];
                NSNumber *mini_muffin_coffee_cake = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 22)];
                NSNumber *mini_muffin_coffee_cake_marmoleado = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 23)];
                NSNumber *mini_muffin_blueberry = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 24)];
                
                // PALOMITAS
                NSNumber *palomitas_grande_macadamia_arandano = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 25)];
                NSNumber *palomitas_grande_nuez_almendra = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 26)];
                NSNumber *palomitas_grande_pistache = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 27)];
                NSNumber *palomitas_grande_natural = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 28)];
                NSNumber *palomitas_grande_nuez_india = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 29)];
                NSNumber *palomitas_chica_macadamia_arandano = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 30)];
                NSNumber *palomitas_chica_nuez_almendra = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 31)];
                NSNumber *palomitas_chica_pistache = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 32)];
                NSNumber *palomitas_chica_natural = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 33)];
                NSNumber *palomitas_chica_nuez_india = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 34)];
                
                // BROWNIES / GALLETAS / CONOS
                NSNumber *brownie = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 35)];
                NSNumber *galletas_chocolate_cacahuate = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 36)];
                NSNumber *galletas_chispas_chocolate = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 37)];
                NSNumber *galletas_macadamia_chocolate_blanco = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 38)];
                NSNumber *cono_galletas = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 39)];
                
                // BOTES
                NSNumber *bote_pvc_chico = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 40)];
                NSNumber *bote_pvc_mediano = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 41)];
                NSNumber *bote_pvc_grande = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 42)];
                NSNumber *bote_vidrio_chico = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 43)];
                NSNumber *bote_vidrio_mediano = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 44)];
                NSNumber *bote_vidrio_grande = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 45)];
                
                
                // CAJAS PALOMITAS
                NSNumber *caja_palomitas_chica = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 46)];
                NSNumber *caja_palomitas_grande = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 47)];
                
                
                // MINI MUFFIN 9.16
                NSNumber *caja_mini_muffin_chocolate = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 48)];
                NSNumber *caja_mini_muffin_marmoleado = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 49)];
                NSNumber *caja_mini_muffin_coco = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 50)];
                NSNumber *caja_mini_muffin_zanahoria = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 51)];
                NSNumber *caja_mini_muffin_platano_betun = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 52)];
                NSNumber *caja_mini_muffin_platano_topping = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 53)];
                NSNumber *caja_mini_muffin_red_velvet = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 54)];
                NSNumber *caja_mini_muffin_nutella = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 55)];
                NSNumber *caja_mini_muffin_limon = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 56)];
                NSNumber *caja_mini_muffin_coffee_cake = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 57)];
                NSNumber *caja_mini_muffin_coffee_cake_marmoleado = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 58)];
                NSNumber *caja_mini_muffin_blueberry = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 59)];

                
                // BOLSAS
                NSNumber *bolsa_almendras = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 60)];
                NSNumber *bolsa_pasitas = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 61)];
                
                // REFRESCOS
                NSNumber *refrescos = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 62)];
                NSNumber *agua = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 63)];
                NSNumber *agua_coco = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 64)];
                NSNumber *perrier = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 65)];
                
                // VARIABLE
                NSNumber *variable = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 66)];

                
                
                double total_final;
                total_final = 0.0;
                
                
                // LISTA DE PRECIOS
                
                double precio_muffin = 44.0;
                
                double precio_mini_muffin = 10.0;
                
                double precio_palomitas_chica = 40.0;
                double precio_palomitas_grandes = 60.0;
                
                double precio_bote_vidrio_chico = 20.0;
                double precio_bote_vidrio_mediano = 30.0;
                double precio_bote_vidrio_grande = 40.0;
                
                double precio_bote_pvc_chico = 20.0;
                double precio_bote_pvc_mediano = 30.0;
                double precio_bote_pvc_grande = 40.0;
                
                double precio_brownie = 25.0;
                
                double precio_refrescos = 15.0;
                double precio_agua = 13.0;
                double precio_agua_coco = 25.0;
                double precio_perrier = 15.0;
                
                
                double precio_caja_palomitas_chica = 60.0;
                double precio_caja_palomitas_grande = 120.0;
                
                
                double precio_galletas = 25.0;
                
                double precio_cono_galletas = 50.0;
                
                double precio_bolsa_almendras = 90.0;
                
                double precio_bolsa_pasitas = 120.0;
                
                double precio_caja_mini_muffin = 9.16666667;
                
                
                
                //////////// AQUI ME QUEDEE
                //////////// HAY QUE REVISAR LO DEL PRECIO DE LA CAJA VARIABLE
                //////////// TAMBIEN HAY QUE VER QUE ONDA CON LAS CAJAS DE 4 MUFFINS O DE 3 CUPCAKE..
                /////////// ESTAS DOS NO ESTAN COMO PRODCTOS Y CREO QUE HAY QUE AGREGARLAS COMO PRODUCTOS PARA QUE SEA MAS FACIL

                
                // MUFFIN CHOCOLATE
                if ([muffin_chocolate intValue] > 0) {
                    
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Chocolate"];
                    [final setCantidad:muffin_chocolate];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_muffin_chocolate;
                    total_muffin_chocolate = [muffin_chocolate doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_chocolate;
                    
                    
                    
                }
                
                // MUFFIN MARMOLEADO
                if ([muffin_marmoleado intValue] > 0) {
                    
                    

                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Marmoleado"];
                    [final setCantidad:muffin_marmoleado];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];

                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_muffin_marmoleado;
                    total_muffin_marmoleado = [muffin_marmoleado doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_marmoleado;

                    
                    
                    
                }
                
                // MUFFIN COCO
                if ([muffin_coco intValue] > 0) {
                    
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Coco"];
                    [final setCantidad:muffin_coco];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];

                    
                    
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    double total_muffin_coco;
                    total_muffin_coco = [muffin_coco doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_coco;

                    
                    
                    
                    
                }
                
                // MUFFIN ZANAHORIA
                if ([muffin_zanahoria intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Zanahoria"];
                    [final setCantidad:muffin_zanahoria];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_muffin_zanahoria;
                    total_muffin_zanahoria = [muffin_zanahoria doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_zanahoria;

                    
                    
                    
                }
                
                // MUFFIN PLATANO BETUN
                if ([muffin_platano_betun intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Platano Betun"];
                    [final setCantidad:muffin_platano_betun];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    
                    double total_muffin_platano_betun;
                    total_muffin_platano_betun = [muffin_platano_betun doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_platano_betun;

                    
                }
                
                
                
                // MUFFIN PLATANO TOPPING
                if ([muffin_platano_topping intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Platano Topping"];
                    [final setCantidad:muffin_platano_topping];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    double total_muffin_platano_topping;
                    total_muffin_platano_topping = [muffin_platano_topping doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_platano_topping;

                    
                    
                    
                }
                
                
                
                // MUFFIN RED VELVET
                if ([muffin_red_velvet intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Red Velvet"];
                    [final setCantidad:muffin_red_velvet];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_muffin_red_velvet;
                    total_muffin_red_velvet = [muffin_red_velvet doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_red_velvet;

                    
                    
                }
                
                
                
                // MUFFIN NUTELLA
                if ([muffin_nutella intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Nutella"];
                    [final setCantidad:muffin_nutella];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_muffin_nutella;
                    total_muffin_nutella = [muffin_nutella doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_nutella;

                    
                    
                    
                }
                
                
                
                // MUFFIN LIMON
                if ([muffin_limon intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Limon"];
                    [final setCantidad:muffin_limon];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_muffin_limon;
                    total_muffin_limon = [muffin_limon doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_limon;

                    
                    
                    
                }
                
                
                
                
                // MUFFIN COFFE CAKE
                if ([muffin_coffee_cake intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Coffee Cake"];
                    [final setCantidad:muffin_coffee_cake];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    
                    double total_muffin_coffee_cake;
                    total_muffin_coffee_cake = [muffin_coffee_cake doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_coffee_cake;

                    
                }
                
                
                
                // MUFFIN COFFE CAKE MARMOLEADO
                if ([muffin_coffee_cake_marmoleado intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Coffee Cake Marmoleado"];
                    [final setCantidad:muffin_coffee_cake_marmoleado];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    double total_muffin_coffee_cake_marmoleado;
                    total_muffin_coffee_cake_marmoleado = [muffin_coffee_cake_marmoleado doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_coffee_cake_marmoleado;

                }
                
                
                
                // MUFFIN BLUEBERRY
                if ([muffin_blueberry intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Muffin Blueberry"];
                    [final setCantidad:muffin_blueberry];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_muffin_blueberry;
                    total_muffin_blueberry = [muffin_blueberry doubleValue] * precio_muffin;
                    
                    total_final += total_muffin_blueberry;

                    
                }
                
                //////////////////////////////////////////// MINI MUFFIN ////////////////////////////////////////////
                
                
                
                // MINI MUFFIN CHOCOLATE
                if ([mini_muffin_chocolate intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Chocolate"];
                    [final setCantidad:mini_muffin_chocolate];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_mini_muffin_chocolate;
                    total_mini_muffin_chocolate = [mini_muffin_chocolate doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_chocolate;

                    
                    
                    
                    
                }
                
                // MINI MUFFIN MARMOLEADO
                if ([mini_muffin_marmoleado intValue] > 0) {
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Marmoleado"];
                    [final setCantidad:mini_muffin_marmoleado];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    double total_mini_muffin_marmoleado;
                    total_mini_muffin_marmoleado = [mini_muffin_marmoleado doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_marmoleado;
                    
                }
                
                // MINI MUFFIN COCO
                if ([mini_muffin_coco intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Coco"];
                    [final setCantidad:mini_muffin_coco];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_mini_muffin_coco;
                    total_mini_muffin_coco = [mini_muffin_coco doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_coco;
                    
                }
                
                // MINI MUFFIN ZANAHORIA
                if ([mini_muffin_zanahoria intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Zanahoria"];
                    [final setCantidad:mini_muffin_zanahoria];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_mini_muffin_zanahoria;
                    total_mini_muffin_zanahoria = [mini_muffin_zanahoria doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_zanahoria;
                    
                }
                
                // MINI MUFFIN PLATANO BETUN
                if ([mini_muffin_platano_betun intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Platano Betun"];
                    [final setCantidad:mini_muffin_platano_betun];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_mini_muffin_platano_betun;
                    total_mini_muffin_platano_betun = [mini_muffin_platano_betun doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_platano_betun;
                    
                }
                
                
                
                // MINI MUFFIN PLATANO TOPPING
                if ([mini_muffin_platano_topping intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Platano Topping"];
                    [final setCantidad:mini_muffin_platano_topping];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_mini_muffin_platano_topping;
                    total_mini_muffin_platano_topping = [mini_muffin_platano_topping doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_platano_topping;
                    
                }
                
                
                
                // MINI MUFFIN RED VELVET
                if ([mini_muffin_red_velvet intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Red Velvet"];
                    [final setCantidad:mini_muffin_red_velvet];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_mini_muffin_red_velvet;
                    total_mini_muffin_red_velvet = [mini_muffin_red_velvet doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_red_velvet;
                    
                }
                
                
                
                // MINI MUFFIN NUTELLA
                if ([mini_muffin_nutella intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Nutella"];
                    [final setCantidad:mini_muffin_nutella];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_mini_muffin_nutella;
                    total_mini_muffin_nutella = [mini_muffin_nutella doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_nutella;
                    
                }
                
                
                
                // MINI MUFFIN LIMON
                if ([mini_muffin_limon intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Limon"];
                    [final setCantidad:mini_muffin_limon];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    double total_mini_muffin_limon;
                    total_mini_muffin_limon = [mini_muffin_limon doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_limon;
                    
                }
                
                
                
                
                // MINI MUFFIN COFFE CAKE
                if ([mini_muffin_coffee_cake intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Coffee Cake"];
                    [final setCantidad:mini_muffin_coffee_cake];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_mini_muffin_coffee_cake;
                    total_mini_muffin_coffee_cake = [mini_muffin_coffee_cake doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_coffee_cake;
                    
                }
                
                
                
                // MINI MUFFIN COFFE CAKE MARMOLEADO
                if ([mini_muffin_coffee_cake_marmoleado intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Coffee Cake Marmoleado"];
                    [final setCantidad:mini_muffin_coffee_cake_marmoleado];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_mini_muffin_coffee_cake_marmoleado;
                    total_mini_muffin_coffee_cake_marmoleado = [mini_muffin_coffee_cake_marmoleado doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_coffee_cake_marmoleado;
                    
                }
                
                
                
                // MINI MUFFIN BLUEBERRY
                if ([mini_muffin_blueberry intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Blueberry"];
                    [final setCantidad:mini_muffin_blueberry];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_mini_muffin_blueberry;
                    total_mini_muffin_blueberry = [mini_muffin_blueberry doubleValue] * precio_mini_muffin;
                    
                    total_final += total_mini_muffin_blueberry;
                    
                }
                
                
                ///////////////////////////////////////////// PALOMITAS  GRANDES  //////////////////////////////////////
                
                
                // PALOMITAS GRANDE MACADAMIA ARANDANO
                if ([palomitas_grande_macadamia_arandano intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Grande Macadamia Arandano"];
                    [final setCantidad:palomitas_grande_macadamia_arandano];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_grandes];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_palomitas_grandes_macadamia_arandano;
                    total_palomitas_grandes_macadamia_arandano = [palomitas_grande_macadamia_arandano doubleValue] * precio_palomitas_grandes;
                    
                    total_final += total_palomitas_grandes_macadamia_arandano;
                    
                }
                
                
                // PALOMITAS GRANDE NUEZ ALMENDRA
                if ([palomitas_grande_nuez_almendra intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Grande Nuez Almendra"];
                    [final setCantidad:palomitas_grande_nuez_almendra];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_grandes];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_palomitas_grandes_nuez_almedra;
                    total_palomitas_grandes_nuez_almedra = [palomitas_grande_nuez_almendra doubleValue] * precio_palomitas_grandes;
                    
                    total_final += total_palomitas_grandes_nuez_almedra;
                    
                }
                
                
                // PALOMITAS GRANDE PISTACHE
                if ([palomitas_grande_pistache intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Grande Pistache"];
                    [final setCantidad:palomitas_grande_pistache];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_grandes];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_palomitas_grandes_pistache;
                    total_palomitas_grandes_pistache = [palomitas_grande_pistache doubleValue] * precio_palomitas_grandes;
                    
                    total_final += total_palomitas_grandes_pistache;
                    
                }
                
                // PALOMITAS GRANDE NATURAL
                if ([palomitas_grande_natural intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Grande Natural"];
                    [final setCantidad:palomitas_grande_natural];
                    
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_grandes];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_palomitas_grandes_natural;
                    total_palomitas_grandes_natural = [palomitas_grande_natural doubleValue] * precio_palomitas_grandes;
                    
                    total_final += total_palomitas_grandes_natural;
                    
                }
                
                
                
                // PALOMITAS GRANDE NUEZ INDIA
                if ([palomitas_grande_nuez_india intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Grande Nuez India"];
                    [final setCantidad:palomitas_grande_nuez_india];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_grandes];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    double total_palomitas_grandes_nuez_india;
                    total_palomitas_grandes_nuez_india = [palomitas_grande_nuez_india doubleValue] * precio_palomitas_grandes;
                    
                    total_final += total_palomitas_grandes_nuez_india;
                    
                }
                
                
               
                
                
                
                /////////////////////////////////////////// PALOMITAS CHICAS /////////////////////////////////////////////
                
                
                // PALOMITAS CHICA MACADAMIA ARANDANO
                if ([palomitas_chica_macadamia_arandano intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Chica Macadamia Arandano"];
                    [final setCantidad:palomitas_chica_macadamia_arandano];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_chica];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_palomitas_chicas_macadamia_arandano;
                    total_palomitas_chicas_macadamia_arandano = [palomitas_chica_macadamia_arandano doubleValue] * precio_palomitas_chica;
                    
                    total_final += total_palomitas_chicas_macadamia_arandano;
                    
                }
                
                
                // PALOMITAS CHICA NUEZ ALMENDRA
                if ([palomitas_chica_nuez_almendra intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Chica Nuez Almendra"];
                    [final setCantidad:palomitas_chica_nuez_almendra];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_chica];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_palomitas_chicas_nuez_almendra;
                    total_palomitas_chicas_nuez_almendra = [palomitas_chica_nuez_almendra doubleValue] * precio_palomitas_chica;
                    
                    total_final += total_palomitas_chicas_nuez_almendra;

                }
                
                
                // PALOMITAS CHICA PISTACHE
                if ([palomitas_chica_pistache intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Chica Pistache"];
                    [final setCantidad:palomitas_chica_pistache];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_chica];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_palomitas_chicas_pistache;
                    total_palomitas_chicas_pistache = [palomitas_chica_pistache doubleValue] * precio_palomitas_chica;
                    
                    total_final += total_palomitas_chicas_pistache;

                    
                }
                
                // PALOMITAS CHICA NATURAL
                if ([palomitas_chica_natural intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Chica Natural"];
                    [final setCantidad:palomitas_chica_natural];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_chica];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_palomitas_chicas_natural;
                    total_palomitas_chicas_natural = [palomitas_chica_natural doubleValue] * precio_palomitas_chica;
                    
                    total_final += total_palomitas_chicas_natural;

                    
                }
                
                
                
                // PALOMITAS CHICA NUEZ INDIA
                if ([palomitas_chica_nuez_india intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Palomitas Chica Nuez India"];
                    [final setCantidad:palomitas_chica_nuez_india];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_palomitas_chica];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_palomitas_chicas_nuez_india;
                    total_palomitas_chicas_nuez_india = [palomitas_chica_nuez_india doubleValue] * precio_palomitas_chica;
                    
                    total_final += total_palomitas_chicas_nuez_india;

                    
                }
                
                
                ////////////////////////////////////// BROWNIES ///////////////////////////////////
                
                
                // BROWNIES
                if ([brownie intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Brownies"];
                    [final setCantidad:brownie];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_brownie];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_brownie;
                    total_brownie = [brownie doubleValue] * precio_brownie;
                    
                    total_final += total_brownie;

                    
                }
                
                
                
                ////////////////////////////////////// GALLETAS ///////////////////////////////////
                
                
                // GALLETAS CHOCOLATE CACAHUATE
                if ([galletas_chocolate_cacahuate intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Galletas Chocolate Cacahuate"];
                    [final setCantidad:galletas_chocolate_cacahuate];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_galletas];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_galletas_chocolate_cacahuate;
                    total_galletas_chocolate_cacahuate = [galletas_chocolate_cacahuate doubleValue] * precio_galletas;
                    
                    total_final += total_galletas_chocolate_cacahuate;
                    
                }
                
                
                // GALLETAS CHISPAS CHOCOLATE
                if ([galletas_chispas_chocolate intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Galletas Chispas Chocolate"];
                    [final setCantidad:galletas_chispas_chocolate];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_galletas];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_galletas_chispas_chocolate;
                    total_galletas_chispas_chocolate = [galletas_chispas_chocolate doubleValue] * precio_galletas;
                    
                    total_final += total_galletas_chispas_chocolate;
                    
                }
                
                
                // GALLETAS MACADAMIA CHOCOLATE BLANCO
                if ([galletas_macadamia_chocolate_blanco intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Galletas Macadamia Chocolate Blanco"];
                    [final setCantidad:galletas_macadamia_chocolate_blanco];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_galletas];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_galletas_macadamia_chocolate_blanco;
                    total_galletas_macadamia_chocolate_blanco = [galletas_macadamia_chocolate_blanco doubleValue] * precio_galletas;
                    
                    total_final += total_galletas_macadamia_chocolate_blanco;
                    
                }
                
                
                ////////////////////////////////////// CONOS ///////////////////////////////////
                
                // CONO GALLETAS
                if ([cono_galletas intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Cono Galletas"];
                    [final setCantidad:cono_galletas];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_cono_galletas];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_cono_galletas;
                    total_cono_galletas = [cono_galletas doubleValue] * precio_cono_galletas;
                    
                    total_final += total_cono_galletas;
                    
                }
                
                
                
                ////////////////////////////////////// BOTES ///////////////////////////////////
                
                
                // BOTE PVC CHICO
                if ([bote_pvc_chico intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bote PVC Chico"];
                    [final setCantidad:bote_pvc_chico];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bote_pvc_chico];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_bote_pvc_chico;
                    total_bote_pvc_chico = [bote_pvc_chico doubleValue] * precio_bote_pvc_chico;
                    
                    total_final += total_bote_pvc_chico;
                    
                }
                
                
                // BOTE PVC MEDIANO
                if ([bote_pvc_mediano intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bote PVC Mediano"];
                    [final setCantidad:bote_pvc_mediano];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bote_pvc_mediano];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_bote_pvc_mediano;
                    total_bote_pvc_mediano = [bote_pvc_mediano doubleValue] * precio_bote_pvc_mediano;
                    
                    total_final += total_bote_pvc_mediano;
                    
                }
                
                
                // BOTE PVC GRANDE
                if ([bote_pvc_grande intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bote PVC Grande"];
                    [final setCantidad:bote_pvc_grande];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bote_pvc_grande];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_bote_pvc_grande;
                    total_bote_pvc_grande = [bote_pvc_grande doubleValue] * precio_bote_pvc_grande;
                    
                    total_final += total_bote_pvc_grande;
                    
                }
                
                
                
                // BOTE VIDRIO CHICO
                if ([bote_vidrio_chico intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bote Vidrio Chico"];
                    [final setCantidad:bote_vidrio_chico];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bote_vidrio_chico];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_bote_vidrio_chico;
                    total_bote_vidrio_chico = [bote_vidrio_chico doubleValue] * precio_bote_vidrio_chico;
                    
                    total_final += total_bote_vidrio_chico;
                    
                }
                
                // BOTE VIDRIO MEDIANO
                if ([bote_vidrio_mediano intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bote Vidrio Mediano"];
                    [final setCantidad:bote_vidrio_mediano];
                    
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bote_vidrio_mediano];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    
                    double total_bote_vidrio_mediano;
                    total_bote_vidrio_mediano = [bote_vidrio_mediano doubleValue] * precio_bote_vidrio_mediano;
                    
                    total_final += total_bote_vidrio_mediano;
                    
                }
                
                
                
                // BOTE VIDRIO GRANDE
                if ([bote_vidrio_grande intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bote Vidrio Grande"];
                    [final setCantidad:bote_vidrio_grande];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bote_vidrio_grande];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_bote_vidrio_grande;
                    total_bote_vidrio_grande = [bote_vidrio_grande doubleValue] * precio_bote_vidrio_grande;
                    
                    total_final += total_bote_vidrio_grande;
                    
                }
                
                
                ////////////////////////////////////// CAJAS ///////////////////////////////////
                
                
                // CAJA PALOMITAS CHICA
                if ([caja_palomitas_chica intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Caja Palomitas Chica"];
                    [final setCantidad:caja_palomitas_chica];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_caja_palomitas_chica];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_palomitas_chica;
                    total_caja_palomitas_chica = [caja_palomitas_chica doubleValue] * precio_caja_palomitas_chica;
                    
                    total_final += total_caja_palomitas_chica;
                    
                }
                
                // CAJA PALOMITAS GRANDE
                if ([caja_palomitas_grande intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Caja Palomitas Grande"];
                    [final setCantidad:caja_palomitas_grande];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_caja_palomitas_grande];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_palomitas_grande;
                    total_caja_palomitas_grande = [caja_palomitas_grande doubleValue] * precio_caja_palomitas_grande;
                    
                    total_final += total_caja_palomitas_grande;
                    
                }
                
                
                ////////////////////////////////////// CAJA MINI MUFFIN 9.16 /////////////////////////
                
                // 9.16 CHOCOLATE
                if ([caja_mini_muffin_chocolate intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Chocolate 9.17"];
                    [final setCantidad:caja_mini_muffin_chocolate];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_chocolate;
                    total_caja_mini_muffin_chocolate = [caja_mini_muffin_chocolate doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_chocolate;
                    
                }
                
                // 9.16 MARMOLEADO
                if ([caja_mini_muffin_marmoleado intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Marmoleado 9.17"];
                    [final setCantidad:caja_mini_muffin_marmoleado];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_marmoleado;
                    total_caja_mini_muffin_marmoleado = [caja_mini_muffin_marmoleado doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_marmoleado;
                    
                }
                
                
                // 9.16 COCO
                if ([caja_mini_muffin_coco intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Coco 9.17"];
                    [final setCantidad:caja_mini_muffin_coco];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_coco;
                    total_caja_mini_muffin_coco = [caja_mini_muffin_coco doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_coco;
                    
                }
                
                
                // 9.16 ZANAHORIA
                if ([caja_mini_muffin_zanahoria intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Zanahoria 9.17"];
                    [final setCantidad:caja_mini_muffin_zanahoria];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_zanahoria;
                    total_caja_mini_muffin_zanahoria = [caja_mini_muffin_zanahoria doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_zanahoria;
                    
                }
                
                // 9.16 PLATANO BETUN
                if ([caja_mini_muffin_platano_betun intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Platano Betun 9.17"];
                    [final setCantidad:caja_mini_muffin_platano_betun];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_platano_betun;
                    total_caja_mini_muffin_platano_betun = [caja_mini_muffin_platano_betun doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_platano_betun;
                    
                }
                
                // 9.16 PLATANO TOPPING
                if ([caja_mini_muffin_platano_topping intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Platano Topping 9.17"];
                    [final setCantidad:caja_mini_muffin_platano_topping];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_platano_topping;
                    total_caja_mini_muffin_platano_topping = [caja_mini_muffin_platano_topping doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_platano_topping;
                    
                }

                // 9.16 RED VELVET
                if ([caja_mini_muffin_red_velvet intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Red Velvet 9.17"];
                    [final setCantidad:caja_mini_muffin_red_velvet];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_red_velvet;
                    total_caja_mini_muffin_red_velvet = [caja_mini_muffin_red_velvet doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_red_velvet;
                    
                }
                
                // 9.16 NUTELLA
                if ([caja_mini_muffin_nutella intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Nutella 9.17"];
                    [final setCantidad:caja_mini_muffin_nutella];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_nutella;
                    total_caja_mini_muffin_nutella = [caja_mini_muffin_nutella doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_nutella;
                    
                }
                
                
                // 9.16 LIMON
                if ([caja_mini_muffin_limon intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Limon 9.17"];
                    [final setCantidad:caja_mini_muffin_limon];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_limon;
                    total_caja_mini_muffin_limon = [caja_mini_muffin_limon doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_limon;
                    
                }
                
                
                // 9.16  COFFEE CAKE
                if ([caja_mini_muffin_coffee_cake intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Coffee Cake 9.17"];
                    [final setCantidad:caja_mini_muffin_coffee_cake];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_coffee_cake;
                    total_caja_mini_muffin_coffee_cake = [caja_mini_muffin_coffee_cake doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_coffee_cake;
                    
                }
                
                // 9.16 COFFEE CAKE MARMOLEADO
                if ([caja_mini_muffin_coffee_cake_marmoleado intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Coffee Cake Marmoleado 9.17"];
                    [final setCantidad:caja_mini_muffin_coffee_cake_marmoleado];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_coffee_cake_marmloleado;
                    total_caja_mini_muffin_coffee_cake_marmloleado = [caja_mini_muffin_coffee_cake_marmoleado doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_coffee_cake_marmloleado;
                    
                }
                
                // 9.16 BLUEBERRY
                if ([caja_mini_muffin_blueberry intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Mini Muffin Blueberry 9.17"];
                    [final setCantidad:caja_mini_muffin_blueberry];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_caja_mini_muffin];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_caja_mini_muffin_blueberry;
                    total_caja_mini_muffin_blueberry = [caja_mini_muffin_blueberry doubleValue] * precio_caja_mini_muffin;
                    
                    total_final += total_caja_mini_muffin_blueberry;
                    
                }
                
                /////////////////////////////////// VARIABLE ////////////////////////////////
                
                // VARIABLE
                if ([variable intValue] > 0) {
                    
                    
                    NSLog(@"ENTRO VARIABLE %f", precio_variable);
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Variable"];
                    [final setCantidad:variable];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.2f", precio_variable];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_variable;
                    total_variable = [variable doubleValue] * precio_variable;
                    
                    total_final += total_variable;
                    
                }
                
                
                ////////////////////////////////////// BOLSAS ///////////////////////////////////
                
                // BOLSA ALMENDRAS
                if ([bolsa_almendras intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bolsa Almendras"];
                    [final setCantidad:bolsa_almendras];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bolsa_almendras];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_bolsa_almendras;
                    total_bolsa_almendras = [bolsa_almendras doubleValue] * precio_bolsa_almendras;
                    
                    total_final += total_bolsa_almendras;
                    
                }
                
                
                // BOLSA PASITAS
                if ([bolsa_pasitas intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Bolsa Pasitas"];
                    [final setCantidad:bolsa_pasitas];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_bolsa_pasitas];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_bolsa_pasitas;
                    total_bolsa_pasitas = [bolsa_pasitas doubleValue] * precio_bolsa_pasitas;
                    
                    total_final += total_bolsa_pasitas;
                    
                }
                
                ////////////////////////////////////// BEBIDAS ///////////////////////////////////
                
                
                // REFRESCOS
                if ([refrescos intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Refrescos"];
                    [final setCantidad:refrescos];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_refrescos];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_refrescos;
                    total_refrescos = [refrescos doubleValue] * precio_refrescos;
                    
                    total_final += total_refrescos;
                    
                }
                
                // AGUA
                if ([agua intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Agua"];
                    [final setCantidad:agua];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_agua];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    
                    double total_agua;
                    total_agua = [agua doubleValue] * precio_agua;
                    
                    total_final += total_agua;
                    
                }
                
                
                // AGUA COCO
                if ([agua_coco intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Agua Coco"];
                    [final setCantidad:agua_coco];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_agua_coco];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_agua_coco;
                    total_agua_coco = [agua_coco doubleValue] * precio_agua_coco;
                    
                    total_final += total_agua_coco;
                    
                }
                
                // PERRIER
                if ([perrier intValue] > 0) {
                    
                    
                    PagoFinal *final = [[PagoFinal alloc]init];
                    
                    [final setNombre:@"Perrier"];
                    [final setCantidad:perrier];
                    
                    NSString *precio = [NSString stringWithFormat:@"%0.1f", precio_perrier];
                    [final setPrecio:precio];
                    
                    [arrayPagoFinal addObject:final];
                    
                    double total_perrier;
                    total_perrier = [perrier doubleValue] * precio_perrier;
                    
                    total_final += total_perrier;
                    
                }
                
                
                _label.text = [NSString stringWithFormat:@"%0.2f", total_final];

                
            }
        }
    }
    
    
    [[self tableView]reloadData];
    
    

    
}





-(void)createOrOpenDBPAGOS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"total.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &suiker_carrito)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS TOTAL (ID INTEGER PRIMARY KEY AUTOINCREMENT, TOTAL DOUBLE)";
            sqlite3_exec(suiker_carrito, sql_stmt, NULL, NULL, &error);
            sqlite3_close(suiker_carrito);
        }
    }
}



- (void)inicializarDBPAGOS{
    
    
    double cero = 0.0;
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO TOTAL (TOTAL) values ('%f')", cero];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE PAGOS INICIALIZADA");
            
        }
        
        sqlite3_close(suiker_carrito);
    }
    
}





- (void)reiniciarDBPAGOS{
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM TOTAL"];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            
            NSLog(@"BASE PAGOS REINICIADA");
            
        }
        sqlite3_close(suiker_carrito);
    }
    
}




- (IBAction)pagar:(id)sender {
    
    
    [self createOrOpenDBPAGOS];
    [self reiniciarDBPAGOS];
    [self inicializarDBPAGOS];
    
    
    double total = [self.label.text doubleValue];
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &suiker_carrito)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE TOTAL SET TOTAL = TOTAL + %f", total];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        
        if (sqlite3_exec(suiker_carrito, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE PAGOS AGREGADO");
            
            
        }
        sqlite3_close(suiker_carrito);
    }
    

    
    
    
}

@end
