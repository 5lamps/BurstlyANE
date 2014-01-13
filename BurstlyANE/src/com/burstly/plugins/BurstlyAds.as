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

	import flash.desktop.NativeApplication;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	public class BurstlyAds extends EventDispatcher
	{
		
		private static var _instance : BurstlyAds;
		private var _extensionContext : ExtensionContext;
		
		public function BurstlyAds(enforcer : SingletonEnforcer)
		{
			_extensionContext = ExtensionContext.createExtensionContext("com.burstly.plugins.BurstlyANE", null);

			if (!_extensionContext) {
				throw new Error( "Burstly ANE is not supported on this platform." );
			}
		}
		
		public static function getInstance() : BurstlyAds 
		{
			if (!_instance) {
				_instance = new BurstlyAds(new SingletonEnforcer());
				_instance.init();
			}

			return _instance;
		}
		
		public function dispose() : void
		{ 
			_extensionContext.dispose(); 
		}
		
		private function init() : void
		{
			_extensionContext.addEventListener(StatusEvent.STATUS, onStatus);
			
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, onNativeApplicationActivate, false, 0, true);
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, onNativeApplicationDeactivate, false, 0, true);
			
			_extensionContext.call("init");
		}
		
		/********** Core functionality **********/
	
		/*
			Tracks a download without displaying any ads. Note that if you display ads a download is tracked automatically.
			This was added to facilitate download tracking in apps that use just currency functionality or wish to have 
			finer-grained control over download tracking, such as in instances where an app is Universal and data exists to
			automatically upgrade a user from 'lite' to full (no ads).
		*/
		public function trackDownload() : void
		{
			_extensionContext.call("BurstlyAdWrapper_trackDownload");
		}
		
		/*
			Allocates and initialises a Burstly banner ad instance with the passed placementName, publisherId, zoneId, 
			x-origin, y-origin, width and height. Placement names must be unique across banner and interstitial ads.
		*/
		public function createBannerPlacement(placementName : String, appId : String, zoneId : String, originX : Number, originY : Number, width : Number, height : Number) : void
		{
			_extensionContext.call("BurstlyAdWrapper_createBannerPlacement", placementName, appId, zoneId, originX, originY, width, height);
		}
		
		/*
			Allocates and initialises a Burstly interstitial ad instance with the passed placementName, publisherId 
			and zoneId. Placement names must be unique across banner and interstitial ads.
		*/
		public function createInterstitialPlacement(placementName : String, appId : String, zoneId : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_createInterstitialPlacement", placementName, appId, zoneId);
		}
		
		/*
			Deallocates and destroys a Burstly banner or interstitial ad instance. Note that after calling this, 
			the instance will not be able to be accessed and must be recreated.
		*/
		public function destroyAdPlacement(placementName : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_destroyAdPlacement", placementName);
		}
		
		/*
			Requests an ad from the Burstly. If the placement is a banner placement, the placement must be added 
			to the view hierarchy by using addBannerToView(const char *placementName) to display. Interstitial placements 
			will display the ad immediately if it has been precached or as soon as it is recieved otherwise.
		*/
		public function showAd(placementName : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_showAd", placementName);
		}
		
		/*
			Precaches an interstitial ad for an interstitial placement. This will request and download an interstitial 
			ad in the background but not display it. When the ad is ready to be displayed, showAd(placementName : String) 
			should be called and the ad will display.
		*/
		public function cacheAd(placementName : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_cacheAd", placementName);
		}
		
		/*
			Pauses the internal refresh timer for a banner ad.
		*/
		public function pauseBanner(placementName : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_pauseBanner", placementName);
		}
		
		/*
			Unpauses the internal refresh timer for a banner ad.
		*/
		public function unpauseBanner(placementName : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_unpauseBanner", placementName);
		}
		
		/*
			Adds a banner ad to the view hierarchy, placing it on the screen.
		*/
		public function addBannerToView(placementName : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_addBannerToView", placementName);
		}
		
		/*
			Removes a banner ad from the view hierarchy, removing it from the screen.
		*/
		public function removeBannerFromView(placementName : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_removeBannerFromView", placementName);
		}
		
		/*
			Returns TRUE if an interstitial ad has been precached for the given placementName, and FALSE if an interstitial 
			ad has not been precached.
		*/
		public function isAdCached(placementName : String) : Boolean
		{
			return _extensionContext.call("BurstlyAdWrapper_isAdCached", placementName) as Boolean;
		}
		
		/*
			Sets the origin of the banner ad to the given (x, y) pair on the screen. Note that the origin references the top-left 
			corner of the banner and ad it is in relation to the screen coordinates given any rotation that has occured, with the 
			top-left of the screen being (0, 0).
		*/
		public function setBannerOrigin(placementName : String, originX : Number, originY : Number) : void
		{
			_extensionContext.call("BurstlyAdWrapper_setBannerOrigin", placementName, originX, originY);
		}
		
		/*
			Sets the refresh rate for the banner's internal refresh timer in seconds.
		*/
		public function setBannerRefreshRate(placementName : String, refreshRate : Number) : void
		{
			_extensionContext.call("BurstlyAdWrapper_setBannerRefreshRate", placementName, refreshRate);
		}
		
		/*	
			Sets the custom publisher targetting data key-value pairs that are to be sent back to the ad server. This should represent a 
			set of comma-delimited key-value pairs that can consist of integer, float or string (must be single-quote delimited) values, 
			e.g. "gender='m',age=22".
		*/
		public function setTargettingParameters(placementName : String, targettingParameters : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_setTargettingParameters", placementName, targettingParameters);
		}
		
		/*	
			Sets the creative-specific ad parameters that are to be sent back to the ad server for cutomising landing page URLs. This 
			should represent a set of comma-delimited key-value pairs that can consist of integer, float or string (must be single-quote 
			delimited) values. e.g. "gender='m',age=22".
		*/
		public function setAdParameters(placementName : String, adParameters : String) : void
		{
			_extensionContext.call("BurstlyAdWrapper_setAdParameters", placementName, adParameters);
		}
		
		/*	
			Sets whether logging should be enabled or disabled. Logging is enabled by default.
		*/
		public function setLoggingEnabled(enabled : Boolean) : void
		{
			_extensionContext.call("BurstlyAdWrapper_setLoggingEnabled", enabled);
		}
		
		/********** Events / Lifecycle **********/
		
		private function onStatus(event : StatusEvent) : void
		{
			
			if (event.code == BurstlyAdsEvent.BurstlyAdsEventSucceeded || 
				event.code == BurstlyAdsEvent.BurstlyAdsEventFailed || 
				event.code == BurstlyAdsEvent.BurstlyAdsEventTakeoverFullscreen || 
				event.code == BurstlyAdsEvent.BurstlyAdsEventDismissFullscreen || 
				event.code == BurstlyAdsEvent.BurstlyAdsEventHidden || 
				event.code == BurstlyAdsEvent.BurstlyAdsEventShown || 
				event.code == BurstlyAdsEvent.BurstlyAdsEventCached || 
				event.code == BurstlyAdsEvent.BurstlyAdsEventClicked)
			{
				dispatchEvent(new BurstlyAdsEvent(event.code, event.level));
			}
		}
		
		private function onNativeApplicationActivate(event : Event) : void
		{
			if (Capabilities.manufacturer.indexOf("Android") != -1)
			{
				_extensionContext.call("BurstlyANE_onNativeApplicationActivate");
			}
		}
		
		private function onNativeApplicationDeactivate(event : Event) : void
		{
			if (Capabilities.manufacturer.indexOf("Android") != -1)
			{
				_extensionContext.call("BurstlyANE_onNativeApplicationDeactivate");
			}
		}
		
	}
}

internal class SingletonEnforcer { }