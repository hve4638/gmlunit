function TesterException(resultForatter) constructor {
	failedArray = [];
	
	function parseFailedResult(resultForatter) {
		var results = resultForatter.getResults();
		var len = array_length(results);
		for(var i = 0; i < len; i++) {
			var result = results[i];
		
			if result.isFailed() {
				var report = { name : "", reason : "" }
				report.name = result.name;
				
				if !is_undefined(result.reason)
					report.reason = result.reason;
					
				array_push(failedArray, report);
			}
		}
	}
	
	function toString() {
		var output = ""
		var len = array_length(failedArray);
		
		output += len == 1
				  ? "1 test failed"
				  : string(len) + " tests failed";
		output += "\n";
		
		for(var i = 0; i < len; i++) {
			var report = failedArray[i];
			var str = "";
			str += "[" + string(i + 1) + "] ";
			str += string(report.name) + " ";
			str += string(report.reason)
			
			output += str + "\n";
		}
		
		return output;
	}
	
	parseFailedResult(resultForatter);
}

