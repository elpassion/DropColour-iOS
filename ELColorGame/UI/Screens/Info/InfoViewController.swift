//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, InfoViewDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() {
        self.view = InfoView(delegate: self)
    }
    
    // MARK: InfoViewDelegate

    func infoViewDidTapQuit(infoView: InfoView) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func infoViewDidTapAuthor(author: Author) {
        print("Author: \(author)")
    }

}
