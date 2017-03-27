//
//  ViewController.m
//  Week2Assesment-Archie
//
//  Created by NEXTAcademy on 3/27/17.
//  Copyright © 2017 NEXTKRG. All rights reserved.
//

#import "ViewController.h"
#import "list.h"
#import "ListViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource, productDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSMutableArray* listArray;
@property(assign,nonatomic) NSInteger selectedIndex;
@property (weak, nonatomic) IBOutlet UINavigationItem *pageTitle;


@end

@implementation ViewController

-(void) generateList{
    list *macbookPro = [[list alloc] initWithName:@"Macbook Pro Retina" withDate:@"October 27" withPicture:[UIImage imageNamed:@"macbookPro"]];
    [self.listArray addObject:macbookPro];
    list *ipadPro = [[list alloc] initWithName:@"iPad Pro" withDate:@"March 31" withPicture:[UIImage imageNamed:@"ipadPro"]];
    [self.listArray addObject:ipadPro];
    list *macMini = [[list alloc] initWithName:@"Apple TV" withDate:@"October 16" withPicture:[UIImage imageNamed:@"appleTV"]];
    [self.listArray addObject:macMini];
    list *macPro = [[list alloc] initWithName:@"Mac Pro" withDate:@"December 19" withPicture:[UIImage imageNamed:@"macPro"]];
    [self.listArray addObject:macPro];
    list *appleWatch = [[list alloc] initWithName:@"Apple Watch 2" withDate:@"September 16" withPicture:[UIImage imageNamed:@"appleWatch"]];
    [self.listArray addObject:appleWatch];
    list *imac = [[list alloc] initWithName:@"iMac 21" withDate:@"September 1" withPicture:[UIImage imageNamed:@"imac"]];
    [self.listArray addObject:imac];
    list *ipodtouch = [[list alloc] initWithName:@"iPod Touch" withDate:@"December 12" withPicture:[UIImage imageNamed:@"ipodtouch"]];
    [self.listArray addObject:ipodtouch];
    list *macmini = [[list alloc] initWithName:@"Mac Mini" withDate:@"September 16" withPicture:[UIImage imageNamed:@"mini"]];
    [self.listArray addObject:macmini];
    list *iphone = [[list alloc] initWithName:@"iPhone" withDate:@"October 14" withPicture:[UIImage imageNamed:@"iphone"]];
    [self.listArray addObject:iphone];
}
-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingTableView];
    self.listArray =[[NSMutableArray alloc] init];
    [self.tableView reloadData];
    [self generateList];
}
-(void) settingTableView{
    self.tableView.delegate=self;
    self.tableView.dataSource= self;
}
#pragma mark - tableView datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"list" forIndexPath:indexPath];
    list *currentItem = [self.listArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:currentItem.name];
    [cell.detailTextLabel setText:currentItem.date];
    [cell.imageView setImage:currentItem.picture];
    return cell;
}

#pragma Mark- tableView delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"list" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"list"]){
        ListViewController
        *destinationVC = [segue destinationViewController];
        destinationVC.selectedItem = [self.listArray objectAtIndex:self.selectedIndex];
        //set delegate
        destinationVC.delegate = self;
        
    }
}
-(void)useDelegate:(NSString *)rootTitle{
    self.pageTitle.title = rootTitle;
}

@end
