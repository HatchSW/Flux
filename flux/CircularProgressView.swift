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
    
    var ringLayer: CAShapeLayer!
    var backgroundRingLayer: CAShapeLayer!
    
    @IBInspectable var progress: Double = 0.6{
        didSet {updateLayerProperties() }
    }
    
    var lineWidth: CGFloat = 10.0 {
        didSet {updateLayerProperties() }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        if !(backgroundRingLayer != nil){
            backgroundRingLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer)
        
            let rect = CGRectInset(bounds, lineWidth/2.0, lineWidth/2.0)
            let path = UIBezierPath(ovalInRect: rect)
            
            backgroundRingLayer.path = path.CGPath
            backgroundRingLayer.fillColor = nil
            backgroundRingLayer.lineWidth = 10.0
            backgroundRingLayer.strokeColor = UIColor(white:0.5, alpha:0.3).CGColor
        
        }
        //outside temp if
            backgroundRingLayer.frame = layer.bounds
        
        if !(ringLayer != nil){
            ringLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer)
            
            let rect = CGRectInset(bounds, lineWidth/2.0, lineWidth/2.0)
            let path = UIBezierPath(ovalInRect: rect)
            
            ringLayer.path = path.CGPath
            ringLayer.fillColor = nil
            ringLayer.lineWidth = 10.0
            ringLayer.strokeColor = UIColor.orangeColor().CGColor
            ringLayer.anchorPoint = CGPointMake(0.5, 0.5)
            ringLayer.transform = CATransform3DRotate(ringLayer.transform, CGFloat(-M_PI/2), 0, 0, 1)
            
            layer.addSublayer(ringLayer)
            
        }
        
        ringLayer.frame = layer.bounds
        updateLayerProperties()

    }
    
    func updateLayerProperties() {
        if (ringLayer != nil) {
            ringLayer.strokeEnd = CGFloat(progress)
            
            let strokeColor = UIColor.orangeColor()
        
            ringLayer.strokeColor = strokeColor.CGColor
        }
    }
    
    func determineTimeTillSas() {
        //SAS starts 9:40 am
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Hour, .Minute, .Second], fromDate: date)
        let hour = components.hour;
        let minute = components.minute;
        //        let second = components.second;
        
        //change text color depending on how long you have until SAS starts
        if minute <= 40 && hour == 9{
            let untilMinute = 40 - minute
            
            if untilMinute <= 5 {
                stro = UIColor.redColor()
            }else{
                timeUntilLabel.textColor = UIColor.greenColor()
            }
            
            timeUntilLabel.text = String(untilMinute) + " minutes until start"
            
        }else{
            timeUntilLabel.textColor = UIColor.redColor()
            //If SAS has already started
            timeUntilLabel.text = "In Progress"
        }
        
    }
    
}
