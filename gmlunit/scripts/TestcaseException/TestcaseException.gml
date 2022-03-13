function TestcaseException(report) constructor {
	self.report = report;
	self.message = "";
	
	parseReport = function(report) {
		message = "";
		
		var len = array_length(report.detail);
		for(var i = 0; i < len; i++) {
			var result = report.detail[i];
		
			if result.fail
				message += result.detail;
		}
	}

	toString = function() {
		var output = "TestcaseException\n";
		
		output += failCount(report.fail) + "\n";
		output += message;
		
		return output;
	}
	
	failCount = function(count) {
		switch(count) {
			case 0:
				return "TILT";
			case 1:
				return "1 failed";
			default:
				return string(count) + " failed";
		}
	}
	
	parseReport(self.report);
}











