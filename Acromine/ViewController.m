//
//  ViewController.m
//  Acromine
//
//  Created by Abhishek Tyagi on 11/17/16.
//  Copyright © 2016 Department of Education. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "Constants.h"
#import "Acronyms.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchActionButtonClicked:(id)sender {
    if (searchTextField.text.length < 1) {
        [self showTitle:@"Error" withMessage:@"Kindly enter atleast a letter."];
        return;
    }
    [self sendingAPIRequestToGetTheAcronyms];
}

- (void)sendingAPIRequestToGetTheAcronyms {
    [self.view endEditing:YES];
    NSString *urlString = [NSString stringWithFormat:@"%@%@",apiUrl,searchTextField.text];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:urlString]];
    [httpClient getPath:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.view setUserInteractionEnabled:YES];
        NSError *error;
        id json = [NSJSONSerialization
                       JSONObjectWithData:responseObject
                       options:kNilOptions
                       error:&error];
        NSLog(@"Response : %@",json);
        if ([json count] > 0) {
            [Acronyms saveAcronymsInfoInInstance:json];
            
            [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"searchListView"] animated:YES];
        }
        else {
            [self showTitle:applicationName withMessage:@"No result found. Try some other letters."];
        }
        
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self.view setUserInteractionEnabled:YES];
        NSLog(@"[HTTPClient Error]: %@", error.localizedDescription);
    }];
}

- (void)showTitle:(NSString *)title withMessage:(NSString *)errorMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
