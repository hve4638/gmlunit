function Exception(name = "Exception", reason = undefined, trace=true) constructor {
	self.name = name;
	self.reason = reason;
	self.showstack = trace;
	self.stack = [];
	
	Trace = function(ignore_depth=0) {
		self.stack = TraceStack(ignore_depth+1);
	}
	
	GetStackLog = function() {
		var len = array_length(stack);
		if showstack && len > 0 {
			var output = "  call stack\n"
			
			for(var i = 0; i < len-1; i++)
				output += "    at " + stack[i] + "\n";
			output += "    at " + stack[len-1];
			
			return output;
		}
		else {
			return "";
		}
	}
	
	toString = function() {
		var output;
		output = name + "\n";
		
		if is_string(reason)
			output += " reason - " + reason + "\n";
		
		output += GetStackLog();
		
		return output;
	}
	
	Trace(1);
}











