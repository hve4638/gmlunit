function GmlunitTcReport() constructor {
	name = ""
	total = 0;
	pass = 0;
	fail = 0;
	detail = [];//GmlunitSingleTestReport
	
	Summary = function() {
		var outputappend = function(output, appended) {
            if appended == ""
                return output;
            else
                return (output == "") ? appended : (output+", "+appended)
		}
		
		var stat;
		var totalstr, passstr, failstr;
		stat = (fail == 0) ? "ok" : "FAILED";
		passstr = (pass > 0) ? (string(pass) + " passed") : "";
		failstr = (fail > 0) ? (string(fail) + " failed") : "";
		totalstr = string(total) + " total";
		
		var output = "test result: " + stat;
		output = outputappend(output, passstr);
		output = outputappend(output, failstr);
		output = outputappend(output, totalstr);
		
		return output;
	}
	
	Detail = function() {
		var out = name + "\n";
		
		var len = array_length(detail);
		for(var i = 0; i < len; i++) {
			var treport = detail[i];
			out += string(treport.detail);
		}
		
		out += Summary();
		return out;
	}
	
	Copy = function() {
	    var cp = new GmlunitTcReport();
	    cp.total = total;
	    cp.pass = pass;
	    cp.fail = fail;
	    cp.detail = [];
	    
	    array_copy(cp.detail, 0, detail, 0, array_length(detail));
	    return cp;
	}
	
	toString = function() {
		return Summary();
    }
}