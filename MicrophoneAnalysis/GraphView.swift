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

    
    let polygonPath = UIBezierPath()
    
    func add(frequency: Double) {
        
        let xPosition = centerOfView.x - CGFloat(pointsArray.count)
        let yPosition = self.bounds.height * CGFloat( frequency / (maxHZ - minHZ) )
        pointsArray.append( CGPoint(x: xPosition, y: yPosition) )
        
        setPolygonPath()
    }
    
    func setPolygonPath() {
        
        polygonPath.move(to: centerOfView)
        
        for point in pointsArray {
            polygonPath.addLine(to: point)
        }
        
        polygonPath.close()
        
        let greenColor = UIColor.green
        greenColor.setFill()
        let orangeColor = UIColor.orange
        orangeColor.setStroke()
        polygonPath.fill()
        polygonPath.lineWidth = 3.0
        
        polygonPath.stroke()
    }

    override func draw(_ rect: CGRect) {
        centerOfView = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
       
        setPolygonPath()
    }

}
