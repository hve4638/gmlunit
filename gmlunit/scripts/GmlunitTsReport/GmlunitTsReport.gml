function GmlunitTsReport() constructor {
	name = "";
	total = 0;
	pass = 0;
	fail = 0;
	faildetail = [] //<GmlunitTcReport>
	
	static Summary = function() {
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
		
		var output = "testsuits result: " + stat;
		output = outputappend(output, passstr);
		output = outputappend(output, failstr);
		output = outputappend(output, totalstr);
		
		return output;
	}
	
	static Detail = function() {
		var out = string(self);
		var len = array_length(faildetail);
		if len > 0 {
			out += "\n";
			for(var i = 0; i < len; i++) {
				var format = faildetail[i]
				out += format.detail;
			}
		}
		
		return out;
	}
	
	static Copy = function() {
	    var cp = new GmlunitTsReport();
	    cp.total = total;
	    cp.pass = pass;
	    cp.fail = fail;
	    cp.faildetail = [];
	    array_copy(cp.faildetail, 0, faildetail, 0, array_length(faildetail));
	    
	    return cp;
	}
	
	static toString = function() {
		return self.Summary();
    }
}