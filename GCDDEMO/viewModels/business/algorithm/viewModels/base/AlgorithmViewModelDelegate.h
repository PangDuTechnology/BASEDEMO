//
//  AlgorithmViewModelDelegate.h
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
@protocol AlgorithmViewModelDelegate <NSObject>
@optional
- (void)didSelectRowAtIndexPathArray:(NSArray*)array pushController:(UIViewController *)pushController;
@end
