# GMLUnit

## Example
```js
//Testcase()를 상속받아 사용
function TcTest() : Testcase() constructor {
    testNothing = function() {
    	//아무것도 리턴하지 않으면 성공으로 처리
    }
    
    testPass = function() {
    	return true;
    }
    
    testFail = function() {
    	return false;
    }
}
```

```js
function TcException() : Testcase() constructor {
    SetKeyword("t_"); //테스트 메서드의 접두어 설정. 기본값은 'test'
   
    t_Assert = function() {
    	AssertEquals(3, 1+2, "sum"); // expected, actual, message
    }
    
    t_Exception = function() {
    	var a = "abc" + 123;
    }
}
```

```js
//Testsuite() 상속받아 사용
function TsTest() : Testsuite() constructor {
    Add( TcTest )
    Add( TcException )
}	
```

```js
var tc = TcTest();
tc.Run();
tc.Show(); //결과 리턴

tc.ShowIfFailed() //테스트 실패시 결과 리턴
tc.ThrowIfFailed() //테스트 실패시 예외 호출

var report = tc.GetReport();
var reportlog = tc.GetReportLog();
```

## Assertion

| Function                                           | Check                        |
|----------------------------------------------------|------------------------------|
| Assert(condition, [msg], [trace])                  | bool(condition) == `true`    |
| AssertTrue(condition, [msg], [trace])              | bool(condition) == `true`    |
| AssertFalse(condition, [msg], [trace])             | bool(condition) == `false`   |
| AssertEquals(expected, actual, [msg], [trace])     | expected == actual           |
| AssertArrayEqual(expected, actual, [msg], [trace]) | 내부 요소가 동일한지 확인      |

**parameter:**

msg<`string`> : 단언 실패시 예외와 함께 호출할 메세지

trace<`bool`> : 단언 실패시 call stack을 함께 출력 (기본값: `true`)

