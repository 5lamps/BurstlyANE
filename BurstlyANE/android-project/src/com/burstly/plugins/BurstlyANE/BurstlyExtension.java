package com.burstly.plugins.BurstlyANE;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class BurstlyExtension implements FREExtension {

	private static FREContext _context = null;
	
	@Override
	public FREContext createContext(String extId) {
		// We want only one instance of BurstlyContext globally so when the AIR runtime requests a context we return the one we've created previously if one exists
		if (_context != null)
			return _context;
		
		_context = new BurstlyContext();
		
		return _context;
	}
	
	@Override
	public void dispose() {
		_context = null;
	}

	@Override
	public void initialize() {
		
	}
	
}
