//
//  CircularProgressView.swift
//  flux
//
//  Created by Quach, Scott on 10/21/15.
//  Copyright © 2015 Hatch. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable

class CircularProgressView: UIView {
    
    var backgroundRingLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let lineWidth: CGFloat = 10.0
                
            backgroundRingLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer)
        
            let rect = CGRectInset(bounds, lineWidth/2.0, lineWidth/2.0)
            let path = UIBezierPath(ovalInRect: rect)
            
            backgroundRingLayer.path = path.CGPath
            backgroundRingLayer.fillColor = nil
            backgroundRingLayer.lineWidth = 10.0
            backgroundRingLayer.strokeColor = UIColor.orangeColor().CGColor
        
        
        //outside temp if
            backgroundRingLayer.frame = layer.bounds
    }
    
}
