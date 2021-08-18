function TestRunner() constructor {
	function run(testMethod) {
		var isSuccess;
		var beginTime, endTime;
		var result = new TestResult();

		try {
			beginTime = get_timer();
			isSuccess = testMethod();
			endTime = get_timer();
		}
		catch(reason) {
			endTime = get_timer();
			
			if instanceof(reason) == "YYGMLException" {
				reason = new YYGMLWrapper(reason);
			}
			
			result.state = TestResultState.failWithError;
			result.reason = reason;
		}
		
		if result.state != TestResultState.failWithError {
			if is_undefined(isSuccess)
				result.state = TestResultState.undefinedPass;
			else if bool(isSuccess)
				result.state = TestResultState.pass;
			else
				result.state = TestResultState.fail;
		}
		
		result.time = endTime - beginTime;
		
		return result;
	}
}
