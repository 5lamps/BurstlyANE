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

import com.testflightapp.lib.TestFlight;

import android.app.Application;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;

public class TestFlightApplication extends Application {

	/*
	 * It is required to call the TestFlight.takeOff() method in the onCreate() method of an Application. This class/override
	 * looks in the manifest for a testflight-app-token meta-data tag and then calls TestFlight.takeOff() accordingly.
	 */
    @Override 
    public void onCreate() { 
    	super.onCreate(); 
    	
    	TestFlightWrapper.init(this);
    	
    	try {
    		String appToken = (String)this.getPackageManager().getApplicationInfo(this.getPackageName(), PackageManager.GET_META_DATA).metaData.get("testflight-app-token");
			TestFlight.takeOff(this, appToken);
			
			TestFlightWrapper.initializedInApplication();
		} catch (NameNotFoundException nnfe) {
			/*
			 * This means that the AndroidManifest does not have the required meta-data tag (example below)
			 * 
			 *  <meta-data android:name="testflight-app-token" android:value="2cb80607-50c0-4f00-819a-e8f1851909b4" />				
			 *  
			 */
			
			Log.e("TestFlightPlugin", "ERROR: AndroidManifest.xml does not have required testflight-app-token meta-data tag");
		}
    	
    } 
	
}
