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

#import "BurstlyCurrencyWrapper.h"

static FREContext *_context = nil;

/*
 C-level callback that is invoked by the C layer. This is just creating an event in the AIR runtime.
 */
extern "C" void BurstlyCurrencyWrapper_callback(bool success) {
	if (!_context) return;
	
    FREDispatchStatusEventAsync(*_context, (const uint8_t *)(success ? [@"BurstlyCurrencyEventUpdateSucceeded" UTF8String] : [@"BurstlyCurrencyEventUpdateFailed" UTF8String]), (const uint8_t *)[@"" UTF8String]);
}

extern "C" void BurstlyCurrencyWrapper_setContext(FREContext *context) {
    _context = context;
}