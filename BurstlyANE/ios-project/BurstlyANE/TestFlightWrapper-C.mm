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

#import "TestFlightWrapper-C.h"
#import "TestFlightWrapperBridge.h"


extern "C" {
	
	void TestFlightWrapper_addCustomEnvironmentInformation(const char *information, const char *key) {
		[[TestFlightWrapperBridge sharedInstance] addCustomEnvironmentInformation:CreateNSString(information) forKey:CreateNSString(key)];
	}
	
	void TestFlightWrapper_takeOff(const char *applicationToken) {
		[[TestFlightWrapperBridge sharedInstance] takeOff:CreateNSString(applicationToken)];
	}
	
	void TestFlightWrapper_passCheckpoint(const char *checkpointName) {
		[[TestFlightWrapperBridge sharedInstance] passCheckpoint:CreateNSString(checkpointName)];
	}
	
	void TestFlightWrapper_submitFeedback(const char *feedback) {
		[[TestFlightWrapperBridge sharedInstance] submitFeedback:CreateNSString(feedback)];
	}
			
}