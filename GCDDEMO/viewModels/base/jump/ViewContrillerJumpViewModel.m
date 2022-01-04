//
//  ViewContrillerJumpViewModel.m
//  GCDDEMO
//
//  Created by ZhaoYun on 2021/12/29.
//

#import "ViewContrillerJumpViewModel.h"
#import <objc/message.h>

@interface ViewContrillerJumpViewModel()
@property (nonnull,nonatomic,strong) NSDictionary *urlDictionary;
@end

@implementation ViewContrillerJumpViewModel
- (void)controllerJump:(id)controller type:(id)type{
    if ([type isKindOfClass:[NSNumber class]]) {
        NSNumber *number = type;
        NSString *strUrl = [self.urlDictionary objectForKey:number];
        NSArray *array = [strUrl  componentsSeparatedByString:@"/"];
    }
}
#pragma mark ------ property
- (NSDictionary*)urlDictionary{
    if (!_urlDictionary) {
        Class class = NSClassFromString(@"ViewControllerJumpModel");
        id  object = [class new];
        if ([class instancesRespondToSelector:NSSelectorFromString(@"getUrlDictionary")]) {
            SEL sel = NSSelectorFromString(@"getUrlDictionary");
            _urlDictionary = ((NSDictionary * (*)(id, SEL))objc_msgSend)((id)object,sel);
        }
    }
    return _urlDictionary;
}
@end
