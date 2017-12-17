/*
  Number Swapper
    Write a function to swap a number in place (that is, without temporary variables).
*/

func mySwap(_ a: inout Int, _ b: inout Int) {
    a = a ^ b
    b = a ^ b
    a = a ^ b
}

var i = 1
var j = 100
mySwap(&i, &j)
print(i, j)
