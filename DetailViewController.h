//
//  DetailViewController.h
//  ToDo
//
//  Created by Oliver Short on 5/3/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSManagedObject * detailItem;

@property(weak, nonatomic) MasterViewController *masterVC;

@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UISwitch *doneSwitch;
@property (weak, nonatomic) IBOutlet UITextField *dueDateTextField;


@end

