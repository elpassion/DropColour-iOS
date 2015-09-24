//
//  StartViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    let backgroundImage:UIImageView = UIImageView()
    
    override func loadView() {
        self.view = UIView()
        configureBackgroundImageView()
    }
    
    func configureBackgroundImageView() {
        backgroundImage.image = UIImage(named: "background")
        self.view.addSubview(backgroundImage)
        backgroundImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    }
}
