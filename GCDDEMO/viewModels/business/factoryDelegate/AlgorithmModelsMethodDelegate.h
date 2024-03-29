//
//  AlgorithmModelsMethodDelegate.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol AlgorithmModelsMethodDelegate <NSObject>
@optional
- (NSArray *)tableViewDataSourceData;
- (void)didSelectRowAtIndexPathArray:(NSArray*)array pushController:(UIViewController *)pushController;
- (NSArray *)setTableViewDataSoure:(id)indexPath;
@end

NS_ASSUME_NONNULL_END
