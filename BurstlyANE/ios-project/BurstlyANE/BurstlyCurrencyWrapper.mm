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