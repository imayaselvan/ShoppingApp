//
//  ShopListViewController.m
//  eComm
//
//  Created by Imayaselvan on 24/06/15.
//  Copyright (c) 2015 Imayaselvan. All rights reserved.
//

#import "ShopListViewController.h"
#import "UIImageView+WebCache.h"
#import "ItemListViewController.h"
@interface ShopListViewController ()
{
    NSDictionary *shopData;
    NSArray     *shopNames;

}
@end

@implementation ShopListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getShoplistings];
    // Do any additional setup after loading the view.
}
- (void)getShoplistings{

    NSString *path         =[[NSBundle mainBundle] pathForResource:@"ShopsList" ofType:@"plist"];
    shopData      =[NSDictionary dictionaryWithContentsOfFile:path];
    shopNames =[shopData allKeys];
    [self.ShopListTbl reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [shopNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
        
    }
    
    cell.textLabel.text=[shopNames objectAtIndex:indexPath.row];
    NSString *imageURL =[shopData objectForKey:[shopNames objectAtIndex:indexPath.row]];

    [cell.imageView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"place"]];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ItemListViewController *item =[ItemListViewController new];
    item.title =[shopNames objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:item animated:YES];
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
