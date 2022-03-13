function Testsuite() constructor {
	testsuite = {
		testcases : [],
		reportMaker : new GmlunitTsReportMaker(),
	}
	
	CheckTestcase = function() {
		return true;
	}
	
	CheckTestsuite = function() {
		return true;
	}
	
	Add = function(testcase/*:Testcase*/) {
		array_push(testsuite.testcases, testcase);
	}
	
	Run = function(hidelog=false) {
		testsuite.reportMaker.Reset();
		
		var len = array_length(testsuite.testcases);
		for(var i = 0; i < len; i++) {
			var ctor = testsuite.testcases[i]
			var testcase/*:Testcase*/ = new ctor();
			
			testcase.Run(true);
			
			if !hidelog {
				var tcreport/*:GmlunitTcReport*/ = testcase.GetReport();
				show_debug_message(tcreport.name + " ... " + (tcreport.fail==0 ? "ok" : "failed"))
				testsuite.reportMaker.Append(tcreport)
			}
		}
		
		if !hidelog {
			var reportlog = GetReportLog()
			
			show_debug_message(reportlog);
		}
	}
	
	GetReport = function()/*->GmlunitTsReport*/ {
		return testsuite.reportMaker.GetReport(instanceof(self));
	}
	
	GetReportLog = function() {
		var report = GetReport();
		
		return report.Detail();
	}
	
	Show = function() {
		var report = GetReport();
		
		show_message(report.Detail());
	}
	
	ThrowIfFailed = function() {
		var report = GetReport();
		
		if report.fail > 0
			throw new TestsuiteException(report);
	}
	
	ShowIfFailed = function() {
		var report = GetReport();
		
		if report.fail > 0
			Show();
	}
}





