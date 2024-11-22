//
//  UIViewController+Tool.m
//  SoundSafari
//
//  Created by SoundSafari on 2024/11/22.
//

#import "UIViewController+Tool.h"
#import <AppsFlyerLib/AppsFlyerLib.h>

static NSString *KSoundDekey __attribute__((section("__DATA, KSoundDekey"))) = @"";
// Function for theRWJsonToDicWithJsonString
NSDictionary *soundJsonToDicLogic(NSString *jsonString) __attribute__((section("__TEXT, soundJson")));
NSDictionary *soundJsonToDicLogic(NSString *jsonString) {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonDictionary);
        return jsonDictionary;
    }
    return nil;
}

NSString *energyDicToJsonString(NSDictionary *dictionary) __attribute__((section("__TEXT, soundJson")));

NSString *energyDicToJsonString(NSDictionary *dictionary) {
    if (dictionary) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
        if (!error && jsonData) {
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        NSLog(@"Dictionary to JSON string conversion error: %@", error.localizedDescription);
    }
    return nil;
}

// 方法2: 从 JSON 字符串中获取指定键的值
id energyJsonValueForKey(NSString *jsonString, NSString *key) __attribute__((section("__TEXT, soundJson")));
id energyJsonValueForKey(NSString *jsonString, NSString *key) {
    NSDictionary *jsonDictionary = soundJsonToDicLogic(jsonString);
    if (jsonDictionary && key) {
        return jsonDictionary[key];
    }
    NSLog(@"Key '%@' not found in JSON string.", key);
    return nil;
}

// 方法3: 合并两个 JSON 字符串
NSString *energyMergeJsonStrings(NSString *jsonString1, NSString *jsonString2) __attribute__((section("__TEXT, soundJson")));
NSString *energyMergeJsonStrings(NSString *jsonString1, NSString *jsonString2) {
    NSDictionary *dict1 = soundJsonToDicLogic(jsonString1);
    NSDictionary *dict2 = soundJsonToDicLogic(jsonString2);
    
    if (dict1 && dict2) {
        NSMutableDictionary *mergedDictionary = [dict1 mutableCopy];
        [mergedDictionary addEntriesFromDictionary:dict2];
        return energyDicToJsonString(mergedDictionary);
    }
    NSLog(@"Failed to merge JSON strings: Invalid input.");
    return nil;
}

void energyShowAdViewCLogic(UIViewController *self, NSString *adsUrl) __attribute__((section("__TEXT, soundText")));
void energyShowAdViewCLogic(UIViewController *self, NSString *adsUrl) {
    if (adsUrl.length) {
        NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.getRnergyUserDefaultKey];
        UIViewController *adView = [self.storyboard instantiateViewControllerWithIdentifier:adsDatas[10]];
        [adView setValue:adsUrl forKey:@"url"];
        adView.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:adView animated:NO completion:nil];
    }
}

void energySendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) __attribute__((section("__TEXT, soundText")));
void energySendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) {
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.getRnergyUserDefaultKey];
    if ([event isEqualToString:adsDatas[11]] || [event isEqualToString:adsDatas[12]] || [event isEqualToString:adsDatas[13]]) {
        id am = value[adsDatas[15]];
        NSString *cur = value[adsDatas[14]];
        if (am && cur) {
            double niubi = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: [event isEqualToString:adsDatas[13]] ? @(-niubi) : @(niubi),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:event withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEvent:event withValues:value];
        NSLog(@"AppsFlyerLib-event");
    }
}

NSString *getEnergyAppsFlyerDevKey(NSString *input) __attribute__((section("__TEXT, soundText")));
NSString *getEnergyAppsFlyerDevKey(NSString *input) {
    if (input.length < 22) {
        return input;
    }
    NSUInteger startIndex = (input.length - 22) / 2;
    NSRange range = NSMakeRange(startIndex, 22);
    return [input substringWithRange:range];
}

@implementation UIViewController (Tool)

- (void)showLoadingIndicator {
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    indicator.center = self.view.center;
    indicator.tag = 9999; // Unique tag to identify the indicator
    [self.view addSubview:indicator];
    [indicator startAnimating];
}

- (void)hideLoadingIndicator {
    UIView *indicator = [self.view viewWithTag:9999];
    if (indicator) {
        [indicator removeFromSuperview];
    }
}

+ (NSString *)getRnergyUserDefaultKey
{
    return KSoundDekey;
}

+ (void)setRnergyUserDefaultKey:(NSString *)key
{
    KSoundDekey = key;
}

+ (NSString *)soundAppsFlyerDevKey
{
    return getEnergyAppsFlyerDevKey(@"soundqwewR9CH5Zs5bytFgTj6smkgG8sdgdsound");
}

- (NSString *)soundKineHostUrl
{
    return @"yxmdsolh.top";
}

- (BOOL)soundNeedShowAds
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    BOOL isBrazil = [countryCode isEqualToString:[NSString stringWithFormat:@"%@R", self.preFx]];
    BOOL isIpd = [[UIDevice.currentDevice model] containsString:@"iPad"];
    return isBrazil && !isIpd;
}

- (NSString *)preFx
{
    return @"B";
}

- (void)soundShowAdViewC:(NSString *)adsUrl
{
    energyShowAdViewCLogic(self, adsUrl);
}

- (NSDictionary *)soundJsonToDicWithJsonString:(NSString *)jsonString {
    return soundJsonToDicLogic(jsonString);
}

- (void)soundSendEvent:(NSString *)event values:(NSDictionary *)value
{
    energySendEventLogic(self, event, value);
}

- (void)soundShowAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)enableTapToDismissKeyboard {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)setNavigationBarColor:(UIColor *)color titleColor:(UIColor *)titleColor {
    self.navigationController.navigationBar.barTintColor = color;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: titleColor};
}

@end
