enum TcResultType {
	Unknown,
	Pass,
	Fail,
	FailByException,
	FailByYYGMLException,
	FailByAssertion,
	Timeout,
	WIP,
	Waiting
}

function GmlunitTcResult(testname = undefined) constructor {
	name = testname ?? "anonymous";
	state = TcResultType.Unknown;
	reason = undefined;
	exception = undefined;
	time = undefined;
}

