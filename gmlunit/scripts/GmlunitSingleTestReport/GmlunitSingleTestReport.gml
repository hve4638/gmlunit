function GmlunitSingleTestReport(tcresult/*:GmlunitTcResult*/) constructor {
    name = "Anonymous";
    state = TcResultType.Unknown;
    pass = false;
    fail = false;
    unknown = false;
    time = "0s"
    summary = ""
    detail = ""
    
    parse = function(tcresult/*:GmlunitTcResult*/) {
    	name = tcresult.name;
        state = tcresult.state;
        time = string_format(tcresult.time, 0, 6) + "s";
        pass = isPassed(tcresult.state);
        fail = isFailed(tcresult.state);
        unknown = (!pass && !fail);
        
        summary = makeSummary();
        detail = makeDetail(summary, tcresult);
    }
    
    static isPassed = function(result_type) {
		switch(result_type) {
			case TcResultType.Pass:
				return true;
			
			default:
				return false;
		}
	}
	
	static isFailed = function(result_type) {
		switch(result_type) {
			case TcResultType.Fail:
			case TcResultType.FailByYYGMLException:
			case TcResultType.FailByException:
			case TcResultType.FailByAssertion:
			case TcResultType.Timeout:
				return true;
				break;
			
			default:
				return false;
				break;
		}
	}
    
	makeSummary = function() {
        var stat;
        if pass
            stat = "ok"
        else if fail
            stat = "fail"
        else
            stat = "unknown"
            
        return name + "() ... " + stat + " (" + time + ")";
	}
	
	makeDetail = function(summary, tcresult/*:GmlunitTcResult*/) {
		var out = summary + "\n";
        if tcresult.state == TcResultType.Timeout {
        	out += "  reason - Timeout\n";
    	}
    	else if tcresult.reason != undefined {
    		out += "  reason - " + string(tcresult.reason) + "\n";
    	}
    	
    	var ex/*:Exception|YYGMLExceptionWrapper|AssertionException*/ = tcresult.exception;
    	if ex != undefined {
    		out += "  exception - " + string(ex) + "\n";
    		out += "  stack" + string(ex);
    	}
    	
    	return out;
	}
	
	static toString = function() {
	    return summary;
	}
	
	parse(tcresult);
}








