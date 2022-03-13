function TcTest() : Testcase() constructor {
	function testPass() {
		return true;
	}
	
	function testFail() {
		return false;
	}
	
	function testAssert() {
		assertTrue(false);
	}
	
	function testException() {
		var a = "hello" + 3;
	}
	
	function testLongTime() {
		var time = current_time;
		while(current_time < 1000) {
			
		}
		return true;
	}
}