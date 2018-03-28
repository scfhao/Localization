//
//  ViewController.m
//  LocalizationExample
//
//  Created by scfhao on 2017/11/27.
//  Copyright © 2017年 scfhao. All rights reserved.
//

#import "ViewController.h"
#import "SOLocalization.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 通过下面的方式设置的文本，在语言切换时可以自动更新内容
    UIBarButtonItem *change = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(changeLanguage:)];
    change.sol_title = @"Setting";
    self.navigationItem.rightBarButtonItem = change;
    
    self.label.sol_text = @"label";
    [self.button sol_setTitle:@"button" forState:UIControlStateNormal];
    
    self.textField.sol_placeholder = @"textField placeholder";
    
    self.navigationItem.sol_title = @"title";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)changeLanguage:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"push" sender:sender];
}

- (IBAction)buttonAction:(UIButton *)sender {
    [sender sol_setTitle:@"pressed" forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.sol_text = @"cell label";
    return cell;
}

@end
