//: [Previous](@previous)

import UIKit

struct Triangle {
    var points = [CGPoint]()
}

class SierpinskiTriangleView: UIView {
    
    func drawTriangle(in triangle: Triangle) {
        let triangles = createTriangles(points: triangle.points)
        for (i, newTriangle) in triangles.enumerated() {
            if i == 0 {
                let path = createTrianglePath(points: newTriangle.points)
                UIColor.white.setFill()
                path.fill()
            } else {
                drawTriangle(in: newTriangle)
            }
        }
        
        
    }
    
    func createTriangles(points: [CGPoint]) -> [Triangle] {
        var triangles = [Triangle]()
        
    
        let newPoint0 = CGPoint(x: (points[0].x + points[1].x) / 2, y: (points[0].y + points[1].y) / 2)
        let newPoint1 = CGPoint(x: (points[0].x + points[2].x) / 2, y: (points[0].y + points[2].y) / 2)
        let newPoint2 = CGPoint(x: (points[1].x + points[2].x) / 2, y: (points[1].y + points[2].y) / 2)
        triangles.append(Triangle(points: [newPoint0, newPoint1, newPoint2]))
        triangles.append(Triangle(points: [points[0], newPoint0, newPoint1]))
        triangles.append(Triangle(points: [points[1], newPoint0, newPoint2]))
        triangles.append(Triangle(points: [points[2], newPoint1, newPoint2]))
        return triangles
    }
    
    
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
        
        drawTriangle(in: triangle)
        
    }
}

let sierpinskiTriangleView = SierpinskiTriangleView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
sierpinskiTriangleView.backgroundColor = UIColor.black


//: [Next](@next)
