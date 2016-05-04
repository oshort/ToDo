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
    
    self.title = @"Item Details";
    if (self.detailItem) {
        self.detailTextField.placeholder =@"Enter something to do!";
        self.detailTextField.text = [self.detailItem valueForKey:@"title"];
        self.dueDateTextField.placeholder=@"Enter when it needs to be done by!";
       // self.dueDateTextField.text = [[self.detailItem valueForKey:@"timeStamp"]description];
        [self.doneSwitch setOn:[[self.detailItem valueForKey:@"done"]boolValue] animated:YES];
        

        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancelButtonTapped:(UIButton*)sender{
    self.detailTextField.text = [self.detailItem valueForKey:@"title"];
}

-(IBAction)saveButtonTapped:(UIButton*)sender{
//NSString *dateString = self.dueDateTextField.text;
//NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//[formatter setDateFormat:@"EEEE MMMM d,YYYY h:mm a"];
//NSDate * newDate = [formatter dateFromString:dateString];
    
//[self.detailItem setValue: newDate forKey:@"timeStamp"];
    
[self.detailItem setValue:self.detailTextField.text forKey:@"title"];

//[self.detailItem setValue:[NSNumber numberWithBool: [self.doneSwitch isOn]] forKey:@"done"];

    
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
    /*if(![self.doneSwitch isOn]){
    [self.doneSwitch setOn: [self.detailItem valueForKey:@"done"] ];
    }
     
     */
    if (self.doneSwitch.isOn) {
        [self.detailItem setValue:@YES forKey:@"done"];
    }else{
        [self.detailItem setValue:@NO forKey:@"done"];
    }
    
    NSError *error;
    
    if (![self.detailItem.managedObjectContext save:&error]){
        NSLog(@"Unresolved error %@, %@",error, [error userInfo]);
        abort();
    }
}

@end
