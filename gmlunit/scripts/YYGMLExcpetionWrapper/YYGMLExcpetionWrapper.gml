/*
yygmlexception = {
    message : "",               // a string that is a short message for this exception
    longMessage : "",           // a string that is a longer message for this exception
    script : "",                // a string that describes where the exception came from
    line: 0,                    // a real that is the line number where the exception came from
    stacktrace : [ "", "" ],    // an array of strings that is the stack frame the exception was generated
}
*/

function YYGMLExceptionWrapper(exception) : Exception("YYGMLException") constructor {
	raw = {
		message : exception.message,
		longMessage : exception.longMessage,
		stackMessage : exception.script,
		stack : exception.stacktrace,
	}
	name = raw.message;
	//reason = raw.stackMessage;
	stack = raw.stack;
}