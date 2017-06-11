//
//  GraphView.swift
//  MicrophoneAnalysis
//
//  Created by Admin on 11.06.17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {

    
    fileprivate var pointsArray = [CGPoint]()
    var centerOfView = CGPoint()

    func add(frequency: Double) {
        
        print(frequency)
        
        for i in 0..<pointsArray.count {
            pointsArray[i].x -= self.bounds.width / 100.0
        }
        
        let xPosition = centerOfView.x
        let yPosition = self.bounds.height - ( self.bounds.height * CGFloat( frequency / (maxHZ - minHZ) ) )
        pointsArray.append( CGPoint(x: xPosition, y: yPosition) )

        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        centerOfView = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        
        let polygonPath = UIBezierPath()
        if pointsArray.count > 0 {
            polygonPath.move(to: pointsArray.first!)
            
            for point in pointsArray {
                polygonPath.addLine(to: point)
            }
        }
        
        let orangeColor = UIColor.orange
        orangeColor.setStroke()
        polygonPath.lineWidth = 3.0
        polygonPath.stroke()
    }

}
