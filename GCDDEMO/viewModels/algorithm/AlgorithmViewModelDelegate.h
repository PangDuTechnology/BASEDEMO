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
- (void)algorithmSetModel:(id)model;
- (void)didSelectRowAtIndexPath:(id)indexPath pushController:(UIViewController *)pushController;
@end
