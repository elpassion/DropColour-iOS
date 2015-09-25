//
//  MenuViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 25/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var blurEffectView: UIVisualEffectView = UIVisualEffectView(frame: CGRectZero)
    let resumeButton = UIButton(frame: CGRectZero)
    let newGameButton = UIButton(frame: CGRectZero)
    let quitButton = UIButton(frame: CGRectZero)
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
        self.view.backgroundColor = UIColor.clearColor()
        
        configureBlurEffectView()
        configureResumeButton()
        configureNewGameButton()
        configureQuitButton()
        configurePauseLabelText()
        configurePauseImageView()
    }
    
    func configureBlurEffectView () {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.contentView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(blurEffectView)
        
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
    }
    
    func configureResumeButton() {
        resumeButton.setTitle("RESUME", forState: UIControlState.Normal)
        resumeButton.titleLabel?.font = UIFont(name: BebasNeueBold, size: 22)
        resumeButton.addTarget(self, action: Selector("didTapOnResumeButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(resumeButton)
        resumeButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
            make.centerY.equalTo(0)
        }
        resumeButton.setTitleColor(UIColor(hue:0.66, saturation:0.81, brightness:0.33, alpha:1), forState: UIControlState.Normal)
        resumeButton.layer.cornerRadius = 27.5
        resumeButton.backgroundColor = UIColor(red:0, green:0.57, blue:0.99, alpha:1)
    }
    
    func didTapOnResumeButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func configureNewGameButton() {
        newGameButton.setTitle("NEW GAME", forState: UIControlState.Normal)
        newGameButton.titleLabel?.font = UIFont(name: BebasNeueBold, size: 22)
        newGameButton.addTarget(self, action: Selector("didTapOnNewGameButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(newGameButton)
        newGameButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(resumeButton.snp_bottom).offset(15)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
        newGameButton.setTitleColor(UIColor(hue:0.66, saturation:0.81, brightness:0.33, alpha:1), forState: UIControlState.Normal)
        newGameButton.layer.cornerRadius = 27.5
        newGameButton.backgroundColor = UIColor(red:0.38, green:0.87, blue:0.1, alpha:1)
    }
    
    func didTapOnNewGameButton() {
        let boardViewController = BoardViewController()
        presentViewController(boardViewController, animated: true, completion: nil)
    }
    
    func configureQuitButton() {
        quitButton.setTitle("QUIT", forState: UIControlState.Normal)
        quitButton.titleLabel?.font = UIFont(name: BebasNeueBold, size: 22)
        quitButton.addTarget(self, action: Selector("didTapOnQuitButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(quitButton)
        quitButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(newGameButton.snp_bottom).offset(15)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
        quitButton.setTitleColor(UIColor(hue:0.66, saturation:0.81, brightness:0.33, alpha:1), forState: UIControlState.Normal)
        quitButton.layer.cornerRadius = 27.5
        quitButton.backgroundColor = UIColor(red:0.91, green:0.15, blue:0.33, alpha:1)
    }
    
    func didTapOnQuitButton() {
        let startViewController = StartViewController()
        presentViewController(startViewController, animated: true, completion: nil)
    }
    
    func configurePauseLabelText() {
        pauseLabelText.text = "PAUSE"
        pauseLabelText.font = UIFont(name: BebasNeueBold, size: 30)
        pauseLabelText.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        self.view.addSubview(pauseLabelText)
        pauseLabelText.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.bottom.equalTo(resumeButton.snp_top).offset(-40)
        }
    }
    
    func configurePauseImageView () {
        pauseImageView.image = UIImage(named: "pause_icon")
        pauseImageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.view.addSubview(pauseImageView)
        pauseImageView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(pauseLabelText.snp_top).offset(-20)
            make.centerX.equalTo(0)
        }
    }
}
