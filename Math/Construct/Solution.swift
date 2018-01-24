func constructRectangle(_ area: Int) -> [Int] {
    var s = Int(sqrt(Double(area)))
    while area % s > 0 {
        s -= 1
    }
    return [area / s, s];
}
