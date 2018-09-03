//
//  MyViewController.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/2/24.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "MyViewController.h"
#import "Person.h"
#import "UIImage+Common.h"

typedef int(^MyBlock)(int, int);

@interface MyViewController ()<UITableViewDataSource>
{
    NSInteger currentpage;
    NSMutableArray *courseList;
    UITableView *listTable;
}
@end

@implementation MyViewController

- (void)createUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40, 490, 80, 80);
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *view = [[UILabel alloc]initWithFrame:CGRectMake(40, 490, 80, 80)];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
}

- (void)press{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的";
    [self createUI];
    /*NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
     */
    // 只输出：1.原因：主线程死锁
    // 如何高性能的给 UIImageView 加个圆角?
    //使用了贝塞尔曲线"切割"这个图片, 给UIImageView 添加了的圆角，其实也是通过绘图技术来实现的
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(85, 100, self.view.bounds.size.width - 170, 380)];
    imageView.backgroundColor = [UIColor cyanColor];
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:12] addClip];
    UIImage *image = [UIImage imageNamed:@"4xGlmmQNGM.jpg"];
    [image drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView];
    
    void (^aBlock)(NSString *x, NSString *y);
    void (^bBlock)(NSString *, NSString *);
    
    bBlock = ^(NSString *x, NSString *y){
        NSLog(@"%@ love %@", x,y);
    };
    
    int (^myBlock)(int) = ^(int num){
        return num*7;
    };
    
    void (^aVoidBlock)(void) = ^{
        NSLog(@"I am a aVoidBlock");
    };
    
    bBlock(@"Li Lei", @"Han Meimei");
    NSLog(@"result = %d", myBlock(9));
    aVoidBlock();
    SayHello hello = ^(){
        NSLog(@"hello");
    };
    hello();
    MyBlock addBlock = ^(int x, int y){
        return x + y;
    };
    useBlockForC(addBlock);
    useBlockForC(^(int x, int y) {
        return x + y;
    });
    [self useBlockForOC:addBlock];
    [self useBlockForOC:^int(int x, int y) {
        return x + y;
    }];
    
    static int globl = 100;
    void(^yBlock)(void) = ^{
        globl++;
        NSLog(@"%d", globl);
    };
    yBlock();
    // Do any additional setup after loading the view.
}

void useBlockForC(int(^aBlock)(int, int)){
     NSLog(@"result = %d", aBlock(300,200));
}

- (void)useBlockForOC:(MyBlock)aBlock{
    NSLog(@"result = %d", aBlock(300,200));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
