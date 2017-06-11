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
                          controlPoint1: CGPoint(x: center.x + 100,  y: center.y + 150),
                          controlPoint2: CGPoint(x: center.x + -100, y: center.y + 150) )
        
        let blueColor = UIColor.blue
        blueColor.setStroke()
        
        dropPath.lineWidth = 4.0
        dropPath.stroke()
        
    }

}
