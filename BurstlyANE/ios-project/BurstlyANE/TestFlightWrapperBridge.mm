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

//
//  TestFlightWrapperBridge.m
//  BurstlyC++Plugin
//
//  Created by abishek ashok on 2/12/13.
//  Copyright (c) 2013 abishek ashok. All rights reserved.
//

#import "TestFlightWrapperBridge.h"


@implementation TestFlightWrapperBridge

static TestFlightWrapperBridge *_sharedInstance;


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

    }
    return self;
}

+ (TestFlightWrapperBridge *)sharedInstance {
	@synchronized(self) {
		if (_sharedInstance == nil) {
			[[self alloc] init]; // assignment not done here
		}
	}
	return _sharedInstance;
}

#pragma mark Class Implementation

- (void)addCustomEnvironmentInformation:(NSString *)information forKey:(NSString*)key {
	[TestFlight addCustomEnvironmentInformation:information forKey:key];
}

- (void)takeOff:(NSString *)applicationToken {
	[TestFlight takeOff:applicationToken];
}

- (void)passCheckpoint:(NSString *)checkpointName {
	[TestFlight passCheckpoint:checkpointName];
}

- (void)submitFeedback:(NSString*)feedback {
	[TestFlight submitFeedback:feedback];
}

@end
