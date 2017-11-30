/*
    Flood Fill
     An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
     Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
     To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.
     At the end, return the modified image.
*/

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    var result = image
    let oldColor = result[sr][sc]
    helperFill(&result, sc, sr, oldColor, newColor)
    return result
}

func helperFill(_ image: inout [[Int]], _ x: Int, _ y: Int, _ oldColor: Int, _ newColor: Int) {
    if x > image[0].count - 1 || x < 0 ||
        y > image.count - 1 || y < 0 ||
        image[y][x] != oldColor ||
        oldColor == newColor {
        return
    }
    
    image[y][x] = newColor
    helperFill(&image, x + 1, y, oldColor, newColor)
    helperFill(&image, x - 1, y, oldColor, newColor)
    helperFill(&image, x, y + 1, oldColor, newColor)
    helperFill(&image, x, y - 1, oldColor, newColor)
}

