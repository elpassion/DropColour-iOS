//
//  CircleView.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

protocol CircleViewPointChangeDelegate {
    func pointDidChanged(point:CGPoint)
}

class CircleView: UIView {
    
    var delegate:CircleViewPointChangeDelegate? = nil
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var colors:[UIColor] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let touchRecognizer = UIPanGestureRecognizer(target: self, action: "detectTouch:")
        self.gestureRecognizers = [touchRecognizer]
        colors = [
            UIColor(red:0.31, green:0.84, blue:0.84, alpha:1),
            UIColor(red:0.34, green:0.85, blue:0.09, alpha:1),
            UIColor(red:0.69, green:0.43, blue:0.84, alpha:1),
            UIColor(red:0.91, green:0.14, blue:0.37, alpha:1),
            UIColor(red:0.29, green:0.56, blue:0.89, alpha:1),
        ]
        self.backgroundColor = colors[Int(arc4random() % 4)]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectTouch(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.superview)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        
        print("center\(self.center)")
        if (delegate != nil) {
            let point:CGPoint = self.center
            delegate?.pointDidChanged(point)
        }
        
        if recognizer.state == .Began {
            print("began")
        } else if recognizer.state == .Changed {
            print("changed")
        } else if recognizer.state == .Ended {
            print("ended")
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
}
