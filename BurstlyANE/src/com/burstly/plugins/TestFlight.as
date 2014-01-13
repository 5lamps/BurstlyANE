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
	
	import flash.external.ExtensionContext;
	
	public class TestFlight
	{
		
		private static var _instance : TestFlight;
		private var _extensionContext : ExtensionContext;
		
		public function TestFlight(enforcer : SingletonEnforcer)
		{
			_extensionContext = ExtensionContext.createExtensionContext("com.burstly.plugins.BurstlyANE", "" );
			if (!_extensionContext) {
				throw new Error( "Burstly ANE is not supported on this platform." );
			}
		}
		
		public static function getInstance() : TestFlight 
		{
			if (!_instance) {
				_instance = new TestFlight(new SingletonEnforcer());
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
			_extensionContext.call("init");
		}
		
		/*
			Starts a TestFlight session using the App Token for this app.
		*/
		public function takeOff(appToken : String) : void
		{
			_extensionContext.call("TestFlightWrapper_takeOff", appToken);
		}
		
		/*
			Tracks when a user has passed a checkpoint after the flight has taken off. For example, passed level 1,
			posted a high score. Checkpoints are sent in the background.
		*/
		public function passCheckpoint(checkpoint : String) : void
		{
			_extensionContext.call("TestFlightWrapper_passCheckpoint", checkpoint);
		}
		
	}
}

internal class SingletonEnforcer { }