//
//  Button.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 26/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    var buttonActionClosure: (() -> ())?
    
    init(title: String, color: UIColor) {
        super.init(frame: CGRectZero)
        
        self.setTitle(title, forState: UIControlState.Normal)
        self.titleLabel!.font = UIFont(name: BebasNeueBold, size: 22)
        self.contentEdgeInsets = UIEdgeInsetsMake(4.5, 0, 0, 0)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.layer.cornerRadius = 27.5
        self.backgroundColor = color
        self.addTarget(self, action: Selector("didTapOnButton:"), forControlEvents: UIControlEvents.TouchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapOnButton(button: UIButton) {
        if let buttonActionClosure = buttonActionClosure {
            buttonActionClosure()
        }
    }
}
