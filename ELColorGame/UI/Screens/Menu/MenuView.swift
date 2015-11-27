//
//  MenuView.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 07/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    private weak var delegate: MenuViewDelegate?
    
    init(delegate: MenuViewDelegate?) {
        self.delegate = delegate
        super.init(frame: CGRectZero)
        loadSubviews()
        setupLayout()
        resumeButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapResume(self)
        }
        newGameButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapNewGame(self)
        }
        quitButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapQuit(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Subviews
    
    private func loadSubviews() {
        addSubview(blurEffectView)
        addSubview(resumeButton)
        addSubview(newGameButton)
        addSubview(quitButton)
        addSubview(pauseImageView)
        addSubview(pauseLabelText)
    }
    
    private let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
    
    private let resumeButton = Button(title: "RESUME", color: UIColor(red:0, green:0.57, blue:0.99, alpha:1))
    
    private let newGameButton = Button(title: "NEW GAME", color: UIColor(red:0.38, green:0.87, blue:0.1, alpha:1))
    
    private let quitButton = Button(title: "QUIT", color: UIColor(red:0.91, green:0.15, blue:0.33, alpha:1))
    
    private let pauseImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.image = UIImage(named: "pause_icon")
        view.contentMode = UIViewContentMode.ScaleAspectFit
        return view
    }()
    
    private let pauseLabelText: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.text = "PAUSE"
        label.font = UIFont(name: BebasNeueBold, size: 30)
        label.textColor = UIColor(red:1, green:1, blue:1, alpha:1)
        return label
    }()
    
    // MARK: Layout
    
    private func setupLayout() {
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        resumeButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
            make.centerY.equalTo(0)
        }
        newGameButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(resumeButton.snp_bottom).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
        quitButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
            make.bottom.equalTo(-40)
        }
        pauseLabelText.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(0)
            make.bottom.equalTo(resumeButton.snp_top).offset(-40)
        }
        pauseImageView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(pauseLabelText.snp_top).offset(-20)
            make.centerX.equalTo(0)
        }
    }
    
}

// MARK: - Delegate

protocol MenuViewDelegate: class {
    
    func menuViewDidTapResume(menuView: MenuView)
    func menuViewDidTapNewGame(menuView: MenuView)
    func menuViewDidTapQuit(menuView: MenuView)
    
}
