//
//  HomeViewController.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/2/24.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "HomeViewController.h"
#import "Person.h"
#import "CourseModel.h"
#import "CourseTableViewCell.h"
#import "Person+AddProperty.h"
#import <objc/message.h>
@interface HomeViewController ()<UITableViewDataSource>
{
    NSInteger currentpage;
    NSMutableArray *courseList;
    UITableView *listTable;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    currentpage = 1;
    courseList = [[NSMutableArray alloc]init];
    listTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    listTable.dataSource = self;
    listTable.rowHeight = UITableViewAutomaticDimension;
    listTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:listTable];
    
    [listTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self requestCourseList];
    
    [Person run];
    Person *person = [[Person alloc] init];
    [person study];
    [person test];
    [person eat:@"汉堡"];
    [person run];
    person.address = @"Beijing";
    NSLog(@"person.address = %@", person.address);
    //Block是将函数及其执行上下文封装起来的对象
    
    int multiplier = 6;
    int(^Block)(int) = ^int(int num){
        return num*multiplier;
    };
    Block(2);
    Class c1 = [person class];
    Class c2 = object_getClass(person);
    int boo = class_isMetaClass(c2);
    boo = class_isMetaClass(object_getClass([Person class]));
    Class c3 = object_getClass([Person class]);
    NSLog(@"%d  %d",c1 == c2, c2 == c3);
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        
        NSLog(@"%s---%s", name, type);
    }
    // 交换两个方法中的IMP
    Method runMethod = class_getClassMethod([Person class], @selector(run));
    Method studyMethod = class_getInstanceMethod([Person class], @selector(study));
    method_exchangeImplementations(runMethod, studyMethod);
    [Person run];
    [person study];
    
    // 修改某个方法的IMP
    //class_replaceMethod([self class], @selector(viewDidLoad), (IMP)ttt, "v@:");
    // 设置某个方法的IMP
    method_setImplementation(class_getInstanceMethod([self class], @selector(viewDidLoad)), (IMP)ttt);
    [self viewDidLoad];
    // 归根结底，都是偷换了selector的IMP
    
    //_objc_msgForward();
}

void ttt(id self,SEL _cmd){
    NSLog(@"修改/设置%@的IMP",NSStringFromSelector(_cmd));
}

- (void)requestCourseList{
    [NetworkManager requestWithPath:@"http://api1.schooledu.com.cn/rest/course/getCourseList" params:@{@"page":@(currentpage)} completion:^(NSDictionary *response, NSError *error) {
        if (error) {
            
        }else{
            NSArray *datas = response[@"data"];
            for (NSDictionary *dict in datas){
                CourseModel *model = [CourseModel modelWithDict:dict];
                [courseList addObject:model];
            }
            [listTable reloadData];
            NSLog(@"status :%@ == msg :%@", response[@"status"], response[@"msg"]);
        }
    }];
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
