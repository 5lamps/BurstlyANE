# Burstly ANE

## Compiling

Use the 'ant' command within the BurstlyANE/build folder. This will generate BurstlyANE/bin/BurstlyANE.ane. Not
e that we have included the compiled ANE in this repository for convenience.

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



# Technical Documentation

## TestFlight

### Introduction

com.burstly.plugins.TestFlight provides a bridge to all native TestFlight functionality. To use TestFlight for Android, the following tags *MUST* be defined in your AndroidManifest.xml:

			    <application
        			android:name="com.burstly.plugins.TestFlightApplication"
        			android:debuggable="true">
			    
			    	<meta-data android:name="testflight-app-token" android:value="2cb80607-50c0-4f00-819a-e8f1851909b4" />   
			    
			    	…

			    </application>

If both the com.burstly.plugins.TestFlightApplication and the testflight-app-token meta-data tags are not defined in your AndroidManifest.xml, absolutely *NO* TestFlight functionality will be present in your app.

### Class Method Reference

#### takeOff:

	public function takeOff(appToken : String) : void

Starts a TestFlight session using the App Token for this app.

#### passCheckpoint:

	public function passCheckpoint(checkpoint : String) : void

Tracks when a user has passed a checkpoint after the flight has taken off. For example, passed level 1, posted a high score. Checkpoints are sent in the background.




# SkyRocket Ads

### Introduction

com.burstly.plugins.BurstlyAds provides a bridge to all native SkyRocket ads functionality and corresponds one-to-one to all available native SDK methods / functionality.

### Class Method Reference

#### trackDownload:

	public function trackDownload() : void

Tracks a download without displaying any ads. Note that if you display ads a download is tracked automatically. This was added to facilitate download tracking in apps that use just currency functionality or wish to have  finer-grained control over download tracking, such as in instances where an app is Universal and data exists to automatically upgrade a user from 'lite' to full (no ads).

#### createBannerPlacement:

	public function createBannerPlacement(placementName : String, appId : String, zoneId : String, originX : Number, originY : Number, width : Number, height : Number) : void
		
Allocates and initialises a Burstly banner ad instance with the passed placementName, publisherId, zoneId, x-origin, y-origin, width and height. Placement names must be unique across banner and interstitial ads.

#### createInterstitialPlacement:

	public function createInterstitialPlacement(placementName : String, appId : String, zoneId : String) : void

Allocates and initialises a Burstly interstitial ad instance with the passed placementName, publisherId and zoneId. Placement names must be unique across banner and interstitial ads.

#### destroyAdPlacement:

	public function destroyAdPlacement(placementName : String) : void

Deallocates and destroys a Burstly banner or interstitial ad instance. Note that after calling this, the instance will not be able to be accessed and must be recreated.
	
#### showAd:

	public function showAd(placementName : String) : void

Requests an ad from the Burstly. If the placement is a banner placement, the placement must be added to the view hierarchy by using addBannerToView(const char *placementName) to display. Interstitial placements will display the ad immediately if it has been precached or as soon as it is recieved otherwise.

#### cacheAd:

	public function cacheAd(placementName : String) : void

Precaches an interstitial ad for an interstitial placement. This will request and download an interstitial ad in the background but not display it. When the ad is ready to be displayed, showAd(placementName : String) should be called and the ad will display.

#### pauseBanner:

	public function pauseBanner(placementName : String) : void

Pauses the internal refresh timer for a banner ad.

#### unpauseBanner:

	public function unpauseBanner(placementName : String) : void

Unpauses the internal refresh timer for a banner ad.
		
#### addBannerToView:

	public function addBannerToView(placementName : String) : void
	
Adds a banner ad to the view hierarchy, placing it on the screen.
	
#### removeBannerFromView:

	public function removeBannerFromView(placementName : String) : void
	
Removes a banner ad from the view hierarchy, removing it from the screen.
		
#### isAdCached:

	public function isAdCached(placementName : String) : Boolean

Returns TRUE if an interstitial ad has been precached for the given placementName, and FALSE if an interstitial ad has not been precached.

