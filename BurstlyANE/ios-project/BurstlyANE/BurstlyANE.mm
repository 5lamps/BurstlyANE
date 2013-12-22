//
//  BurstlyANE.m
//  BurstlyANE
//
//  Created by Alex Miyamura on 11/15/13.
//  Copyright (c) 2013 Burstly. All rights reserved.
//

#import "BurstlyANE.h"

#import "BurstlyAdWrapper-C.h"
#import "BurstlyCurrencyWrapper-C.h"
#import "TestFlightWrapper-C.h"

#pragma mark Core ANE Functionality

FREContext _context;

extern "C" {
    
    void BurstlyANEContextInitializer(void *extData, const uint8_t *ctxType, FREContext ctx, uint32_t *numFunctionsToSet, const FRENamedFunction **functionsToSet) {

        *numFunctionsToSet = 26;
        
        FRENamedFunction* functions = (FRENamedFunction *)malloc(sizeof(FRENamedFunction) * (*numFunctionsToSet));
                                                            
        functions[0].name = (const uint8_t*)"init";
        functions[0].functionData = NULL;
        functions[0].function = &BurstlyANE_init;
        
        /* Burstly Ads Functionality */
        
        functions[1].name = (const uint8_t*)"BurstlyAdWrapper_trackDownload";
        functions[1].functionData = NULL;
        functions[1].function = &BurstlyANE_BurstlyAdWrapper_trackDownload;
        
        functions[2].name = (const uint8_t*)"BurstlyAdWrapper_createBannerPlacement";
        functions[2].functionData = NULL;
        functions[2].function = &BurstlyANE_BurstlyAdWrapper_createBannerPlacement;
        
        functions[3].name = (const uint8_t*)"BurstlyAdWrapper_createInterstitialPlacement";
        functions[3].functionData = NULL;
        functions[3].function = &BurstlyANE_BurstlyAdWrapper_createInterstitialPlacement;
        
        functions[4].name = (const uint8_t*)"BurstlyAdWrapper_destroyAdPlacement";
        functions[4].functionData = NULL;
        functions[4].function = &BurstlyANE_BurstlyAdWrapper_destroyAdPlacement;
        
        functions[5].name = (const uint8_t*)"BurstlyAdWrapper_showAd";
        functions[5].functionData = NULL;
        functions[5].function = &BurstlyANE_BurstlyAdWrapper_showAd;
        
        functions[6].name = (const uint8_t*)"BurstlyAdWrapper_cacheAd";
        functions[6].functionData = NULL;
        functions[6].function = &BurstlyANE_BurstlyAdWrapper_cacheAd;
        
        functions[7].name = (const uint8_t*)"BurstlyAdWrapper_pauseBanner";
        functions[7].functionData = NULL;
        functions[7].function = &BurstlyANE_BurstlyAdWrapper_pauseBanner;
        
        functions[8].name = (const uint8_t*)"BurstlyAdWrapper_unpauseBanner";
        functions[8].functionData = NULL;
        functions[8].function = &BurstlyANE_BurstlyAdWrapper_unpauseBanner;
        
        functions[9].name = (const uint8_t*)"BurstlyAdWrapper_addBannerToView";
        functions[9].functionData = NULL;
        functions[9].function = &BurstlyANE_BurstlyAdWrapper_addBannerToView;
        
        functions[10].name = (const uint8_t*)"BurstlyAdWrapper_removeBannerFromView";
        functions[10].functionData = NULL;
        functions[10].function = &BurstlyANE_BurstlyAdWrapper_removeBannerFromView;
        
        functions[11].name = (const uint8_t*)"BurstlyAdWrapper_isAdCached";
        functions[11].functionData = NULL;
        functions[11].function = &BurstlyANE_BurstlyAdWrapper_isAdCached;
        
        functions[12].name = (const uint8_t*)"BurstlyAdWrapper_setBannerOrigin";
        functions[12].functionData = NULL;
        functions[12].function = &BurstlyANE_BurstlyAdWrapper_setBannerOrigin;
        
        functions[13].name = (const uint8_t*)"BurstlyAdWrapper_setBannerRefreshRate";
        functions[13].functionData = NULL;
        functions[13].function = &BurstlyANE_BurstlyAdWrapper_setBannerRefreshRate;
        
        functions[14].name = (const uint8_t*)"BurstlyAdWrapper_setTargettingParameters";
        functions[14].functionData = NULL;
        functions[14].function = &BurstlyANE_BurstlyAdWrapper_setTargettingParameters;
        
        functions[15].name = (const uint8_t*)"BurstlyAdWrapper_setAdParameters";
        functions[15].functionData = NULL;
        functions[15].function = &BurstlyANE_BurstlyAdWrapper_setAdParameters;
        
        functions[16].name = (const uint8_t*)"BurstlyAdWrapper_setLoggingEnabled";
        functions[16].functionData = NULL;
        functions[16].function = &BurstlyANE_BurstlyAdWrapper_setLoggingEnabled;
        
        /* Burstly Currency Functionality */
        
        functions[17].name = (const uint8_t*)"BurstlyCurrencyWrapper_initialize";
        functions[17].functionData = NULL;
        functions[17].function = &BurstlyANE_BurstlyCurrencyWrapper_initialize;
        
        functions[18].name = (const uint8_t*)"BurstlyCurrencyWrapper_getBalance";
        functions[18].functionData = NULL;
        functions[18].function = &BurstlyANE_BurstlyCurrencyWrapper_getBalance;
        
        functions[19].name = (const uint8_t*)"BurstlyCurrencyWrapper_increaseBalance";
        functions[19].functionData = NULL;
        functions[19].function = &BurstlyANE_BurstlyCurrencyWrapper_increaseBalance;
        
        functions[20].name = (const uint8_t*)"BurstlyCurrencyWrapper_decreaseBalance";
        functions[20].functionData = NULL;
        functions[20].function = &BurstlyANE_BurstlyCurrencyWrapper_decreaseBalance;
        
        functions[21].name = (const uint8_t*)"BurstlyCurrencyWrapper_updateBalancesFromServer";
        functions[21].functionData = NULL;
        functions[21].function = &BurstlyANE_BurstlyCurrencyWrapper_updateBalancesFromServer;
        
        /* TestFlight Functionality */
        
        functions[22].name = (const uint8_t*)"TestFlightWrapper_addCustomEnvironmentInformation";
        functions[22].functionData = NULL;
        functions[22].function = &BurstlyANE_TestFlightWrapper_addCustomEnvironmentInformation;
        
        functions[23].name = (const uint8_t*)"TestFlightWrapper_takeOff";
        functions[23].functionData = NULL;
        functions[23].function = &BurstlyANE_TestFlightWrapper_takeOff;
        
        functions[24].name = (const uint8_t*)"TestFlightWrapper_passCheckpoint";
        functions[24].functionData = NULL;
        functions[24].function = &BurstlyANE_TestFlightWrapper_passCheckpoint;
        
        functions[25].name = (const uint8_t*)"TestFlightWrapper_submitFeedback";
        functions[25].functionData = NULL;
        functions[25].function = &BurstlyANE_TestFlightWrapper_submitFeedback;
        
        
        *functionsToSet = functions;
    }

    void BurstlyANEContextFinalizer(FREContext ctx) {
        
    }

    void BurstlyANEInitializer(void **extDataToSet, FREContextInitializer *ctxInitializerToSet, FREContextFinalizer *ctxFinalizerToSet) {
        *extDataToSet = NULL;
        *ctxInitializerToSet = &BurstlyANEContextInitializer;
        *ctxFinalizerToSet = &BurstlyANEContextFinalizer;
    }

    void BurstlyANEFinalizer(void *extData) {
        
    }
    
}

