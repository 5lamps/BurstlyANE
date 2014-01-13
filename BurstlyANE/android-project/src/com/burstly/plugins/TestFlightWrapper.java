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

package com.burstly.plugins;

import android.app.Application;
import android.util.Log;

import com.testflightapp.lib.TestFlight;

public class TestFlightWrapper {
	
	private static Application mApplication = null;
	private static boolean mInitialized = false;

	
	/*
	 * Initialises TestFlightWrapper. Must be called before any TestFlight functionality is used.
	 * 
	 *  @param	aApplication	The application for your app.
	 */
	public static void init(Application aApplication) {
		mApplication = aApplication;
	}
	
	/*
	 * Helper method called in TestFlightApplication to indicate that TestFlight was appropriately initialized
	 * within the Application.onCreate() method.
	 */
	public static void initializedInApplication() {
		mInitialized = true;
	}
 	
	/*
	 * TestFlight initialization method. Exposed here but the initialization logic in TestFlightApplication.onCreate()
	 * renders any calls of this method after TestFlightApplication.onCreate() inoperative as TestFlight will have
	 * already been initialized. Hypothetically the takeOff call in TestFlightApplication.onCreate() could be left out
	 * and this method called as long as TestFlightWrapper.init() is called (perhaps in an Activity passing the Activity's
	 * getApplication()), but in our tests, TestFlight.takeOff() *MUST* be called in an Application.onCreate() override.
	 * 
	 *  @param	sAppToken	Your app's TestFlight app token.
	 */
	public static void takeOff(String sAppToken) {
		if (mApplication == null) {
			Log.e("TestFlightPlugin", "ERROR: The plugin has not been initialised with your Application. TestFlightWrapper.init(Application aApplication) MUST be called before any TestFlight functions are called.");
			return;
		}
		
		TestFlight.takeOff(mApplication, sAppToken);
		
		mInitialized = true;
	}
	
	/*
	 * Sends a checkpoint to TestFlight.
	 * 
	 * @param	sCheckpoint		The name of the checkpoint passed.
	 */
	public static void passCheckpoint(String sCheckpoint) {
		if (!mInitialized) {
			Log.e("TestFlightPlugin", "ERROR: TestFlightWrapper.takeOff() has not been called with your app token. This method MUST be called before any other TestFlight functions are called.");
			return;
		}
		
		TestFlight.passCheckpoint(sCheckpoint);
	}
	
}
