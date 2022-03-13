function AssertionException(name = "", trace = false) : Exception("Assertion failed", undefined, trace) constructor {
	self.assertionName = name;
	
	Reason = function(reason) {
		self.reason = reason;
	}
	
	ReasonExpected = function(expected, actual) {
		self.Reason("expected <" + string(expected) + ">, but <" + string(actual) + ">");
	}
	
	toString = function() {
		var output;
		output = name;
		output += assertionName=="" ? "" : " <"+assertionName+">";
		output += "\n";
		
		if is_string(reason)
			output += " reason - " + reason + "\n";
		
		output += GetStackLog();
		
		return output;
	}
	
	Trace(1);
}
