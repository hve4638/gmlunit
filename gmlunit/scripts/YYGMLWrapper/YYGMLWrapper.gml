function YYGMLWrapper(exception) constructor {
	message = "";
	longMessage = "";
	stackMessage = "";
	
	function parseException(exception) {
		message = exception.message;
		longMessage = exception.longMessage;
		parseStack(exception.stacktrace);
	}
	
	function parseStack(stacktrace) {
		var output = "";
		var len = array_length(stacktrace);
		
		//output += "stacktrace : \n";
		for(var i = 0; i < len; i++)
			output += "[" + string(len - i - 1) + "] " + stacktrace[i] + "\n";
		
		stackMessage = output;
	}
	
	function toString() {
		var output = message;
		return output
	}
	
	parseException(exception);
}