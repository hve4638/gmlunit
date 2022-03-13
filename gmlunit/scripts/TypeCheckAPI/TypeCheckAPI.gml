enum Type {
	Num = -10001,
	String = -10002,
	PTR = -10003,
	Struct = -10004,
	Method = -10005,
	Array = -10006,
	Undefined = -10007,
	Inf = -20001,
	Nan = -20002,
}

function TypeCheck(type, condition, message = "") {
	static IsVaild = function(type, condition) {
		switch(type) {
			case Type.Num:
				return is_numeric(condition);
			case Type.String:
				return is_string(condition);
			case Type.PTR:
				return is_ptr(condition);
			case Type.Struct:
				return is_struct(condition);
			case Type.Method:
				return is_method(condition);
			case Type.Array:
				return is_array(condition);
			case Type.Undefined:
				return is_undefined(condition);
			case Type.Inf:
				return is_infinity(condition);
			case Type.Nan:
				return is_nan(condition);
			default:
				return -1;
		}
	}
	
	var result = IsVaild(type, condition);
	
	if result == -1 {
		var assert = new AssertionException();
		assert.Reason("TypeCheck() : Invaild type::" + string(type));

		throw assert;
	}
	else if result == false {
		var assert = new AssertionException(message, true);
		assert.Reason("Invailed type::" + typeof(condition));

		throw assert;
	}
}

