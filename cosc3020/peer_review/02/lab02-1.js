// Fred Wittman
// Dr. Kotthoff
// COSC 3020-01
// 09/20/19

function fibonacci(seriesLength) {

/* Invariant: The first seriesLength - 1 elements of the Fibonacci series are stored sequentially in the array fibonacci(seriesLength - 1).

This is not true for the special case where the original argument is seriesLength == 2.  For each value of seriesLength for which there
is a recursive function call and for seriesLength == 1, however, the invariant holds.  Note also that the invariant describes the state
of affairs as the array is actually being filled out.  The details of what is happening as the function argument approaches 2, i.e. the
technical details of how the compiler implements recursion, is  probably compiler/language dependent. */

if (seriesLength >= 1) {
array = [];

if (seriesLength == 1) {
  array = [1];
  return array;
}

else if (seriesLength == 2) {
  array = [1,1];
  return array;
}

else {
  array = fibonacci(seriesLength - 1);
  a = array[seriesLength - 2]; // f(i - 1)
  b = array[seriesLength - 3]; // f(i - 2)
  c = a + b;               // f(i) = f(i - 1) + f(i - 2)
  array.push(c);
  return array;
}
}

else {
  return "Function argument must be a natural number.";
}
}

// Tests
console.log(fibonacci(-1));
console.log(fibonacci(1));
console.log(fibonacci(2));
console.log(fibonacci(7));
console.log(fibonacci(10));
