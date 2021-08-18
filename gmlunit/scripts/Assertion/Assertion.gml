function assertTrue(condition, message = "") {
	if not condition
		throw new AssertionException(message)
}

function assertFalse(condition, message = "") {
	if condition
		throw new AssertionException(message);
}

function assertEquals(expected, actual, message = "") {
	if expected != actual
		throw new AssertionException(message);
}