FREObject BurstlyANE_init(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    _context = ctx;
    
    NSLog(@"************************BurstlyANE_init");
    
    BurstlyAdWrapper_setContext(&_context);
    BurstlyCurrencyWrapper_setContext(&_context);

    return NULL;
}

// void dispatchVolumeEvent(float volume, FREContext ctx) {
//    if (ctx == NULL) {
//        return;
//    }
//    NSNumber *numVolume = [NSNumber numberWithFloat:volume];
//    NSString *strVolume = [numVolume stringValue];
//    NSString *eventName = @”volumeChanged”;
//    const uint8_t* volumeCode = (const uint8_t*) [strVolume UTF8String];
//    const uint8_t* eventCode = (const uint8_t*) [eventName UTF8String];
//    FREDispatchStatusEventAsync(ctx, eventCode, volumeCode);
//}



#pragma mark Burstly Ads Functionality

//extern void BurstlyAdWrapper_callback(const char *placementName, BurstlyEvent callbackEvent);

FREObject BurstlyANE_BurstlyAdWrapper_trackDownload(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {

    BurstlyAdWrapper_trackDownload();
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_createBannerPlacement(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    const uint8_t *publisherId;
    const uint8_t *zoneId;
    double originX;
    double originY;
    double width;
    double height;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    FREGetObjectAsUTF8(argv[1], &stringLength, &publisherId);
    FREGetObjectAsUTF8(argv[2], &stringLength, &zoneId);
    FREGetObjectAsDouble(argv[3], &originX);
    FREGetObjectAsDouble(argv[4], &originY);
    FREGetObjectAsDouble(argv[5], &width);
    FREGetObjectAsDouble(argv[6], &height);
    
    BurstlyAdWrapper_createBannerPlacement((const char *)placementName, (const char *)publisherId, (const char *)zoneId, (float)originX, (float)originY, (float)width, (float)height);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_createInterstitialPlacement(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    const uint8_t *publisherId;
    const uint8_t *zoneId;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    FREGetObjectAsUTF8(argv[1], &stringLength, &publisherId);
    FREGetObjectAsUTF8(argv[2], &stringLength, &zoneId);

    BurstlyAdWrapper_createInterstitialPlacement((const char *)placementName, (const char *)publisherId, (const char *)zoneId);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_destroyAdPlacement(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    BurstlyAdWrapper_destroyAdPlacement((const char *)placementName);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_showAd(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    BurstlyAdWrapper_showAd((const char *)placementName);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_cacheAd(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    BurstlyAdWrapper_cacheAd((const char *)placementName);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_pauseBanner(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {

    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    BurstlyAdWrapper_pauseBanner((const char *)placementName);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_unpauseBanner(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {

    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    BurstlyAdWrapper_unpauseBanner((const char *)placementName);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_addBannerToView(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {

    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    BurstlyAdWrapper_addBannerToView((const char *)placementName);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_removeBannerFromView(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {

    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    BurstlyAdWrapper_removeBannerFromView((const char *)placementName);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_isAdCached(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    
    bool isAdCached = BurstlyAdWrapper_isAdCached((const char *)placementName);
    
    FREObject returnValue;
    FRENewObjectFromBool(isAdCached, &returnValue);
    
    return returnValue;
}

FREObject BurstlyANE_BurstlyAdWrapper_setBannerOrigin(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    double originX;
    double originY;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    FREGetObjectAsDouble(argv[1], &originX);
    FREGetObjectAsDouble(argv[2], &originY);
    
    BurstlyAdWrapper_setBannerOrigin((const char *)placementName, (float)originX, (float)originY);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_setBannerRefreshRate(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    double refreshRate;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    FREGetObjectAsDouble(argv[1], &refreshRate);
    
    BurstlyAdWrapper_setBannerRefreshRate((const char *)placementName, (float)refreshRate);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_setTargettingParameters(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    const uint8_t *targetingParameters;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    FREGetObjectAsUTF8(argv[1], &stringLength, &targetingParameters);
    
    BurstlyAdWrapper_setTargettingParameters((const char *)placementName, (const char *)targetingParameters);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_setAdParameters(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *placementName;
    const uint8_t *adParameters;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &placementName);
    FREGetObjectAsUTF8(argv[1], &stringLength, &adParameters);
    
    BurstlyAdWrapper_setAdParameters((const char *)placementName, (const char *)adParameters);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyAdWrapper_setLoggingEnabled(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t enabled;
    
    FREGetObjectAsBool(argv[0], &enabled);
    
    BurstlyAdWrapper_setLoggingEnabled(enabled);
    
    return NULL;
}

#pragma mark Burstly Currency Functionality

//extern void BurstlyCurrencyWrapper_callback(bool success);

FREObject BurstlyANE_BurstlyCurrencyWrapper_initialize(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *publisherId;
    const uint8_t *userId;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &publisherId);
    FREGetObjectAsUTF8(argv[1], &stringLength, &userId);
    
    BurstlyCurrencyWrapper_initialize((const char *)publisherId, (const char *)userId);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyCurrencyWrapper_getBalance(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *currency;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &currency);
    
    BurstlyCurrencyWrapper_getBalance((const char *)currency);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyCurrencyWrapper_increaseBalance(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *currency;
    int32_t amount;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &currency);
    FREGetObjectAsInt32(argv[1], &amount);
    
    BurstlyCurrencyWrapper_increaseBalance((const char *)currency, amount);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyCurrencyWrapper_decreaseBalance(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *currency;
    int32_t amount;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &currency);
    FREGetObjectAsInt32(argv[1], &amount);
    
    BurstlyCurrencyWrapper_decreaseBalance((const char *)currency, amount);
    
    return NULL;
}

FREObject BurstlyANE_BurstlyCurrencyWrapper_updateBalancesFromServer(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    BurstlyCurrencyWrapper_updateBalancesFromServer();
    
    return NULL;
}

#pragma mark TestFlight Functionality

FREObject BurstlyANE_TestFlightWrapper_addCustomEnvironmentInformation(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *information;
    const uint8_t *key;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &information);
    FREGetObjectAsUTF8(argv[1], &stringLength, &key);
    
    TestFlightWrapper_addCustomEnvironmentInformation((const char *)information, (const char *)key);
    
    return NULL;
}

FREObject BurstlyANE_TestFlightWrapper_takeOff(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *applicationToken;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &applicationToken);
    
    TestFlightWrapper_takeOff((const char *)applicationToken);
    
    return NULL;
}

FREObject BurstlyANE_TestFlightWrapper_passCheckpoint(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {
    
    uint32_t stringLength;
    const uint8_t *checkpointName;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &checkpointName);
    
    TestFlightWrapper_passCheckpoint((const char *)checkpointName);
    
    return NULL;
}

FREObject BurstlyANE_TestFlightWrapper_submitFeedback(FREContext ctx, void *funcData, uint32_t argc, FREObject argv[]) {

    uint32_t stringLength;
    const uint8_t *feedback;
    
    FREGetObjectAsUTF8(argv[0], &stringLength, &feedback);
    
    TestFlightWrapper_submitFeedback((const char *)feedback);
    
    return NULL;
}