//
//  TaxCalcViewController.m
//  TaxCalc
//
//  Created by realaboo on 11-9-21.
//  Copyright 2011年 home. All rights reserved.
//

#import "TaxCalcViewController.h"

@implementation TaxCalcViewController

@synthesize beforeTax;
@synthesize addOns;
@synthesize endowment;
@synthesize medicare;
@synthesize unemployment;
@synthesize housing;
@synthesize taxableIncome;
@synthesize taxRate;
@synthesize tax;
@synthesize afterTax;

- (void)dealloc
{
    [super dealloc];
    [beforeTax release];
    [addOns release];
    [endowment release];
    [medicare release];
    [unemployment release];
    [housing release];
    [taxableIncome release];
    [taxRate release];
    [tax release];
    [afterTax release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) Calc:(id)sender
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    [beforeTax resignFirstResponder];
    [addOns resignFirstResponder];
    
    float i_beforeTax = [[beforeTax text] floatValue];
    float i_addOns = [[addOns text] floatValue];
    
    beforeTax.text = [NSString stringWithFormat:@"%.0f", i_beforeTax];
    addOns.text = [NSString stringWithFormat:@"%.0f", i_addOns];
    
    if (i_beforeTax + i_addOns < 1160.0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"这。。。"
                                                        message:@"还不到最低工资1160哦！"
                                                       delegate:nil
                                              cancelButtonTitle:@"重来"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        [pool release];
        return;
    }
    
    // insurance
    float base = i_beforeTax < 1680.0 ? 1680.0 : (i_beforeTax > 12603.0 ? 12603.0 : i_beforeTax);
    float o_endowment = base * 0.08;
    float o_medicare = base * 0.02 + 3;
    float o_unemployment = base * 0.002;
    
    base = i_beforeTax < 1160.0 ? 1160.0 : (i_beforeTax > 12603.0 ? 12603.0 : i_beforeTax);
    float o_housing = base * 0.12;
    
    float o_taxableIncome = i_beforeTax - o_endowment - o_medicare - o_unemployment - o_housing + i_addOns;

    endowment.text = [NSString stringWithFormat:@"%.2f", o_endowment];
    medicare.text = [NSString stringWithFormat:@"%.2f", o_medicare];
    unemployment.text = [NSString stringWithFormat:@"%.2f", o_unemployment];
    housing.text = [NSString stringWithFormat:@"%.2f", o_housing];
    taxableIncome.text = [NSString stringWithFormat:@"%.2f", o_taxableIncome];
    
    if (o_taxableIncome <= 3500)
    {
        taxRate.text = @"0";
        tax.text = @"0.00";
        afterTax.text = [NSString stringWithFormat:@"%.2f", o_taxableIncome];
    }
    else
    {
        float o_taxRate = 0;
        float o_tax = 0;
        
        base = o_taxableIncome - 3500;
        if (base <= 1500)
        {
            o_taxRate = 0.03;
            o_tax = base * 0.03;
        }
        else if (base <= 4500)
        {
            o_taxRate = 0.1;
            o_tax = base * 0.1 - 105;
        }
        else if (base <= 9000)
        {
            o_taxRate = 0.2;
            o_tax = base * 0.2 - 555;
        }
        else if (base <= 35000)
        {
            o_taxRate = 0.25;
            o_tax = base * 0.25 - 1005;
        }
        else if (base <= 55000)
        {
            o_taxRate = 0.3;
            o_tax = base * 0.3 - 2755;
        }
        else if (base <= 80000)
        {
            o_taxRate = 0.35;
            o_tax = base * 0.35 - 5505;
        }
        else
        {
            o_taxRate = 0.45;
            o_tax = base * 0.45 - 13505;
        }
        
        taxRate.text = [NSString stringWithFormat:@"%.2f", o_taxRate];
        tax.text = [NSString stringWithFormat:@"%.2f", o_tax];
        afterTax.text = [NSString stringWithFormat:@"%.2f", o_taxableIncome - o_tax];
    }
    
    [pool release];
}

- (IBAction) BackgroundTouched:(id)sender
{
    [beforeTax resignFirstResponder];
    [addOns resignFirstResponder];
}
@end
