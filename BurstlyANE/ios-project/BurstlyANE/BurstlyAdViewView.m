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

#import "BurstlyAdViewView.h"

@implementation BurstlyAdViewView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSEnumerator *reverseE = [self.subviews reverseObjectEnumerator];
    UIView *iSubView;

    while ((iSubView = [reverseE nextObject])) {

        UIView *viewWasHit = [iSubView hitTest:[self convertPoint:point toView:iSubView] withEvent:event];
        if (viewWasHit) {
            return viewWasHit;
        }

    }
    // Pass touches through if we aren't hitting a subview
    return nil;
}

@end
