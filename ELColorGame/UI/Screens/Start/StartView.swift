//
//  StartView.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import Spring

class StartView: UIView {

    private weak var delegate: StartViewDelegate?

    init(delegate: StartViewDelegate?) {
        self.delegate = delegate
        super.init(frame: CGRectZero)
        loadSubviews()
        setupLayout()
        configureButtonActions()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: Subviews

    private func loadSubviews() {
        addSubview(backgroundView)
        addGradientForView(backgroundView)
        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(newGameButton)
        addSubview(topPlayersButton)
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView(frame: CGRectZero)
        backgroundView.backgroundColor = UIColor(hex: "#202B39")
        return backgroundView
    }()

    private let backgroundImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.image = UIImage(asset: .CircleBackground)
        view.contentMode = .ScaleAspectFill
        return view
    }()

    private let logoImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.image = UIImage(asset: .DropColourLogo)
        view.contentMode = .ScaleAspectFit
        return view
    }()
    
    private let newGameButton = Button(title: kNewGame, color: UIColor(red:0.42, green:0.88, blue:0.1, alpha:1))
    private let topPlayersButton = Button(title: kTopPlayers, color: UIColor(red:0.33, green:0.78, blue:0.78, alpha:1))

    // MARK: Layout

    private func setupLayout() {
        backgroundView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        
        backgroundImageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        
        logoImageView.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(0).offset(-80)
            make.centerX.equalTo(0)
        }
        
        newGameButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(logoImageView.snp_bottom).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
        topPlayersButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(newGameButton.snp_bottom).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
    }
    
    private func addGradientForView(view: UIView) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = UIScreen.mainScreen().bounds
        let topColor = UIColor(hex: "#C86DD7")
        let bottomColor = UIColor(hex: "#3023AE")
        gradient.colors = [CGColorCreateCopyWithAlpha(topColor.CGColor, 0.2)!, CGColorCreateCopyWithAlpha(bottomColor.CGColor, 0.2)!]
        view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    // MARK: Button actions
    
    private func configureButtonActions() {
        newGameButton.buttonActionClosure = { [unowned self] in
            self.delegate?.startViewDidTapNewGame(self)
        }
        topPlayersButton.buttonActionClosure = { [unowned self] in
            self.delegate?.startViewDidTapTopPlayers(self)
        }
    }

}

// MARK: - Delegate

protocol StartViewDelegate: class {
    
    func startViewDidTapNewGame(startView: StartView)
    func startViewDidTapTopPlayers(startView: StartView)

}
