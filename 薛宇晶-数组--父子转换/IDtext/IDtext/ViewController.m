//
//  ViewController.m
//  IDtext
//
//  Created by 薛宇晶 on 2017/8/4.
//  Copyright © 2017年 薛宇晶. All rights reserved.
//

#import "ViewController.h"

#import "MJExtension.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        NSArray *arr=@[
                       @[@"自身ID1",@"",@"标题1",@"1",@"2",@"3"],
                       @[@"自身ID2",@"",@"标题2",@"4",@"5",@"6"],
                       @[@"自身ID11",@"自身ID1",@"标题3",@"7",@"8",@"9"],
                       @[@"自身ID21",@"自身ID2",@"标题4",@"10",@"11",@"12"],
                       @[@"自身ID22",@"自身ID2",@"标题5",@"13",@"14",@"15"],
                       @[@"自身ID111",@"自身ID11",@"标题6",@"16",@"17",@"18"],
                       @[@"自身ID211",@"自身ID21",@"标题7",@"19",@"20",@"21"],
                       @[@"自身ID2111",@"自身ID211",@"标题8",@"22",@"23",@"24"]
                       ];
    
  NSMutableArray * totalarr=[NSMutableArray array];
    
   NSMutableArray *idarr=[NSMutableArray array];
    
    for (int i=0;i<8; i++) {
        NSArray *arr1=arr[i];
        if ([arr1[1] isEqualToString:@""]) {
            NSMutableArray *muarr=[NSMutableArray array];
            NSMutableDictionary *mudic=[NSMutableDictionary dictionary];
            [mudic setObject:@[arr1[2],arr1[3],arr1[4],arr1[5]] forKey:@"main_data"];
            [mudic setObject:muarr forKey:@"sub_data"];
            [idarr addObject:arr1[0]];
            [totalarr addObject:mudic];
        }
    }
    for (int j=0;j<idarr.count;j++) {
        NSLog(@"%@",totalarr);
        [self content:arr andidarr:idarr[j] anddic:totalarr[j]];
    }
    NSLog(@"%@",totalarr.mj_JSONString);

}
-(void)content:(NSArray *)arr andidarr:(NSString *)currentid anddic:(NSMutableDictionary *)dic {
    //    NSLog(@"%@",dic);
    NSMutableArray *muarrz=[NSMutableArray array];
    
    NSMutableArray *idarr1=[NSMutableArray array];
    for ( int i=0;i<8;i++) {
        NSArray *arr1=arr[i];
        muarrz=dic[@"sub_data"];
        if ([arr1[1] isEqualToString:currentid]) {
            NSMutableArray *muarr=[NSMutableArray array];
            NSMutableDictionary *mudic=[NSMutableDictionary dictionary];
            [mudic setObject:@[arr1[2],arr1[3],arr1[4],arr1[5]] forKey:@"main_data"];
            [mudic setObject:muarr forKey:@"sub_data"];
            [idarr1 addObject:arr1[0]];
            [muarrz addObject:mudic];
        }
    }
    for (int j=0;j<idarr1.count;j++) {
        [self content:arr andidarr:idarr1[j] anddic:muarrz[j]];
    }
}

    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

