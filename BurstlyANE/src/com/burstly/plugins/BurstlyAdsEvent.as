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

package com.burstly.plugins
{
	
	import flash.events.Event;
	
	public class BurstlyAdsEvent extends Event
	{
		
		public static const BurstlyAdsEventSucceeded : String = "BurstlyAdsEventSucceeded";
		public static const BurstlyAdsEventFailed : String = "BurstlyAdsEventFailed";
		public static const BurstlyAdsEventTakeoverFullscreen : String = "BurstlyAdsEventTakeoverFullscreen";
		public static const BurstlyAdsEventDismissFullscreen : String = "BurstlyAdsEventDismissFullscreen";
		public static const BurstlyAdsEventHidden : String = "BurstlyAdsEventHidden";
		public static const BurstlyAdsEventShown : String = "BurstlyAdsEventShown";
		public static const BurstlyAdsEventCached : String = "BurstlyAdsEventCached";
		public static const BurstlyAdsEventClicked : String = "BurstlyAdsEventClicked";
		
		private var _placement : String;
		
		public function BurstlyAdsEvent(type : String, placement : String, bubbles : Boolean = true, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
			_placement = placement
		}
		
		public function getPlacement() : String
		{
			return _placement;
		}
	}
}

