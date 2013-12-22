# Burstly ANE

## Compiling

Use the 'ant' command within the BurstlyANE/build folder. This will generate BurstlyANE/bin/BurstlyANE.ane

## Adding to your Project (Flash Builder)

- Add the ANE to your project build path (Properties > Flex Build Path > Native Extensions)
- Add the ANE to your builds (Properties > Flex Build Packaging > Apple iOS / Google Android > Native Extensions) by checking the Package checkbox for BurstlyANE.ane
- Add the contents of bin-files/ into your project's bin directory (bin or bin-debug) and ensure that the contents are packaged into the APK as well (Properties > Flex Build Packaging > Google Android > Package Contents)

## Setting up the Manifest (Android only)

- Add the following node to the <android> tag of your application if you require Android support:

        <manifestAdditions><![CDATA[

			<manifest android:installLocation="auto">
			    <application
        			android:name="com.burstly.plugins.TestFlightApplication"
        			android:debuggable="true">
			    
			    	<meta-data android:name="testflight-app-token" android:value="2cb80607-50c0-4f00-819a-e8f1851909b4" />   
			    
			        <activity>
			            <intent-filter>
			                <action android:name="android.intent.action.MAIN"/>
			                <category android:name="android.intent.category.LAUNCHER"/>
			            </intent-filter>
			        </activity>
			        
			        <!-- Begin Burstly Required Activities -->
			        <activity android:name="com.burstly.lib.component.networkcomponent.burstly.BurstlyFullscreenActivity"
							android:configChanges="keyboard|keyboardHidden|orientation"
							android:hardwareAccelerated="true"
							android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />
			
			        <activity android:name="com.google.ads.AdActivity"
							android:hardwareAccelerated="true"
							android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"/>
			
			        <activity android:name="com.greystripe.sdk.GSFullscreenActivity"
							android:hardwareAccelerated="true"
							android:configChanges="keyboard|keyboardHidden|orientation" />
			
			        <activity android:name="com.inmobi.androidsdk.IMBrowserActivity"
							android:hardwareAccelerated="true"
							android:configChanges="keyboardHidden|orientation|keyboard" />
			
			        <activity android:name="com.millennialmedia.android.MMActivity"
							android:hardwareAccelerated="true"
							android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
							android:configChanges="keyboardHidden|orientation|keyboard"/>
							
			        <activity android:name="com.millennialmedia.android.VideoPlayer"
							android:hardwareAccelerated="true"
							android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
							android:configChanges="keyboardHidden|orientation|keyboard" />
			        <!-- End Burstly Required Activities -->

   				</application>
            
			    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
			    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
                <uses-permission android:name="android.permission.INTERNET"/>
			    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
			    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
			    
			    <!-- Optional Burstly permissions -->
			    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
				<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
			    <uses-permission android:name="android.permission.CALL_PHONE"/>
			</manifest>

			
		]]></manifestAdditions>

## After this you should be all set!
