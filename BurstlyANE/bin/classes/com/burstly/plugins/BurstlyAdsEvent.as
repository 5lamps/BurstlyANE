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

