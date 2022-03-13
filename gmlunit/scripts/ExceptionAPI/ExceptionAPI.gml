function TraceStack(ignore_depth = 0) {
    if ignore_depth < 0 {
        throw "TraceStack()::Invalid Args. must zero or positive."
    }
    
    try {
        show_error("exception", false);
    }
    catch(exception) {
        var len = array_length(exception.stacktrace);
        
        var st, ed;
        st = ignore_depth;
        ed = len;
        
        if st < ed {
			var stack = [];
			array_copy(stack, 0, exception.stacktrace, 1+ignore_depth, len-1-ignore_depth);
			
			var len = array_length(stack);
			for(var i = 0; i < len; i++)
			    stack[i] = ___stringtrim(stack[i]);
			
			return stack;
        }
        else {
            return [ "no trace" ]
        }
    }
    
    return [ "something wrong" ]
}

function ___stringtrim(str) {
	static isremoved = function(char) {
		static removechar = [ " ", "\n", "\t", "\r" ]
		var len = array_length(removechar);
		
		for(var i=0; i<len; i++) {
			if char==removechar[i]
				return true;
		}
		
		return false;
	}
	var len = string_length(str)
	
	var char;
	var i, j;
	for(i = 1; i <= len; i++) {
		char = string_char_at(str, i);
		if !isremoved(char)
			break
	}
	
	for(j = len; j > i; j--) {
		char = string_char_at(str, j);
		if !isremoved(char)
			break
	}
	
	return string_copy(str, i, j);
}