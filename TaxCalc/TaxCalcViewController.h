//
//  TaxCalcViewController.h
//  TaxCalc
//
//  Created by realaboo on 11-9-21.
//  Copyright 2011年 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaxCalcViewController : UIViewController<UIAlertViewDelegate> {
    UITextField* beforeTax;
    UITextField* addOns;
    UILabel* endowment;
    UILabel* medicare;
    UILabel* unemployment;
    UILabel* housing;
    UILabel* taxableIncome;
    UILabel* taxRate;
    UILabel* tax;
    UILabel* afterTax;
}

@property (nonatomic, retain) IBOutlet UITextField* beforeTax;
@property (nonatomic, retain) IBOutlet UITextField* addOns;
@property (nonatomic, retain) IBOutlet UILabel* endowment;
@property (nonatomic, retain) IBOutlet UILabel* medicare;
@property (nonatomic, retain) IBOutlet UILabel* unemployment;
@property (nonatomic, retain) IBOutlet UILabel* housing;
@property (nonatomic, retain) IBOutlet UILabel* taxableIncome;
@property (nonatomic, retain) IBOutlet UILabel* taxRate;
@property (nonatomic, retain) IBOutlet UILabel* tax;
@property (nonatomic, retain) IBOutlet UILabel* afterTax;

- (IBAction) Calc: (id) sender;
- (IBAction) BackgroundTouched: (id) sender;

@end
