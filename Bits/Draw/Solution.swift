/*
 Draw Line
    A monochrome screen is stored as a single array of bytes, allowing eight consecutive pixels to be stored in one byte. The creen has width w, where w is divisible by 8 (that is, no byte will be split across rows). The height of the screen, of course, can be derived from the lenfth of the array and the width. Implement a function that draws a horizontal line from (x1, y) to (x2, y).
 */

func drawLine(_ array: Array<UInt8>, _ width: Int, _ x1: Int, _ x2: Int, _ y: Int) -> Array<UInt8> {
    
    var result = array
    
    let height = (64 * array.count) / width
    var sbi = (x1 + (y * height)) / 8 // starting byte index
    var sbo = x1 % 8 // starting byte offset
    var ebi = (x2 + (y * height)) / 8 // ending byte index
    var ebo = x2 % 8 // ending byte offset
    
    if sbi > ebi {
        var temp = sbi
        sbi = ebi
        ebi = temp
        temp = sbo
        sbo = ebo
        ebo = temp
    }
    
    if sbi != ebi {
        let value: UInt8 = 0xFF >> UInt8(sbo)
        result[sbi] = value
        let value2: UInt8 = ~(0xFF << (UInt8(ebo) + 1))
        result[ebi] = value2
    } else {
        let startMask: UInt8 = 0xFF >> UInt8(sbo)
        let endMask: UInt8 = ~(0xFF << (UInt8(ebo) + 1))
        result[sbi] = startMask & endMask
    }
    
    for i in stride(from: sbi + 1, to: ebi, by: 1) {
        result[i] = 0xFF
    }
    return result
}


var arr = Array<UInt8>()
arr.append(0)
arr.append(0)
arr.append(0)
arr.append(0)
arr.append(0)
arr.append(0)
arr.append(0)
arr.append(0)
arr.append(0)

let res = drawLine(arr, 24, 2, 10, 0)

let str1 = String.init(res[0], radix: 2, uppercase: false)
let str2 = String.init(res[1], radix: 2, uppercase: false)
let str3 = String.init(res[2], radix: 2, uppercase: false)

print(str1, str2, str3)
