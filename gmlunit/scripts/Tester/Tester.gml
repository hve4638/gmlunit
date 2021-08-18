function Tester() constructor {
	keyword = "test";
	runner = new TestRunner();
	formatter = new TestResultFormatter();
	
	function run() {
		var testArray = getTests();
		
		var testName, testMethod;
		var len = array_length(testArray);
		for(var i = 0; i < len; i++) {
			testName = testArray[i];
			testMethod = self[$ testName];
			
			var result;
			result = runner.run(testMethod);
			result.name = testName;
			
			formatter.add(result);
		}
	}
	
	function getTests() {
		var testArray = [];
		var names = variable_struct_get_names(self);
		
		var len = array_length(names);
		for(var i = 0; i < len; i++) {
			var str = names[i];
			
			if isTestFormat(str)
				array_push(testArray, str);
		}
		
		return testArray;
	}
	
	function isTestFormat(str) {
		if string_copy(str, 1, string_length(keyword)) == keyword {
			if is_method(self[$ str])
				return true;
		}
		
		return false;
	}
	
	function show() {
		show_message(formatter.detail())
	}
	
	function throwIfFailed() {
		if formatter.failCount() > 0
			throw new TesterException(formatter);
	}
	
	function showIfFailed() {
		if formatter.failCount() > 0 
			show_message(new TesterException(formatter));
	}
}