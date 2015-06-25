//
//  ItemListViewController.m
//  eComm
//
//  Created by Imayaselvan on 24/06/15.
//  Copyright (c) 2015 Imayaselvan. All rights reserved.
//

#import "ItemListViewController.h"
#import "itemTableViewCell.h"
@interface ItemListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *itemTbl;
}
@end

@implementation ItemListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.title;
    [self createUI];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}
-(void)createUI{
    itemTbl = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)  - 57)];
    itemTbl.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    itemTbl.delegate = self;
    itemTbl.dataSource = self;
    itemTbl.separatorStyle = UITableViewCellSeparatorStyleNone;
    itemTbl.showsVerticalScrollIndicator = NO;
    itemTbl.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:itemTbl];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated{
    

}
#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid=@"Cell";
    itemTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell==nil)
    {
        cell=[[itemTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
        
    }
    cell.titleLabel.text =@"adssad";
    cell.countLabel.text  =@"adsa";
    
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
