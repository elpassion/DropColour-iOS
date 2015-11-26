//
//  MenuViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 25/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {
    
    private weak var delegate: MenuViewControllerDelegate?
    
    init(delegate: MenuViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = MenuView(delegate: self)
    }
    
    // MARK: MenuViewDelegate
    
    func menuViewDidTapResume(menuView: MenuView) {
        self.dismissViewControllerAnimated(true, completion: { [unowned self] in
            self.delegate?.menuViewControllerDidResumeGame(self)
        })
    }
    
    func menuViewDidTapNewGame(menuView: MenuView) {
        self.presentViewController(GameViewController(), animated: true, completion: nil)
    }
    
    func menuViewDidTapQuit(menuView: MenuView) {
        self.presentViewController(StartViewController(), animated: true, completion: nil)
    }
    
}

// MARK: - Delegate

protocol MenuViewControllerDelegate: class {
    
    func menuViewControllerDidResumeGame(menuViewController: MenuViewController)
    
}
