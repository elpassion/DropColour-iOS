//
//  MenuViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 25/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func loadView() {
        self.view = UIView()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.view.backgroundColor = UIColor.greenColor()
    }
}
