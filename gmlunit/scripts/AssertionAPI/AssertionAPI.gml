function Assert(condition, message = "", trace = true) {
	if not bool(condition) {
		var assert = new AssertionException(message, trace);
		assert.Trace(1);
		
		throw assert;
	}
}

function AssertTrue(condition, message = "", trace = true) {
	if !bool(condition) {
		var assert = new AssertionException(message, trace);
		assert.Trace(1);
		
		throw assert;
	}
}

function AssertFalse(condition, message = "", trace = true) {
	if bool(condition) {
		var assert = new AssertionException(message, trace);
		assert.Trace(1);
		
		throw assert;
	}
}

function AssertEquals(expected, actual, message = "", trace = true) {
	if expected != actual {
		var assert = new AssertionException(message, trace);
		assert.ReasonExpected(expected, actual);
		assert.Trace(1);
		
		throw assert;
	}
}

function AssertArrayEqual(expected, actual, message = "", trace = true) {
	TypeCheck(Type.Array, expected);
	TypeCheck(Type.Array, actual);
	
	if !array_equals(expected, actual) {
		var assert = new AssertionException(message, trace);
		assert.ReasonExpected(expected, actual);
		assert.Trace(1);
		
		throw assert;
	}
}

function AssertSetEqual(expected, actual, msg = "", trace = true) {
	TypeCheck(Type.Array, expected);
	TypeCheck(Type.Array, actual);
	
	if array_length(expected) > 0 {
		expected[0] = expected[0];
		array_sort(expected, false);
	}
	
	if array_length(actual) > 0 {
		actual[0] = actual[0];
		array_sort(actual, false);
	}
	
	try {
		AssertArrayEqual(expected, actual, msg, trace);
	}
	catch(assert) {
		assert.Trace(1);
		throw assert;
	}
}

function AssertVec2Equals(expected, actual, msg = "") {
	TypeCheck(Type.Struct, expected);
	TypeCheck(Type.Struct, actual);
	
	if !(expected.x==actual.x and expected.y==actual.y) {
		var assert = new AssertionException(msg);
		assert.ReasonExpected(expected, actual);
		assert.Trace(1);
		
		throw assert;
	}
}














