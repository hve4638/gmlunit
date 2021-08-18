/*
 * test 접미어가 붙는 메소드를 테스트한다
 * return 값이 false거나 예외 발생시 테스트는 실패한다.
 * return 값이 true거나 undefind(no return)라면 성공한다.
 *
 * run() 로 테스트 수행
 * show() 로 테스트 결과
 * showIfFailed()
 * throwIfFailed()
*/
function TesterTest() : Tester() constructor {
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