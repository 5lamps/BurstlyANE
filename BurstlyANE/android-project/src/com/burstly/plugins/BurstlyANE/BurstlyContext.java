package com.burstly.plugins.BurstlyANE;

import java.util.HashMap;
import java.util.Map;

import android.app.Activity;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

import com.burstly.lib.conveniencelayer.Burstly;
import com.burstly.plugins.BurstlyAdWrapper;
import com.burstly.plugins.BurstlyCurrencyWrapper;
import com.burstly.plugins.TestFlightWrapper;

public class BurstlyContext extends FREContext {

	private static boolean _inited = false;
	
	@Override
	public void dispose() {

	}

	@Override
	public Map<String, FREFunction> getFunctions() {

		Map<String, FREFunction> functions = new HashMap<String, FREFunction>();
		
		functions.put("init", new BurstlyANE_init());
		functions.put("BurstlyANE_onNativeApplicationActivate", new BurstlyANE_onNativeApplicationActivate());
		functions.put("BurstlyANE_onNativeApplicationDeactivate", new BurstlyANE_onNativeApplicationDeactivate());
		
		/* Burstly Ad Functionality */
		functions.put("BurstlyAdWrapper_trackDownload", new BurstlyAdWrapper_trackDownload());
		functions.put("BurstlyAdWrapper_createBannerPlacement", new BurstlyAdWrapper_createBannerPlacement());

        functions.put("BurstlyAdWrapper_createInterstitialPlacement", new BurstlyAdWrapper_createInterstitialPlacement());
        functions.put("BurstlyAdWrapper_destroyAdPlacement", new BurstlyAdWrapper_destroyAdPlacement());
		functions.put("BurstlyAdWrapper_showAd", new BurstlyAdWrapper_showAd());
        functions.put("BurstlyAdWrapper_cacheAd", new BurstlyAdWrapper_cacheAd());
        functions.put("BurstlyAdWrapper_pauseBanner", new BurstlyAdWrapper_pauseBanner());
        functions.put("BurstlyAdWrapper_unpauseBanner", new BurstlyAdWrapper_unpauseBanner());
		functions.put("BurstlyAdWrapper_addBannerToView", new BurstlyAdWrapper_addBannerToView());
        functions.put("BurstlyAdWrapper_removeBannerFromView", new BurstlyAdWrapper_removeBannerFromView());
        functions.put("BurstlyAdWrapper_isAdCached", new BurstlyAdWrapper_isAdCached());
        functions.put("BurstlyAdWrapper_setBannerOrigin", new BurstlyAdWrapper_setBannerOrigin());
        functions.put("BurstlyAdWrapper_setBannerRefreshRate", new BurstlyAdWrapper_setBannerRefreshRate());
        functions.put("BurstlyAdWrapper_setTargettingParameters", new BurstlyAdWrapper_setTargettingParameters());
        functions.put("BurstlyAdWrapper_setAdParameters", new BurstlyAdWrapper_setAdParameters());
        functions.put("BurstlyAdWrapper_setLoggingEnabled", new BurstlyAdWrapper_setLoggingEnabled());

        /* Burstly Currency Functionality */
        functions.put("BurstlyCurrencyWrapper_initialize", new BurstlyCurrencyWrapper_initialize());       
        functions.put("BurstlyCurrencyWrapper_getBalance", new BurstlyCurrencyWrapper_getBalance());
        functions.put("BurstlyCurrencyWrapper_increaseBalance", new BurstlyCurrencyWrapper_increaseBalance());
        functions.put("BurstlyCurrencyWrapper_decreaseBalance", new BurstlyCurrencyWrapper_decreaseBalance());
        functions.put("BurstlyCurrencyWrapper_updateBalancesFromServer", new BurstlyCurrencyWrapper_updateBalancesFromServer());

        /* TestFlight Functionality */        
        functions.put("TestFlightWrapper_takeOff", new TestFlightWrapper_takeOff());
        functions.put("TestFlightWrapper_passCheckpoint", new TestFlightWrapper_passCheckpoint());

		return functions;
	}
	
	private class BurstlyANE_init implements FREFunction {
		
		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			// Make sure that this can be inited only once
			if (_inited) return null;
			_inited = true;
			
			Activity activity = context.getActivity();
			
			BurstlyAdWrapper.init(activity);
			BurstlyAdWrapper.setAIRContext(context);
			
			BurstlyCurrencyWrapper.init(activity);
			BurstlyCurrencyWrapper.setAIRContext(context);
			
