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

#import "BurstlyCurrencyWrapperBridge.h"


@implementation BurstlyCurrencyWrapperBridge

static BurstlyCurrencyWrapperBridge *_sharedInstance;


#pragma mark Singleton Implementation

+ (id)allocWithZone:(NSZone*)zone {
	@synchronized(self) {
		if (_sharedInstance == nil) {
			_sharedInstance = [super allocWithZone:zone];
			return _sharedInstance; // assignment and return on first allocation
		}
	}
	return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone { return self; }

- (id)retain { return self; }

- (unsigned)retainCount {
	return UINT_MAX; //denotes an object that cannot be released
}

- (oneway void)release {
	//do nothing
}

- (id)autorelease { return self; }

- (id)init {
    self = [super init];
    if (self) {
		_initialized = NO;
    }
    return self;
}

+ (BurstlyCurrencyWrapperBridge *)sharedInstance {
	@synchronized(self) {
		if (_sharedInstance == nil) {
			[[self alloc] init]; // assignment not done here
		}
	}
	return _sharedInstance;
}

#pragma mark Class Implementation

- (void)initializeWithPublisherId:(NSString *)publisherId andUserId:(NSString *)userId {
	if (!publisherId || !userId || [publisherId compare:@""] == NSOrderedSame) return;
	
	if ([userId compare:@""] == NSOrderedSame) {
		[[BurstlyCurrency sharedCurrencyManager] setAppId:publisherId];
	} else {
		[[BurstlyCurrency sharedCurrencyManager] setAppId:publisherId andUserId:userId];
	}
	
	[[BurstlyCurrency sharedCurrencyManager] setDelegate:self];
	
	_initialized = YES;
	
	[[BurstlyCurrencyWrapperBridge sharedInstance] updateBalancesFromServer];
}

- (NSInteger)getBalanceForCurrency:(NSString *)currency {
	if (!_initialized) return 0;
		
	return [[BurstlyCurrency sharedCurrencyManager] currentBalanceForCurrency:currency];
}

- (void)increaseBalanceForCurrency:(NSString *)currency byAmount:(NSInteger)amount {
	if (!_initialized) return;

	[[BurstlyCurrency sharedCurrencyManager] increaseBalance:amount forCurrency:currency];
		
	[[BurstlyCurrencyWrapperBridge sharedInstance] updateBalancesFromServer];
}

- (void)decreaseBalanceForCurrency:(NSString *)currency byAmount:(NSInteger)amount {
	if (!_initialized) return;
	
	[[BurstlyCurrency sharedCurrencyManager] decreaseBalance:amount forCurrency:currency];
	
	[[BurstlyCurrencyWrapperBridge sharedInstance] updateBalancesFromServer];	
}

- (void)updateBalancesFromServer {
	if (!_initialized) return;
	
	[[BurstlyCurrency sharedCurrencyManager] checkForUpdate];
}

#pragma mark BurstlyCurrencyDelegate implementation

- (void)currencyManager:(BurstlyCurrency *)manager didUpdateBalances:(NSDictionary *)balances {
	BurstlyCurrencyWrapper_callback(true);		
}

- (void)currencyManager:(BurstlyCurrency *)manager didFailToUpdateBalanceWithError:(NSError *)error {
	BurstlyCurrencyWrapper_callback(false);
}

@end
