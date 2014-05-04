//
//  TaxCalcAppDelegate.h
//  TaxCalc
//
//  Created by realaboo on 11-9-21.
//  Copyright 2011年 home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TaxCalcViewController;

@interface TaxCalcAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TaxCalcViewController *viewController;

@end
