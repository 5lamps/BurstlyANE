/*
 Copyright 2014 Burstly, Inc.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>

#import "BurstlyDownloadTracker.h"
#import "BurstlyBanner.h"
#import "BurstlyInterstitial.h"

#import "BurstlyAdViewViewController.h"

#import "BurstlyAdWrapper.h"

#import "BurstlyAdUtils.h"

@interface BurstlyAdWrapperBridge : NSObject<BurstlyBannerDelegate, BurstlyInterstitialDelegate> {
    UIViewController *_rootViewController;
    UIViewController *_viewControllerForModalPresentation;
    NSMutableDictionary *_placementDictionary;
}

+ (BurstlyAdWrapperBridge *)sharedInstance;

- (void)trackDownload;

- (void)createBurstlyBannerAdWithPlacement:(NSString *)placement appId:(NSString*)appId andZoneId:(NSString*)zoneId andFrame:(CGRect)bannerFrame;
- (void)createBurstlyInterstitialWithPlacement:(NSString *)placement appId:(NSString*)appId andZoneId:(NSString*)zoneId;

- (void)destroyBurstlyAdWithPlacement:(NSString *)placement;

- (void)showAdForPlacement:(NSString*)placement;
- (void)cacheAdForPlacement:(NSString*)placement;

- (void)pauseBannerForPlacement:(NSString *)placement;
- (void)unpauseBannerForPlacement:(NSString *)placement;
- (void)addBannerToViewForPlacement:(NSString *)placement;
- (void)removeBannerFromViewForPlacement:(NSString *)placement;

- (BOOL)isAdCachedForPlacement:(NSString*)placement;

- (void)setBannerOrigin:(CGPoint)origin forPlacement:(NSString *)placement;
- (void)setBannerRefreshRate:(CGFloat)refreshRate forPlacement:(NSString *)placement;

- (void)setTargettingParameters:(NSString *)targettingParameters forPlacement:(NSString *)placement;
- (void)setAdParameters:(NSString *)adParameters forPlacement:(NSString *)placement;

- (void)setLoggingEnabled:(BOOL)enabled;

@end
