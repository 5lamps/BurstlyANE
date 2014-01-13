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
	
	public class BurstlyCurrencyEvent extends Event
	{

		public static const BurstlyCurrencyEventUpdateSucceeded : String = "BurstlyCurrencyEventUpdateSucceeded";
		public static const BurstlyCurrencyEventUpdateFailed : String = "BurstlyCurrencyEventUpdateFailed";
		
		public function BurstlyCurrencyEvent(type : String, bubbles : Boolean = true, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}