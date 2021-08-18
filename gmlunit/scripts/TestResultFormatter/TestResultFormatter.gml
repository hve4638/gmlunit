function TestResultFormatter() constructor {
	resultArray = [];
	changed = false;
	report = {
		total : 0,
		pass : 0,
		fail : 0,
		results : []
	}
	
	function passCount() {
		update();
		return state.pass;
	}
	
	function failCount() {
		update();
		return state.fail;
	}
	
	function getResults() {
		if array_length(resultArray) > 0 {
			var results = resultArray;
			results[0] = results[0];
		
			return results;
		}
		else
			return [];
	}
	
	
 	function summary() {
		update();
		
		var total, pass, fail;
		total = "Total(" + string(report.total) + ") ";
		pass = "Pass(" + string(report.pass) + ") ";
		fail = "Fail(" + string(report.fail) + ") ";
		
		var passRate;
		passRate = string(100 * report.pass / report.total);
		
		var output = "";
		output += total + pass + fail + "\n";
		output += "Pass rate: " + passRate + "%";
		
		return output;
	}
	
	function detail() {
		var output = "";
		output += summary() + "\n";
		
		var len = array_length(report.results);
		for(var i = 0; i < len; i++) {
			var result = report.results[i];
			
			if result.passed
				output += "[PASS] "
			else
				output += "[FAIL] "
				
			output += result.name + " " + result.reason;
			output += "\n"
		}
		
		return output;
	}
	
	function update() {
		if changed {
			sortResult();
			
			updateStateAndInfo();
			changed = false;
		}
	}
	
	function sortResult() {
		array_sort(resultArray, function(a, b) {
			var arr = [a.name, b.name];
			array_sort(arr, true);
			
			if (arr[0] == a.name)
				return -1;
			else
				return 1;
		});
	}
	
	function updateStateAndInfo() {
		updateState();
		report.results = []
		
		var len = array_length(resultArray);
		for(var i = 0; i < len; i++) {
			var result = resultArray[i];
			var info = {
				name : "",
				passed : false,
				reason : ""
			}
			
			info.name = result.name;
			
			if result.isPassed()
				info.passed = true;
			
			if !is_undefined(result.reason)
				info.reason = string(result.reason);
		
			array_push(report.results, info);
		}
	}
	
	function updateState() {
		var passCount = 0;
		var failCount = 0;
		
		var total = array_length(resultArray);
		for(var i = 0; i < total; i++) {
			var result = resultArray[i];
			
			if result.isPassed()
				passCount++;
			else if result.isFailed()
				failCount++;
		}
		
		report.total = total;
		report.pass = passCount;
		report.fail = failCount;
	}
	
	function add(testResult) {
		array_push(resultArray, testResult);
		changed = true;
	}
	
	function reset() {
		resultArray = [];
		state = { pass : 0, fail : 0, total : 0 }
		changed = true;
	}
}