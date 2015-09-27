//
//  MenuViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 25/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate {
    func resumeButtonPressed(menuViewController:MenuViewController)
}

class MenuViewController: UIViewController {
    
    var delegate:MenuViewControllerDelegate? = nil
    var blurEffectView: UIVisualEffectView = UIVisualEffectView(frame: CGRectZero)
    let resumeButton = Button(title: "RESUME", color: UIColor(red:0, green:0.57, blue:0.99, alpha:1))
    let newGameButton = Button(title: "NEW GAME", color: UIColor(red:0.38, green:0.87, blue:0.1, alpha:1))
    let quitButton = Button(title: "QUIT", color: UIColor(red:0.91, green:0.15, blue:0.33, alpha:1))
    let pauseImageView = UIImageView(frame: CGRectZero)
    let pauseLabelText = UILabel(frame: CGRectZero)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = UIView()
        configureBlurEffectView()
        configureResumeButton()
        configureNewGameButton()
        configureQuitButton()
        configurePauseLabelText()
        configurePauseImageView()
    }
    
    //Subviews
    
    func configureBlurEffectView () {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        setupBlurEffectViewLayout()
    }
    
    func configureResumeButton() {
        resumeButton.buttonActionClosure = { [weak self] in
            self?.didTapResumeButton()
        }
        setupResumeButtonLayout()
    }
    
    func configureNewGameButton() {
        newGameButton.buttonActionClosure = { [weak self] in
            self?.didTapNewGameButton()
        }
        setupNewGameButtonLayout()
    }
    
    func configureQuitButton() {
        quitButton.buttonActionClosure = { [weak self] in
            self?.didTapQuitButton()
        }
        setupQuitButtonLayout()
    }
    
    func configurePauseLabelText() {
        pauseLabelText.text = "PAUSE"
        pauseLabelText.font = UIFont(name: BebasNeueBold, size: 30)
        pauseLabelText.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        setupPauseTextLabelLayout()
    }
    
    func configurePauseImageView () {
        pauseImageView.image = UIImage(named: "pause_icon")
        pauseImageView.contentMode = UIViewContentMode.ScaleAspectFit
        setupPauseImageViewLayout()
    }
    
    //Action methods
    
    func didTapResumeButton() {
        self.dismissViewControllerAnimated(true, completion: {
            delegate?.resumeButtonPressed(self)
        })
    }
    
    func didTapNewGameButton() {
        let gameBoardViewController = GameBoardViewController()
        self.presentViewController(gameBoardViewController, animated: true, completion: nil)
    }
    
    func didTapQuitButton() {
        let startViewController = StartViewController()
        self.presentViewController(startViewController, animated: true, completion: nil)
    }
    
    //Layout
    
    func setupBlurEffectViewLayout() {
        self.view.addSubview(blurEffectView)
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
    }
    
    func setupResumeButtonLayout() {
        self.view.addSubview(resumeButton)
        resumeButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
            make.centerY.equalTo(0)
        }
    }
    
    func setupNewGameButtonLayout() {
        self.view.addSubview(newGameButton)
        newGameButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(resumeButton.snp_bottom).offset(15)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
    }
    
    func setupQuitButtonLayout() {
        self.view.addSubview(quitButton)
        quitButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(newGameButton.snp_bottom).offset(15)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
    }
    
    func setupPauseTextLabelLayout() {
        self.view.addSubview(pauseLabelText)
        pauseLabelText.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.bottom.equalTo(resumeButton.snp_top).offset(-40)
        }
    }
    
    func setupPauseImageViewLayout() {
        self.view.addSubview(pauseImageView)
        pauseImageView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(pauseLabelText.snp_top).offset(-20)
            make.centerX.equalTo(0)
        }
    }
}
