/*
 Pairwise Swap
 Write a program to swap odd and even bits in an integer with as few instructions as possible (e.g. bit 0 and bit 1 are swapped, bit 2 and bit 3 are swapped, and so on).
 */

func swapBits(_ value: Int) -> Int {
    return ((value & 0xAAAAAAAA) >> 1) | ((value & 0x55555555) << 1)
}

let val = 4

print(String.init(val, radix: 2, uppercase: false))

let result = swapBits(val)

print("Result: \n\(String.init(result, radix: 2, uppercase: false))")
