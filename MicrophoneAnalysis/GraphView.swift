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

    override func draw(_ rect: CGRect) {
        
        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        
        
        let dropPath = UIBezierPath()
        dropPath.move(to: center)
        dropPath.addCurve(to: center,
                          controlPoint1: CGPoint(x: center.x + 100,  y: center.y + 50),
                          controlPoint2: CGPoint(x: center.x + -100, y: center.y + 50) )
        
        let blueColor = UIColor.blue
        blueColor.setStroke()
        
        dropPath.lineWidth = 4.0
        dropPath.stroke()
        
        
        let polygonPath = UIBezierPath()
        polygonPath.move(to: center)
        polygonPath.addLine(to: CGPoint(x: center.x + 43.3, y: center.y - 25) )
        polygonPath.addLine(to: CGPoint(x: center.x + 43.3, y: center.y - 75) )
        polygonPath.addLine(to: CGPoint(x: center.x, y: center.y - 100) )
        polygonPath.addLine(to: CGPoint(x: center.x - 43.3, y: center.y - 75) )
        polygonPath.addLine(to: CGPoint(x: center.x - 43.3, y: center.y - 25) )
        polygonPath.close()
        
        let greenColor = UIColor.green
        greenColor.setFill()
        let orangeColor = UIColor.orange
        orangeColor.setStroke()
        polygonPath.fill()
        polygonPath.lineWidth = 5.0
        
        polygonPath.stroke()
        
        
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 10, height: 10), cornerRadius: 10)
        
        let redColor = UIColor.red
        redColor.setStroke()
        rectanglePath.stroke()
        
    }

}
