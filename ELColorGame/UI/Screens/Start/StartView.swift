//
//  StartView.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class StartView: UIView {

    private weak var delegate: StartViewDelegate?

    init(delegate: StartViewDelegate?) {
        self.delegate = delegate
        super.init(frame: CGRectZero)
        loadSubviews()
        setupLayout()
        newGameButton.buttonActionClosure = { [unowned self] in
            delegate?.startViewDidTapNewGame(self)
        }
        topPlayersButton.buttonActionClosure = { [unowned self] in
            delegate?.startViewDidTapTopPlayers(self)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private func loadSubviews() {
        addSubview(backgroundImageView)
        addSubview(newGameButton)
        addSubview(topPlayersButton)
    }

    private let backgroundImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.image = UIImage(named: "background")
        return view
    }()

    private let newGameButton = Button(title: "NEW GAME", color: UIColor(red:0.42, green:0.88, blue:0.1, alpha:1))

    private let topPlayersButton = Button(title: "TOP PLAYERS", color: UIColor(red:0.33, green:0.78, blue:0.78, alpha:1))

    // MARK: Layout

    private func setupLayout() {
        backgroundImageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        newGameButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
            make.centerY.equalTo(80)
        }
        topPlayersButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(newGameButton.snp_bottom).offset(15)
            make.width.equalTo(170)
            make.height.equalTo(55)
            make.centerX.equalTo(0)
        }
    }

}

// MARK: - Delegate

protocol StartViewDelegate: class {
    
    func startViewDidTapNewGame(startView: StartView)

    func startViewDidTapTopPlayers(startView: StartView)

}
