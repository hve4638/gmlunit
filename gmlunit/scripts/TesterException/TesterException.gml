function TesterException(resultForatter) constructor {
	failedArray = [];
	
	function parseFailedResult(resultForatter) {
		var results = resultForatter.getResults();
		var len = array_length(results);
		for(var i = 0; i < len; i++) {
			var result = results[i];
		
			if result.IsFailed() {
				var report = { name : "", reason : "" }
				report.name = result.name;
				
				if !is_undefined(result.reason)
					report.reason = result.reason;
					
				array_push(failedArray, report);
			}
		}
	}
	
	function toString() {
		var output = "TesterException\n";
		var len = array_length(failedArray);
		
		switch(len) {
			case 0:
				output += "TILT";
				break
			case 1:
				output += "1 test failed";
				break
			default:
				output += string(len) + " tests failed";
				break
		}
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

