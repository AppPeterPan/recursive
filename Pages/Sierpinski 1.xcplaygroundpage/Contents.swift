//: [Previous](@previous)

import UIKit

struct Triangle {
    var points = [CGPoint]()
}

class SierpinskiTriangleView: UIView {
    
    func createTrianglePath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addLine(to: points[2])
        path.close()
        return path
    }
    
    override func draw(_ rect: CGRect) {
        
        let width = rect.width
        var point = CGPoint(x: 0, y: width)
        var triangle = Triangle()
        triangle.points.append(point)
        let halfWidth = width / 2
        point = CGPoint(x: halfWidth, y: width - sqrt(width * width - halfWidth * halfWidth))
        triangle.points.append(point)
        point = CGPoint(x: width, y: width)
        triangle.points.append(point)
        let path = createTrianglePath(points: triangle.points)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
        
        
    }
}

let sierpinskiTriangleView = SierpinskiTriangleView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
sierpinskiTriangleView.backgroundColor = UIColor.black

//: [Next](@next)
