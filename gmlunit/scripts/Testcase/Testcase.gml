function Testcase() constructor {
	testcase = {
		keyword : "test",
		runner : new TestRunner(),
		reportMaker : new GmlunitTcReportMaker(),
		testlog : [],
		getTests : function(target) {
			var tests = [];
			var names = variable_struct_get_names(target);
			
			var len = array_length(names);
			for(var i = 0; i < len; i++) {
				var name = names[i];
				
				if (isValidFormat(name) && is_method(target[$ name])) {
					array_push(tests, name);
				}
			}
			
			return tests;
		},
		isValidFormat : function(name) {
			var len = string_length(keyword);
			var prefix = string_copy(name, 1, len);
			
			if prefix == keyword
				return true;
			else
				return false;
		},
	}
	setUp = __gmlunitnoop;
	teardown = __gmlunitnoop;
	
	CheckTestcase = function() {
		return true;
	}
	
	SetKeyword = function(keyword) {
		testcase.keyword = keyword;
	}
	
	Run = function(hidelog=false) {
		var reportMaker, runner;
		runner = testcase.runner;
		reportMaker = testcase.reportMaker;
		
		reportMaker.Reset();
		
		runner.SetUp(setUp);
		runner.Teardown(teardown);
		
		var tests = testcase.getTests(self);
		var len = array_length(tests);
		for(var i = 0; i < len; i++) {
			var name, callback, result;
			name = tests[i];
			callback = self[$ name];
			
			result = runner.Run(callback, name);
			result.name = name;
			
			reportMaker.Append(result);
		}
		
		if !hidelog {
			var reportlog = GetReportLog();
			show_debug_message(reportlog)
		}
	}
	
	GetReport = function()/*->GmlunitTcReport*/ {
		return testcase.reportMaker.GetReport(instanceof(self));
	}
	
	GetReportLog = function() {
		var report = GetReport();
		
		return report.Detail();
	}
	
	Show = function() {
		var reportlog = GetReportLog();
		
		show_message(reportlog)
	}
	
	ThrowIfFailed = function() {
		var report = GetReport();
		
		if report.fail > 0
			throw new TestcaseException(report);
	}
	
	ShowIfFailed = function() {
		var report = GetReport();
		
		if report.fail > 0
			Show();
	}
}



