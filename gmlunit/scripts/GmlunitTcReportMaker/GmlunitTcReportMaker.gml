///@Todo-220309 Rename > GmlunitTcReportMaker
function GmlunitTcReportMaker() constructor {
	results = []; //[] GmlunitSingleTestReport
	changed = true;
	report = new GmlunitTcReport();
	
	Append = function(tcresult/*:GmlunitTcResult*/) {
		changed = true;
		
		array_push(results, tcresult);
	}
	
	Reset = function() {
		changed = true;
		
		results = [];
		report = new GmlunitTcReport();
	}
	
	GetReport = function(name) {
		update();
		
		var cp = report.Copy();
		cp.name = name;
		return cp;
	}
	
	update = function() {
		if changed {
			sortResultsByName();
			updateDetail();
			
			changed = false;
		}
	}
	
	sortResultsByName = function() {
		array_sort(results, function(a, b) {
			var sorted = [a.name, b.name];
			array_sort(sorted, true);
			
			return (sorted[0] == a.name) ? -1 : 1;
		});
	}
	
	updateDetail = function() {
		report.detail = [];
		
		var len = array_length(results);
		for(var i = 0; i < len; i++) {
			var tcresult = results[i];
			var out/*:struct*/ = new GmlunitSingleTestReport(tcresult);
			
			array_push(report.detail, out);
		}
		
		updateStat();
	}
	
	updateStat = function() {
		var pass, fail, unknown;
		pass = 0;
		fail = 0;
		unknown = 0;
		
		var len = array_length(report.detail);
		for(var i = 0; i < len; i++) {
			var r = report.detail[i];
			
			if r.pass
				pass++;
			else if r.fail
				fail++;
			else
				unknown++;
		}
		
		report.total = len;
		report.pass = pass;
		report.fail = fail;
	}
	
	Reset();
}



