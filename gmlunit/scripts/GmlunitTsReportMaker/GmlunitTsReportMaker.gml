function GmlunitTsReportMaker() constructor {
	changed = true;
	report = new GmlunitTsReport();
	subreports = []
	
	Append = function(tcreport/*:GmlunitTcReport*/) {
		changed = true;
		array_push(subreports, tcreport);
	}
	
	Reset = function() {
		changed = true;
		
		report = new GmlunitTsReport();
		subreports = []
	}
		
	GetReport = function(name) {
		update();
		
		var cp = report.Copy()
		cp.name = name;
		return cp;
	}
	
	update = function() {
		if changed {
			changed = false;
			
			parseSubreports();
		}
	}
	
	parseSubreports = function() {
		var len = array_length(subreports);
		for(var i = 0; i < len; i++) {
			parseSubreport(subreports[i])
		}
	}
	
	parseSubreport = function(tcreport/*:GmlunitTcReport*/) {
		if tcreport.fail == 0 {
			report.pass++;
		}
		else {
			report.fail++;
			appendSubreportFails(tcreport);
		}
		report.total++;
	}
	
	appendSubreportFails = function(tcreport/*:GmlunitTcReport*/) {
		var prefix = tcreport.name;
		var len = array_length(tcreport.detail)
		
		for(var i = 0; i < len; i++) {
			var rp = tcreport.detail[i]; /**/
			
			if rp.fail {
				rp.name = prefix + "::" + rp.name;
				array_push(report.faildetail, rp);
			}
		}
	}
	
	Reset();
}












