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

#ifndef __Burstly__BurstlyCurrencyWrapper_C__
#define __Burstly__BurstlyCurrencyWrapper_C__

#import <Foundation/Foundation.h>

#import "BurstlyPluginUtils.h"

#import "FlashRuntimeExtensions.h"

/*
    BurstlyCurrencyCallback function pointer typedef for convenience. First argument is the placementName, second argument is a callbackEvent
 */
typedef void (*BurstlyCurrencyCallback)(bool);

extern "C" {
    
    /*
        External callback that is called by the Objective-C / JNI layer. This needs to be written specifically for each platform and then proxy accordingly to whichever framework is being targeted.
     */
    extern void BurstlyCurrencyWrapper_callback(bool success);
    extern void BurstlyCurrencyWrapper_setContext(FREContext *context);
	
	void BurstlyCurrencyWrapper_initialize(const char *publisherId, const char *userId);
	int BurstlyCurrencyWrapper_getBalance(const char *currency);
	void BurstlyCurrencyWrapper_increaseBalance(const char *currency, int amount);
	void BurstlyCurrencyWrapper_decreaseBalance(const char *currency, int amount);
	void BurstlyCurrencyWrapper_updateBalancesFromServer();

}

#endif /* defined(__Burstly__BurstlyCurrencyWrapper_C__) */