function TestsuiteException(tsreport/*:GmlunitTsReport*/) constructor {
	self.report = tsreport;
	self.message = "";
	
	toString = function() {
		var output = "TestsuiteException\n";
		output += self.report.name + "\n"
		output += self.report.Detail();
		
		return output;
	}
}