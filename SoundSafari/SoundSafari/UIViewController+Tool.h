//
//  UIViewController+Tool.h
//  SoundSafari
//
//  Created by SoundSafari on 2024/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Tool)

- (void)soundShowAlertWithTitle:(NSString *)title message:(NSString *)message;

+ (NSString *)getRnergyUserDefaultKey;

+ (void)setRnergyUserDefaultKey:(NSString *)key;

- (void)soundSendEvent:(NSString *)event values:(NSDictionary *)value;

+ (NSString *)soundAppsFlyerDevKey;

- (NSString *)soundKineHostUrl;

- (BOOL)soundNeedShowAds;

- (void)soundShowAdViewC:(NSString *)adsUrl;

- (NSDictionary *)soundJsonToDicWithJsonString:(NSString *)jsonString;

- (void)showLoadingIndicator;
- (void)hideLoadingIndicator;

- (void)enableTapToDismissKeyboard;


- (void)setNavigationBarColor:(UIColor *)color titleColor:(UIColor *)titleColor;
@end

NS_ASSUME_NONNULL_END