#### setBannerOrigin:

	public function setBannerOrigin(placementName : String, originX : Number, originY : Number) : void

Sets the origin of the banner ad to the given (x, y) pair on the screen. Note that the origin references the top-left corner of the banner and ad it is in relation to the screen coordinates given any rotation that has occured, with the top-left of the screen being (0, 0).

#### setBannerRefreshRate:

	public function setBannerRefreshRate(placementName : String, refreshRate : Number) : void		

Sets the refresh rate for the banner's internal refresh timer in seconds.

#### setTargettingParameters:

	public function setTargettingParameters(placementName : String, targettingParameters : String) : void

Sets the custom publisher targetting data key-value pairs that are to be sent back to the ad server. This should represent a set of comma-delimited key-value pairs that can consist of integer, float or string (must be single-quote delimited) values, e.g. "gender='m',age=22".

#### setAdParameters:

	public function setAdParameters(placementName : String, adParameters : String) : void

Sets the creative-specific ad parameters that are to be sent back to the ad server for cutomising landing page URLs. This should represent a set of comma-delimited key-value pairs that can consist of integer, float or string (must be single-quote delimited) values. e.g. "gender='m',age=22".
		
#### setLoggingEnabled:

	public function setLoggingEnabled(enabled : Boolean) : void
	
Sets whether logging should be enabled or disabled. Logging is enabled by default.

### Event Reference

Events are handled by the BurstlyAds instance dispatching BurstlyAdsEvents instances. These events are as follow below. The placement to which an event pertains can be obtained by calling event.getPlacement().

#### BurstlyAdsEventSucceeded

An ad was successfully loaded for a given placement.

#### BurstlyAdsEventFailed

Ads failed to load for a given placement.

#### BurstlyAdsEventTakeoverFullscreen

An ad's full-screen canvas was presented on the screen.

#### BurstlyAdsEventDismissFullscreen

An ad's full-screen canvas was dismissed from the screen.

#### BurstlyAdsEventHidden

An ad was hidden from the screen.

### BurstlyAdsEventShown

An ad was shown on the screen.

#### BurstlyAdsEventCached

An ad was cached.

#### BurstlyAdsEventClicked

An ad unit was clicked.



# SkyRocket Currency

### Introduction

com.burstly.plugins. BurstlyCurrency provides a bridge to all native SkyRocket currency functionality and corresponds one-to-one to all available native SDK methods / functionality. Note that to use incentivized (rewards) ad units, BurstlyCurrency must be initialized.

### Class Method Reference

#### initialize:

	public function initialize(publisherId : String, userId : String) : void

Initializes the BurstlyCurrency plugin. This method *must* be called before any other BurstlyCurrency method is called. You must pass in publisherId. userId may be passed in as an empty string ("") if you would like to use the default userId handled by BurstlyCurrency. DO NOT pass in NULL if there is no userId.

#### getBalance:

	public function getBalance(currency : String) : Number 

Returns the currency balance for the currency name passed in the parameters held in the local cache. This is updated from the server upon calling updateBalancesFromServer().
		
#### increaseBalance:

	public function increaseBalance(currency : String, amount : Number) : void

Increases the currency balance for the passed currency by the passed amount. This updates the local currency cache and also updates the Burstly server balance as well.
		
#### decreaseBalance:

	public function decreaseBalance(currency : String, amount : Number) : void

Decreases the currency balance for the passed currency by the passed amount. This updates the local currency cache and also updates the Burstly server balance as well.
		
#### updateBalancesFromServer:

	public function updateBalancesFromServer() : void

Initiates a request to update the currency balances for all currencies from the Burstly server. When the request either returns as successful or failed, this class will dispatch a BurstlyCurrencyEvent.

### Event Reference

Events are handled by the BurstlyCurrency instance dispatching BurstlyCurrencyEvents instances. These events are as follow below. 

#### BurstlyCurrencyEventUpdateSucceeded

The currency update request succeeded.

#### BurstlyCurrencyEventUpdateFailed

The currency update request failed.