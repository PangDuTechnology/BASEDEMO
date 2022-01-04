//
//  ViewControllerJumpModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/29.
//

#import "ViewControllerJumpModel.h"

@interface ViewControllerJumpModel ()
@property(nonnull,nonatomic,copy)   NSDictionary *urlDictionary;
@end

@implementation ViewControllerJumpModel
- (NSDictionary *)getUrlDictionary{
    return self.urlDictionary;
}
- (NSDictionary *)urlDictionary{
    if (!_urlDictionary) {
        _urlDictionary = @{
            @0 : @"AlgorithmViewController/AlgorithmListViewController/AlgorithmDetailViewController",
            @1 : @"AlgorithmViewController/AlgorithmListViewController/AlgorithmListViewController/AlgorithmDetailViewController"
        };
    }
    return _urlDictionary;
}
@end
