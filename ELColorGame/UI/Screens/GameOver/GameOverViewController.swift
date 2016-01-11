//
//  GameOverViewController.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 26/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import GameKit

class GameOverViewController: UIViewController, GKGameCenterControllerDelegate {

    var blurEffectView: UIVisualEffectView = UIVisualEffectView(frame: CGRectZero)
    var scoreNumber: Int = Int()
    let scoreView = UIView(frame: CGRectZero)
    let retryButton = Button(title: "RETRY", color: UIColor(red:0.38, green:0.87, blue:0.1, alpha:1))
    let topPlayersButton = Button(title: "TOP PLAYERS", color: UIColor(red:0.33, green:0.78, blue:0.78, alpha:1))
    let quitButton = Button(title: "QUIT", color: UIColor(red:0.91, green:0.15, blue:0.33, alpha:1))
    
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
        configureBlurEffectView()
        configureScoreViewLayout()
        configureRetryButton()
        configureTopPlayersButtons()
        configureQuitButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        configureGestureRecognizer(self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScore()
    }
    
    func updateScore() {
        scoreNumberLabel.text = "\(scoreNumber)"
    }

    // MARK: Subviews

    func configureBlurEffectView () {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.contentView.backgroundColor = UIColor.clearColor()
        setupBlurEffectViewLayout()
    }
    
    private let scoreNumberLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont(name: BebasNeueBold, size: 60)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        return label
    }()

    private let scoreTextLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.text = "YOUR SCORE"
        label.font = UIFont(name: BebasNeueBold, size: 20)
        label.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        return label
    }()
    
    func configureQuitButton() {
        quitButton.buttonActionClosure = { [weak self] in
            self?.dismissGameOverViewController()
        }
        setupQuitButtonLayout()
    }
    
    func configureRetryButton() {
        retryButton.buttonActionClosure = { [weak self] in
            self?.didTapOnRetryButton()
        }
        setupRetryButtonLayout()
    }
    
    func configureTopPlayersButtons() {
        topPlayersButton.buttonActionClosure = { [weak self] in
            self?.showLeaders()
        }
        setupTopPlayersButtonLayout()
    }
    
    // MARK: GameCenter
    
    func showLeaders() {
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        presentViewController(gc, animated: true, completion: nil)
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Action methods
    
    func dismissGameOverViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func didTapOnRetryButton() {
        let gameBoardViewController = GameViewController()
        presentViewController(gameBoardViewController, animated: true, completion: nil)
    }
    
    func configureGestureRecognizer(myView: UIView) {
        myView.userInteractionEnabled = true
        myView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("dismissGameOverViewController")))
    }
    
    // MARK: Layout
    
    func setupBlurEffectViewLayout() {
        self.view.addSubview(blurEffectView)
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
    }

    func configureScoreViewLayout() {
        view.addSubview(scoreView)
        scoreView.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(0).offset(-110)
            make.centerX.equalTo(0)
        }
        scoreView.addSubview(scoreNumberLabel)
        scoreNumberLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.centerX.equalTo(0)
            make.left.greaterThanOrEqualTo(0)
            make.right.lessThanOrEqualTo(0)
        }
        scoreView.addSubview(scoreTextLabel)
        scoreTextLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(scoreNumberLabel.snp_bottom)
            make.centerX.equalTo(0)
            make.left.greaterThanOrEqualTo(0)
            make.right.lessThanOrEqualTo(0)
            make.bottom.equalTo(0)
        }
    }
    
    func setupRetryButtonLayout() {
        self.view.addSubview(retryButton)
        retryButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(scoreTextLabel.snp_bottom).offset(40)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
    }
    
    func setupTopPlayersButtonLayout() {
        self.view.addSubview(topPlayersButton)
        topPlayersButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(retryButton.snp_bottom).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
    }

    func setupQuitButtonLayout() {
        self.view.addSubview(quitButton)
        quitButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
            make.bottom.equalTo(-40)
        }
    }

}
