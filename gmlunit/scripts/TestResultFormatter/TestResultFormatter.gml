function TestResultFormatter() constructor {
	resultArray = [];
	isChanged = false;
	report = {
		total : 0,
		pass : 0,
		fail : 0,
		detail : []
	}
	
	function Add(testResult) {
		array_push(resultArray, testResult);
		isChanged = true;
	}
	
	function Reset() {
		resultArray = [];
		report = { pass : 0, fail : 0, total : 0, detail : [] }
		isChanged = true;
	}
	
	function PassCount() {
		update();
		return report.pass;
	}
	
	function FailCount() {
		update();
		return report.fail;
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
	
 	function Summary() {
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
	
	function Detail() {
		var output = "";
		output += Summary() + "\n";
		
		var len = array_length(report.detail);
		for(var i = 0; i < len; i++)
			output += report.detail[i] + "\n";
		
		return output;
	}
	
	function update() {
		if isChanged {
			sortResult();
			updateStateAndInfo();
			isChanged = false;
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
		report.detail = []
		
		var len = array_length(resultArray);
		for(var i = 0; i < len; i++)
			array_push(report.detail, string(resultArray[i]));
	}
	
	function updateState() {
		var passCount = 0;
		var failCount = 0;
		
		var total = array_length(resultArray);
		for(var i = 0; i < total; i++) {
			var result = resultArray[i];
			
			if result.IsPassed()
				passCount++;
			else if result.IsFailed()
				failCount++;
		}
		
		report.total = total;
		report.pass = passCount;
		report.fail = failCount;
	}
	
	Reset();
}