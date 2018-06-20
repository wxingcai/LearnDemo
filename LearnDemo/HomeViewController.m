//
//  HomeViewController.m
//  LearnDemo
//
//  Created by 王兴财 on 2018/2/24.
//  Copyright © 2018年 wangxingcai. All rights reserved.
//

#import "HomeViewController.h"
#import "Person.h"
#import "Person+AddProperty.h"
#import <objc/runtime.h>
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    Method runMethod = class_getClassMethod([Person class], @selector(run));
    Method studyMethod = class_getInstanceMethod([Person class], @selector(study));
    method_exchangeImplementations(runMethod, studyMethod);
    
    [Person run];
    Person *person = [[Person alloc] init];
    [person study];
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
