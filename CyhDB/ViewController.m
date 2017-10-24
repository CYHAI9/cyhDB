//
//  ViewController.m
//  CyhDB
//
//  Created by Macx on 16/7/25.
//  Copyright © 2016年 Macx. All rights reserved.
//

#import "ViewController.h"
#import "CyhbaeseDB.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTf;

@property (weak, nonatomic) IBOutlet UITextField *tagTf;
@property (weak, nonatomic) IBOutlet UITextField *yearTf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/countdb.sqlite"];
    [[CyhbaeseDB shareBaseDB] createDB:dbPath];
    [[CyhbaeseDB shareBaseDB]createTable:@"CREATE TABLE IF NOT EXISTS Mytesttable (id INTEGER PRIMARY KEY,tag text, name text, year text);"];
}

- (IBAction)InserBlick:(UIButton *)sender {
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO Mytesttable(tag,name,year) VALUES (?,?,?)"];
    /**
     *  注意，插入的数据如果不是以字符串的形式，请先转为NSString类型
     */
    [[CyhbaeseDB shareBaseDB] InserSQL:insertSQL datasource:@[self.tagTf.text,self.nameTf.text,self.yearTf.text]];
}
- (IBAction)DeletBlick:(UIButton *)sender {
    
   NSString * Sqlstr = @"DELETE FROM Mytesttable WHERE id = 1";
    [[CyhbaeseDB shareBaseDB] deleteDB:Sqlstr];
    
    
}
- (IBAction)UpdataBlick:(UIButton *)sender {
    
    NSString * Sqlstr = @"UPDATE Mytesttable set name = 'hahahaha' where id = 3";
    [[CyhbaeseDB shareBaseDB] updateDB:Sqlstr];
    
}
- (IBAction)seleBlick:(UIButton *)sender {
    
    NSString * Sqlstr = @"SELECT * FROM Mytesttable";
    NSArray * datasource = [[CyhbaeseDB shareBaseDB] selectDB:Sqlstr];
    
    NSLog(@"数据库数据%@",datasource);
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.tagTf resignFirstResponder];
    [self.nameTf resignFirstResponder];
    [self.yearTf resignFirstResponder];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
