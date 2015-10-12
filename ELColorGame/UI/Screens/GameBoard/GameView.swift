//
//  GameView.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    let delegate: GameViewDelegate?
    
    init(boardView: GameBoardView, delegate: GameViewDelegate?) {
        self.delegate = delegate
        self.boardView = boardView
        super.init(frame: CGRectZero)
        backgroundColor = UIColor(red:0.22, green:0.2, blue:0.34, alpha:1)
        loadSubviews()
        setupLayout()
        pauseButton.buttonActionClosure = { [unowned self] in
            delegate?.gameBoardViewDidTapPause(self)
        }
        restartButton.buttonActionClosure = { [unowned self] in
            delegate?.gameBoardViewDidTapRestart(self)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Subviews
    
    private func loadSubviews() {
        addSubview(topView)
        addSubview(pauseButton)
        addSubview(restartButton)
        addSubview(scoreTextLabel)
        addSubview(scoreNumberLabel)
        addSubview(boardView)
    }
    
    private let topView = UIView()
    
    private let pauseButton = Button(image: UIImage(named: "pause"))
    
    private let restartButton = Button(image: UIImage(named: "restart"))
    
    private let scoreTextLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.text = "SCORE"
        label.font = UIFont(name: BebasNeueBold, size: 17)
        label.textColor = UIColor(red:0.49, green:0.46, blue:0.78, alpha:1)
        return label
    }()
    
    private let scoreNumberLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.text = "0"
        label.font = UIFont(name: BebasNeueBold, size: 46)
        label.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        return label
    }()
    
    let boardView: GameBoardView
    
    // MARK: Layout

    private func setupLayout() {
        topView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(self).multipliedBy(0.12)
        }
        pauseButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(40)
            make.left.equalTo(40)
        }
        scoreTextLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(scoreNumberLabel.snp_bottom)
            make.centerX.equalTo(0)
        }
        scoreNumberLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.top.equalTo(30)
        }
        restartButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(40)
            make.right.equalTo(-40)
        }
        boardView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(topView.snp_bottom)
            make.left.right.bottom.equalTo(0)
        }
    }
}

// MARK: - Delegate

protocol GameViewDelegate: class {
    
    func gameBoardViewDidTapPause(gameBoardView: GameView)
    
    func gameBoardViewDidTapRestart(gameBoardView: GameView)
    
}

