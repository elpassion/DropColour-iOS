//
//  GameOverViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 26/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    var blurEffectView: UIVisualEffectView = UIVisualEffectView(frame: CGRectZero)
    let yourScoreTextLabel = UILabel(frame: CGRectZero)
    var scoreNumber: Int = Int()
    let cancelButton = UIButton(frame: CGRectZero)
    let tryAgainButton = UIButton(frame: CGRectZero)
    
    init(score: Int) {
        super.init(nibName: nil, bundle: nil)
        self.scoreNumber = score
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
        configureYourScoreTextLabel()
        configureCancelButton()
        configureTryAgainButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        configureGestureRecognizer(self.view)
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
    
    func configureYourScoreTextLabel() {
        yourScoreTextLabel.lineBreakMode = NSLineBreakMode.ByCharWrapping
        yourScoreTextLabel.numberOfLines = 2
        yourScoreTextLabel.textAlignment = NSTextAlignment.Center
        yourScoreTextLabel.text = "YOUR SCORE\n\(scoreNumber)"
        yourScoreTextLabel.font = UIFont(name: BebasNeueBold, size: 30)
        yourScoreTextLabel.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        self.view.addSubview(yourScoreTextLabel)
        yourScoreTextLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.centerY.equalTo(0)
        }
    }
    
    func configureCancelButton() {
        cancelButton.setTitle("CANCEL", forState: UIControlState.Normal)
        cancelButton.titleLabel?.font = UIFont(name: BebasNeueBold, size: 22)
        cancelButton.contentEdgeInsets = UIEdgeInsetsMake(4.5, 0, 0, 0)
        cancelButton.addTarget(self, action: Selector("didTapOnCancelButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cancelButton)
        cancelButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(yourScoreTextLabel.snp_bottom).offset(30)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
        cancelButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        cancelButton.layer.cornerRadius = 27.5
        cancelButton.backgroundColor = UIColor(red:0.91, green:0.15, blue:0.33, alpha:1)
    }
    
    func configureTryAgainButton() {
        tryAgainButton.setTitle("TRY AGAIN", forState: UIControlState.Normal)
        tryAgainButton.titleLabel?.font = UIFont(name: BebasNeueBold, size: 22)
        tryAgainButton.contentEdgeInsets = UIEdgeInsetsMake(4.5, 0, 0, 0)
        tryAgainButton.addTarget(self, action: Selector("didTapOnTryAgainButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(tryAgainButton)
        tryAgainButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(cancelButton.snp_bottom).offset(30)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
        tryAgainButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        tryAgainButton.layer.cornerRadius = 27.5
        tryAgainButton.backgroundColor = UIColor(red:0.38, green:0.87, blue:0.1, alpha:1)
    }

    
    func didTapOnCancelButton() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didTapOnTryAgainButton() {
        let gameBoardViewController = GameBoardViewController()
        presentViewController(gameBoardViewController, animated: true, completion: nil)
    }
    
    func configureGestureRecognizer(myView: UIView) {
        myView.userInteractionEnabled = true
        myView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("didTapOnCancelButton")))
    }
}
