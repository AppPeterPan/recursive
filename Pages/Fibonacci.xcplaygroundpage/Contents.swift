
var fiboDic = [0: 0, 1: 1]
func fibonacciSequence(index: Int) -> Int {
    if let number = fiboDic[index] {
        return number
    } else {
        fiboDic[index] = fibonacciSequence(index: index - 1) + fibonacciSequence(index: index - 2)
        return fiboDic[index]!
        
    }
}

fibonacciSequence(index: 10)


//: [Next](@next)
