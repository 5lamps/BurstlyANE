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

#ifndef __Burstly__TestFlightWrapper_C__
#define __Burstly__TestFlightWrapper_C__

#import <Foundation/Foundation.h>

#import "BurstlyPluginUtils.h"

extern "C" {
    
	void TestFlightWrapper_addCustomEnvironmentInformation(const char *information, const char *key);
	void TestFlightWrapper_takeOff(const char *applicationToken);
	void TestFlightWrapper_passCheckpoint(const char *checkpointName);
	void TestFlightWrapper_submitFeedback(const char *feedback);

}

#endif /* defined(__Burstly__TestFlightWrapper_C__) */