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
