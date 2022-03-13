function TestRunner() constructor {
	setUp = __gmlunitnoop;
	tearDown = __gmlunitnoop;
	
	SetUp = function(callback) {
		if (callback == undefined)
			callback = __gmlunitnoop;
		
		setUp = callback;
	}
	
	Teardown = function(callback) {
		tearDown = callback;
	}
	
	Run = function(call, name=undefined) {
		var result, noexception;
		var tcresult, timer, resultsetter;
		tcresult = new GmlunitTcResult(name);
		timer = new GmlunitTcResultTimer(tcresult);
		resultsetter = new GmlunitTcResultSetter(tcresult);
		noexception = true;
		
		setUp();
		
		try {
			timer.Start();
			result = call();
		}
		catch(reason) {
			noexception = false;
			resultsetter.FailByException(reason);
		}
		finally {
			timer.Stop();
			tearDown();
		}
		
		if noexception {
			if result == undefined
				resultsetter.Pass();
			else if bool(result)
				resultsetter.Pass();
			else
				resultsetter.Fail();
		}
		
		return tcresult;
	}
}




