function GmlunitTcResultSetter(tcresult/*:GmlunitTcResult*/) constructor {
    resultRef = weak_ref_create(tcresult);
    
	Pass = function() {
	    var ref = getRef();
		ref.state = TcResultType.Pass;
	}
	
	Fail = function() {
	    var ref = getRef();
		ref.state = TcResultType.Fail;
	}
	
	FailByException = function(exception) {
	    var ref = getRef();
	    
		switch(instanceof(exception)) {
			case "YYGMLException":
				var wrapper = new YYGMLExceptionWrapper(exception);
				
		        ref.state = TcResultType.FailByYYGMLException;
		        ref.reason = wrapper;
				break
			
			case "AssertionException":
        		ref.state = TcResultType.FailByAssertion;
				ref.reason = exception;
				break
			
			default:
        		ref.state = TcResultType.FailByException;
				ref.reason = exception;
				break
		}
	}
	
	getRef = function() {
	    if weak_ref_alive(resultRef)
	        return resultRef.ref;
	    else
	        throw "Ref is dead."
	}
}