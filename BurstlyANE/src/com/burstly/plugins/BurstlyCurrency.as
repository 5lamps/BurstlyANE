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
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	public class BurstlyCurrency extends EventDispatcher
	{
		
		private static var _instance : BurstlyCurrency;
		private var _extensionContext : ExtensionContext;
		
		public function BurstlyCurrency(enforcer : SingletonEnforcer)
		{
			_extensionContext = ExtensionContext.createExtensionContext("com.burstly.plugins.BurstlyANE", "" );
			if (!_extensionContext) {
				throw new Error( "Burstly ANE is not supported on this platform." );
			}
		}
		
		public static function getInstance() : BurstlyCurrency 
		{
			if (!_instance) {
				_instance = new BurstlyCurrency(new SingletonEnforcer());
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
			Initializes the BurstlyCurrency plugin. This method *must* be called before any other BurstlyCurrency method is called.
			You must pass in publisherId. userId may be passed in as an empty string ("") if you would like to use the default
			userId handled by BurstlyCurrency. DO NOT pass in NULL if there is no userId.
		*/
		public function initialize(publisherId : String, userId : String) : void
		{
			_extensionContext.call("BurstlyCurrencyWrapper_initialize", publisherId, userId);
		}
		
		/*
			Returns the currency balance for the currency name passed in the parameters held in the local cache. This is updated from the
			server upon calling updateBalancesFromServer().
		*/
		public function getBalance(currency : String) : Number 
		{
			return Number(_extensionContext.call("BurstlyCurrencyWrapper_getBalance", currency));
		} 
		
		/*
			Increases the currency balance for the passed currency by the passed amount. This updates the local currency cache and also
			updates the Burstly server balance as well.
		*/	
		public function increaseBalance(currency : String, amount : Number) : void
		{
			_extensionContext.call("BurstlyCurrencyWrapper_increaseBalance", currency, amount);
		}
		
		/*
			Decreases the currency balance for the passed currency by the passed amount. This updates the local currency cache and also
			updates the Burstly server balance as well.
		*/
		public function decreaseBalance(currency : String, amount : Number) : void
		{
			_extensionContext.call("BurstlyCurrencyWrapper_decreaseBalance", currency, amount);
		}
		
		/*
			Initiates a request to update the currency balances for all currencies from the Burstly server. When the request either 
			returns as successful or failed, this class will dispatch a BurstlyCurrencyEvent.
		*/
		public function updateBalancesFromServer() : void
		{
			_extensionContext.call("BurstlyCurrencyWrapper_updateBalancesFromServer");
		}	
		
		/********** Events / Lifecycle **********/
		
		private function onStatus(event : StatusEvent) : void
		{
			if (event.code == BurstlyCurrencyEvent.BurstlyCurrencyEventUpdateSucceeded || 
				event.code == BurstlyCurrencyEvent.BurstlyCurrencyEventUpdateFailed)
			{
				dispatchEvent(new BurstlyCurrencyEvent(event.code));
			}
		}
		
		private function onNativeApplicationActivate(event : Event) : void
		{
			if (Capabilities.manufacturer.indexOf("Android") != -1)
			{
				
			}
		}
		
		private function onNativeApplicationDeactivate(event : Event) : void
		{
			if (Capabilities.manufacturer.indexOf("Android") != -1)
			{
				
			}
		}
	}
}

internal class SingletonEnforcer { }