			BurstlyAdWrapper.createViewLayout();
			return null;
		}
		
	}
	
	private class BurstlyANE_onNativeApplicationActivate implements FREFunction {
		
		@Override
		public FREObject call(FREContext context, FREObject[] args) {

			Activity activity = context.getActivity();
			
			BurstlyAdWrapper.onResumeActivity(activity);
			BurstlyCurrencyWrapper.onResumeActivity(activity);
			
			return null;
		}
		
	}
	
	private class BurstlyANE_onNativeApplicationDeactivate implements FREFunction {
		
		@Override
		public FREObject call(FREContext context, FREObject[] args) {

			Activity activity = context.getActivity();
			
			BurstlyAdWrapper.onPauseActivity(activity);
			BurstlyCurrencyWrapper.onPauseActivity(activity);
			
			return null;
		}
		
	}
	
	/********** Burstly Ad Functionality **********/
	
	private class BurstlyAdWrapper_trackDownload implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			// Stubbed since this doesn't do anything in Android - downloads are tracked on init.
			
			return null;
		}
		
	}
	
	private class BurstlyAdWrapper_createBannerPlacement implements FREFunction {
		
		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.createBannerPlacement(	args[0].getAsString(), 
														args[1].getAsString(),
														args[2].getAsString(), 
														(float)args[3].getAsDouble(), 
														(float)args[4].getAsDouble(), 
														(float)args[5].getAsDouble(), 
														(float)args[6].getAsDouble());
			} catch (Exception e) {

			}
			
			return null;
		}
		
	}
	
	private class BurstlyAdWrapper_createInterstitialPlacement implements FREFunction {
		
		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.createInterstitialPlacement(	args[0].getAsString(), 
																args[1].getAsString(),
																args[2].getAsString());
			} catch (Exception e) {

			}
			
			return null;
		}
		
	}
	
	private class BurstlyAdWrapper_destroyAdPlacement implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.destroyAdPlacement(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}
	
	private class BurstlyAdWrapper_showAd implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.showAd(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}
	
	private class BurstlyAdWrapper_cacheAd implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.cacheAd(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyAdWrapper_pauseBanner implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.pauseBanner(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyAdWrapper_unpauseBanner implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.unpauseBanner(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}
	
	private class BurstlyAdWrapper_addBannerToView implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.addBannerToView(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}
	
	private class BurstlyAdWrapper_removeBannerFromView implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.removeBannerFromView(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyAdWrapper_isAdCached implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			String placementName = "";
			FREObject returnValue = null;
			try {
				placementName = args[0].getAsString();
				returnValue = FREObject.newObject(BurstlyAdWrapper.isAdCached(placementName));
			} catch (Exception e) {
				return null;
			}
			
			return returnValue;
		}
		
	}

	private class BurstlyAdWrapper_setBannerOrigin implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.setBannerOrigin(	args[0].getAsString(),
													(float)args[1].getAsDouble(),
													(float)args[2].getAsDouble());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyAdWrapper_setBannerRefreshRate implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.setBannerRefreshRate(	args[0].getAsString(),
														(float)args[1].getAsDouble());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyAdWrapper_setTargettingParameters implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.setTargettingParameters(	args[0].getAsString(),
															args[1].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyAdWrapper_setAdParameters implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.setAdParameters(	args[0].getAsString(),
													args[1].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyAdWrapper_setLoggingEnabled implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyAdWrapper.setLoggingEnabled(args[0].getAsBool());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}
	
	/********** Burstly Currency Functionality **********/

	private class BurstlyCurrencyWrapper_initialize implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyCurrencyWrapper.initialize(	args[0].getAsString(),
													args[1].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyCurrencyWrapper_getBalance implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			String placementName = "";
			FREObject returnValue = null;
			try {
				placementName = args[0].getAsString();
				returnValue = FREObject.newObject(BurstlyCurrencyWrapper.getBalance(placementName));
			} catch (Exception e) {
				return null;
			}
			
			return returnValue;
		}
		
	}

	private class BurstlyCurrencyWrapper_increaseBalance implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyCurrencyWrapper.increaseBalance(	args[0].getAsString(),
														args[1].getAsInt());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyCurrencyWrapper_decreaseBalance implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				BurstlyCurrencyWrapper.decreaseBalance(	args[0].getAsString(),
														args[1].getAsInt());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}

	private class BurstlyCurrencyWrapper_updateBalancesFromServer implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			BurstlyCurrencyWrapper.updateBalancesFromServer();
			
			return null;
		}
		
	}
	
	/********** TestFlight Functionality **********/
	
	private class TestFlightWrapper_takeOff implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				TestFlightWrapper.takeOff(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}
	
	private class TestFlightWrapper_passCheckpoint implements FREFunction {

		@Override
		public FREObject call(FREContext context, FREObject[] args) {
			
			try {
				TestFlightWrapper.passCheckpoint(args[0].getAsString());
			} catch (Exception e) {
				
			}
			
			return null;
		}
		
	}
	
}
