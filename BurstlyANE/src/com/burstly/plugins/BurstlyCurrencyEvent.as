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