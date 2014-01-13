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

#import <stdio.h>

#import "BurstlyCurrencyWrapper-C.h"
#import "BurstlyCurrencyWrapperBridge.h"


extern "C" {
	
	void BurstlyCurrencyWrapper_initialize(const char *publisherId, const char *userId) {
		[[BurstlyCurrencyWrapperBridge sharedInstance] initializeWithPublisherId:CreateNSString(publisherId) andUserId:CreateNSString(userId)];
	}
	
	int BurstlyCurrencyWrapper_getBalance(const char *currency) {
		return [[BurstlyCurrencyWrapperBridge sharedInstance] getBalanceForCurrency:CreateNSString(currency)];		
	}
	
	void BurstlyCurrencyWrapper_increaseBalance(const char *currency, int amount) {
		[[BurstlyCurrencyWrapperBridge sharedInstance] increaseBalanceForCurrency:CreateNSString(currency) byAmount:amount];
	}
	
	void BurstlyCurrencyWrapper_decreaseBalance(const char *currency, int amount) {
		[[BurstlyCurrencyWrapperBridge sharedInstance] decreaseBalanceForCurrency:CreateNSString(currency) byAmount:amount];
	}
	
	void BurstlyCurrencyWrapper_updateBalancesFromServer() {
		[[BurstlyCurrencyWrapperBridge sharedInstance] updateBalancesFromServer];
	}
		
}