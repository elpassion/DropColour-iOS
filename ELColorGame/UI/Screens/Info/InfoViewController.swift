//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))

    override func viewDidLoad() {
        view.addSubview(blurEffectView)
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
    }

}
