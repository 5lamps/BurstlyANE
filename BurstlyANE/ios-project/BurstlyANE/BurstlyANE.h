//
//  BurstlyANE.h
//  BurstlyANE
//
//  Created by Alex Miyamura on 11/15/13.
//  Copyright (c) 2013 Burstly. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FlashRuntimeExtensions.h"

/* Core ANE Functionality */

extern "C" {
    
    void BurstlyANEContextInitializer(void *extData, const uint8_t *ctxType, FREContext ctx, uint32_t *numFunctionsToTest, const FRENamedFunction **functionsToSet);
    void BurstlyANEContextFinalizer(FREContext ctx);

    void BurstlyANEInitializer(void **extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer *ctxFinalizerToSet);
    void BurstlyANEFinalizer(void *extData);
    
}

FREObject BurstlyANE_init(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

/* Burstly Ads Functionality */

//extern void BurstlyAdWrapper_callback(const char *placementName, BurstlyEvent callbackEvent);

FREObject BurstlyANE_BurstlyAdWrapper_trackDownload(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

FREObject BurstlyANE_BurstlyAdWrapper_createBannerPlacement(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_createInterstitialPlacement(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

FREObject BurstlyANE_BurstlyAdWrapper_destroyAdPlacement(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

FREObject BurstlyANE_BurstlyAdWrapper_showAd(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_cacheAd(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

FREObject BurstlyANE_BurstlyAdWrapper_pauseBanner(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_unpauseBanner(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_addBannerToView(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_removeBannerFromView(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

FREObject BurstlyANE_BurstlyAdWrapper_isAdCached(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

FREObject BurstlyANE_BurstlyAdWrapper_setBannerOrigin(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_setBannerRefreshRate(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_setTargettingParameters(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_setAdParameters(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyAdWrapper_setLoggingEnabled(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

/* Burstly Currency Functionality */

//extern void BurstlyCurrencyWrapper_callback(bool success);

FREObject BurstlyANE_BurstlyCurrencyWrapper_initialize(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyCurrencyWrapper_getBalance(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyCurrencyWrapper_increaseBalance(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyCurrencyWrapper_decreaseBalance(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_BurstlyCurrencyWrapper_updateBalancesFromServer(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);

/* TestFlight Functionality */

FREObject BurstlyANE_TestFlightWrapper_addCustomEnvironmentInformation(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_TestFlightWrapper_takeOff(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_TestFlightWrapper_passCheckpoint(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);
FREObject BurstlyANE_TestFlightWrapper_submitFeedback(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]);