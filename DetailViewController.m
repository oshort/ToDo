//
//  DetailViewController.m
//  ToDo
//
//  Created by Oliver Short on 5/3/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailTextField.text = [self.detailItem valueForKey:@"title"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self.doneSwitch setOn:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelButtonTapped:(UIButton*)sender{
    self.detailTextField.text = [self.detailItem valueForKey:@"title"];
}

-(IBAction)saveButtonTapped:(UIButton*)sender{
 //   NSString *dateString = self.detailTextField.text;

  //  NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
  //  [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
 //   NSDate * newDate = [formatter dateFromString:dateString];
    
    [self.detailItem setValue:self.detailTextField.text forKey:@"title"];
    NSError *error;
    
    if (![self.detailItem.managedObjectContext save:&error]){
        NSLog(@"Unresolved error %@, %@",error, [error userInfo]);
        abort();
    }
    
    self.saveButton.enabled = NO;
    self.cancelButton.enabled = NO;
    
    [self.masterVC detailChangedObject];
}

-(IBAction)doneSwitchTapped:(UISwitch*)sender{
    
}

@end
