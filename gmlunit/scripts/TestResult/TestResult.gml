enum TestResultState {
	nothing,
	WIP,
	timeout,
	pass,
	undefinedPass,
	fail,
	failWithError,
}

function TestResult(testcaseName = "") constructor {
	name = testcaseName;
	state = TestResultState.nothing;
	time = 0;
	reason = undefined;
	
	function IsPassed() {
		switch(state) {
			case TestResultState.pass:
			case TestResultState.undefinedPass:
				return true;
			break;
			
			default:
				return false;
			break;
		}
	}
	
	function IsFailed() {
		switch(state) {
			case TestResultState.fail:
			case TestResultState.failWithError:
			case TestResultState.timeout:
				return true;
			break;
			
			default:
				return false;
			break;
		}
	}
	
	function toString() {
		var description;
		description = name + " (" + demical_format(time, 7) + "s)";
		
		var output = "";
		output = stateToString() + " " + description;
		
		if not is_undefined(reason) {
			output += "\n"
			output += " reason - " + string(reason);
		}
		
		return output;
	}
	
	function stateToString() {
		switch(state) {
			case TestResultState.pass:
				return "[PASS]";
			
			case TestResultState.undefinedPass:
				return "[PASS]";
			
			case TestResultState.fail:
			case TestResultState.failWithError:
				return "[FAIL]";
			
			case TestResultState.timeout:
				return "[TIMEOUT]"
			
			case TestResultState.WIP:
				return "[WIP]"
			
			default:
				return "[UNKNOWN]"
		}
	}
}

/*
 * integer_part_pos : 4 = milisecond
 * integer_part_pos : 7 = microsecond
*/
function demical_format(integer, integer_part_pos) {
	var frag_part_pos = integer_part_pos - 1;
	var str, length;
	
	str = string(integer);
	length = string_length(str);
	if length < integer_part_pos {
		str = (integer_part_pos - length) * "0" + str;
	
		length = integer_part_pos;
	}

	str = string_insert(".", str, length + 1 - frag_part_pos);
	return str;
}


