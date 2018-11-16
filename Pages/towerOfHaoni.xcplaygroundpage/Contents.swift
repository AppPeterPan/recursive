import UIKit

func showTower(_ tower: [Int], name: String) {
    print(name)
    if let maxNumber = tower.max() {
        for number in tower.reversed() {
            print("\(String(repeating: " ", count: (maxNumber - number) / 2 ))\(String(repeating: "*", count: number))")
        }
    } else {
        print("empty")
    }
    
}

func move(count: Int, from startTower: inout [Int], to endTower: inout [Int],  using helpTower: inout [Int]) {
    
    if count == 1 {
        let number = startTower.removeLast()
        endTower.append(number)
    } else {
        move(count: count - 1, from: &startTower, to: &helpTower, using: &endTower)
        move(count: 1, from: &startTower, to: &endTower, using: &helpTower)
        move(count: count - 1, from: &helpTower, to: &endTower, using: &startTower)
    }
}



func haoni(number: Int) {
    
    var tower1 = [Int]()
    var tower2 = [Int]()
    var tower3 = [Int]()
    for i in 1...number {
        tower1.insert(i * 2, at: 0)
    }
    
    move(count: tower1.count, from: &tower1, to: &tower3, using: &tower2)
    showTower(tower1, name: "tower1")
    showTower(tower2, name: "tower2")
    showTower(tower3, name: "tower3")
}
haoni(number: 4)

//: [Next](@next)
