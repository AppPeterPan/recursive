//: [Previous](@previous)


import UIKit

class ConcentricCirclesView: UIView {
    
    func drawCircle(in rect: CGRect) {
        if rect.width > 20 {
            let path = UIBezierPath(roundedRect: rect, cornerRadius: rect.width / 2)
            UIColor.orange.setStroke()
            path.stroke()
            let width = rect.width / 2
            let x = self.bounds.midX - width / 2
            drawCircle(in: CGRect(x: x, y: x, width: width, height: width))
        }
        
    }
    override func draw(_ rect: CGRect) {
        drawCircle(in: rect)
    }
}

let concentricCirclesView = ConcentricCirclesView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))


//: [Next](@next)
