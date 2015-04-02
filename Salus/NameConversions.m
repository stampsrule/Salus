//
//  NameConversions.m
//  Salus
//
//  Created by Daniel Bell on 2015-03-29.
//  Copyright (c) 2015 BellTechMedia. All rights reserved.
//

#import "NameConversions.h"

@implementation NameConversions

@synthesize nameTable;

+(NSString *)convert: (NSString *)name{
    NSMutableDictionary *mutableNameTable = [[NSMutableDictionary alloc] init];
    [mutableNameTable setObject:@"AB" forKey:@"Alberta"];
    [mutableNameTable setObject:@"BC" forKey:@"British Columbia"];
    [mutableNameTable setObject:@"SK" forKey:@"Saskatchewan"];
    [mutableNameTable setObject:@"MB" forKey:@"Manitoba"];
    [mutableNameTable setObject:@"NB" forKey:@"New Brunswick"];
    [mutableNameTable setObject:@"NL" forKey:@"Newfoundland and Labrador"];
    [mutableNameTable setObject:@"NS" forKey:@"Nova Scotia"];
    [mutableNameTable setObject:@"ON" forKey:@"Ontario"];
    [mutableNameTable setObject:@"PE" forKey:@"Prince Edward Island"];
    [mutableNameTable setObject:@"QC" forKey:@"Quebec"];
    
    NSString *shortName = [mutableNameTable objectForKey:name];
    
    return shortName;
}

+(NSArray *)getKeyArray{
    NSArray *keys = [NSArray arrayWithObjects:
                        @"Anth",
                        @"BA",
                        @"BCG",
                        @"CHO",
                        @"Chol-Ecol-O",
                        @"DA",
                        @"dTap",
                        @"DTaP-IPV",
                        @"DTaP-IPV-Hib",
                        @"FLU",
                        @"H1N1-09-AD",
                        @"H1N1-09",
                        @"HABV",
                        @"HA-Typh-I",
                        @"HAV",
                        @"HBIG",
                        @"HBTmf",
                        @"HBV",
                        @"HBVD",
                        @"Hib",
                        @"HPV",
                        @"IG",
                        @"IPV",
                        @"JEV",
                        @"LYM",
                        @"MenC-ACYW",
                        @"MenconC",
                        @"MENING",
                        @"MMR",
                        @"MMR-Var",
                        @"PNEUMO-P",
                        @"PPD",
                        @"PNEU-C",
                        @"RAB",
                        @"RIG",
                        @"Rot",
                        @"RSVIg",
                        @"Sma",
                        @"Td",
                        @"TdP",
                        @"TIG",
                        @"TYO",
                        @"TYVI",
                        @"Var-S",
                        @"VZ",
                        @"VZIG",
                        @"YF",
                        nil
                     ];
    return keys;
    
}

+(NSArray *)getObjectArray{
    NSArray *objects = [NSArray arrayWithObjects:
                        @"Anthrax",
                        @"Botulism Antitoxin",
                        @"Bacillus Calmette Guerin (TB)",
                        @"Cholera – Oral",
                        @"Cholera - E.coli - Oral",
                        @"Diphtheria Antitoxin",
                        @"Diphtheria/Tetanus/Acellular Pertussis (Adacel)",
                        @"Diphtheria/Tetanus/Acellular Pertussis/IPV (Quadracel)",
                        @"Diphtheria/Tetanus/Acellular Pertussis/IPV/Hib (Pentacel)",
                        @"Influenza",
                        @"Adjuvanted Pandemic 2009 Influenza",
                        @"Non-Adjuvanted Pandemic 2009 Influenza",
                        @"Hepatitis A and B",
                        @"Hepatitis A and Typhoid",
                        @"Hepatitis A",
                        @"Hepatitis B Immune Globulin",
                        @"Hepatitis B Thimerosal Free",
                        @"Hepatitis B",
                        @"Hepatitis B for Dialysis",
                        @"Haemophilus influenza b (Connaught) (PRPT)",
                        @"Human Papillomavirus",
                        @"Immune Globulin (human, intramuscular)",
                        @"Inactivated Polio (Salk)",
                        @"Japanese Encephalitis",
                        @"Lymerix",
                        @"Meningococcal - Conjugate (Menactra) (A, C, Y, W-135)",
                        @"Meningococcal, conjugate, monovalent (C)",
                        @"Meningococcal, polysaccharide, quadrivalent (A, C, Y, W-135) (single dose)",
                        @"Measles/Mumps/Rubella",
                        @"MMR and Varicella",
                        @"Pneumococcal (23 – polysaccharide)",
                        @"Purified Protein Derivative 5TU (Mantoux – TB Test)",
                        @"Pneumococcal (7 – conjugate)",
                        @"Rabies (HDCV)",
                        @"Rabies Immune Globulin",
                        @"Rotavirus (RotaTeq)",
                        @"Respiratory Syncytial Virus Immune Globulin",
                        @"Smallpox 1870/01/01 TBEV Tick-Borne Encephalitis Virus",
                        @"Tetanus/Diphtheria toxoids (adult)",
                        @"Tetanus/Diphtheria/IPV (adult)",
                        @"Tetanus Immune Globulin",
                        @"Typhoid Ty21a – Oral",
                        @"Typhim VI – Injectable",
                        @"Varicella Zoster - Shingles",
                        @"Varicella Zoster",
                        @"Varicella Zoster Immune Globulin",
                        @"Yellow Fever",
                     nil
                     ];
    return objects;
    
}

+(NSDictionary *)makeVaccineDictionary
{
    NSDictionary *vaccineDictionary =[[NSDictionary alloc]
                                      initWithObjects:[NameConversions getObjectArray]
                           forKeys:[NameConversions getKeyArray]];

    return vaccineDictionary;
    
}


+(NSString *)getVaccineNameforcode:(NSString *)key{
    NSString *nameString = [[NameConversions makeVaccineDictionary] objectForKey: key];
    return nameString;
}

@end











