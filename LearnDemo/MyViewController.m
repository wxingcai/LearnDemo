//
//  MyViewController.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/2/24.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "MyViewController.h"
#import "Person.h"
#import "CourseModel.h"
#import "CourseTableViewCell.h"

@interface MyViewController ()<UITableViewDataSource>
{
    NSInteger currentpage;
    NSMutableArray *courseList;
    UITableView *listTable;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的";
    
    listTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    listTable.dataSource = self;
    listTable.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:listTable];
    
    [listTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    currentpage = 1;
    courseList = [[NSMutableArray alloc]init];
    [self request];
    NSLog(@"%@", [[[Person alloc] init] description]);
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
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:12] addClip];
    UIImage *image = [UIImage imageNamed:@"4xGlmmQNGM.jpg"];
    [image drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view.
}

- (void)request{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://101.201.38.203/rest/course/getCourseList"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    NSString *str = [NSString stringWithFormat:@"page=%li",currentpage];
    request.HTTPBody = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray *array = dict[@"data"];
        for (NSDictionary *dic in array){
            CourseModel *courseModel = [CourseModel modelWithDict:dic];
            [courseList addObject:courseModel];
        }
        //回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [listTable reloadData];
        });
    }];
    [dataTask resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return courseList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *string = @"CourseCell";
    CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[CourseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    [cell updateCellData:courseList[indexPath.row]];
    return cell;
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
