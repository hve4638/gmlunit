function AssertionException(message = "", isTraceStack = false) constructor {
	self.message = message;
	stacktrace = [];
	onTraceStack = isTraceStack;
	
	function traceStack() {
		try {
			show_error("throw", true);	
		}
		catch(ex) {
			var len = array_length(ex.stacktrace);
			
			stacktrace = [];
			array_copy(stacktrace, 0, ex.stacktrace, 2, len - 2);
		}
	}
	
	function toString() {
		var output =	message != ""
						? message
						: "AssertionError"		
		output += "\n"
		
		if onTraceStack {
			var len = array_length(stacktrace);
			for(var i = 0; i < len; i++)
				output += "[" + string(len - i - 1) + "] "
						+ stacktrace[i] + "\n";
		}
		
		var len = string_length(output);
		return string_delete(output, len, 1);
	}
	
	function getStacktrace() {
		return stacktrace;
	}
	
	traceStack();
}
