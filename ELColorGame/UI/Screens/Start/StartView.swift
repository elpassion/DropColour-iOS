//
//  Created by Dariusz Rybicki on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import Spring
import SnapKit

class StartView: UIView {

    private weak var delegate: StartViewDelegate?

    init(delegate: StartViewDelegate?) {
        self.delegate = delegate
        super.init(frame: CGRectZero)
        loadSubviews()
        setupLayout()
        configureButtonActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private func loadSubviews() {
        addSubview(backgroundView)
        addGradientForView(backgroundView)
        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(newGameButton)
        addSubview(rankingButton)
        addSubview(infoButton)
    }

    private let backgroundView: UIView = {
        let backgroundView = UIView(frame: CGRectZero)
        backgroundView.backgroundColor = UIColor(color: .Gray202B39)
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

    private let newGameButton = Button(title: newGame.localized, color: UIColor(color: .Green6BE01A))
    private let rankingButton = Button(title: ranking.localized, color: UIColor(color: .Turquoise54C7C7))
    private let infoButton = Button(image: UIImage(asset: .Info))

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
        rankingButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(newGameButton.snp_bottom).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(0)
        }
        infoButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-15)
            make.bottom.equalTo(-20)
        }
    }

    private func addGradientForView(view: UIView) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = UIScreen.mainScreen().bounds
        let topColor = UIColor(color: .PurpleC86DD7).CGColor
        let bottomColor = UIColor(color: .Blue3023AE).CGColor
        guard let topColorWithAlpha = CGColorCreateCopyWithAlpha(topColor, 0.2) else { return }
        guard let bottomColorWithAlpha = CGColorCreateCopyWithAlpha(bottomColor, 0.2) else { return }
        gradient.colors = [topColorWithAlpha, bottomColorWithAlpha]
        view.layer.insertSublayer(gradient, atIndex: 0)
    }

    // MARK: Button actions

    private func configureButtonActions() {
        newGameButton.buttonActionClosure = { [unowned self] in
            self.delegate?.startViewDidTapNewGame(self)
        }
        rankingButton.buttonActionClosure = { [unowned self] in
            self.delegate?.startViewDidTapRanking(self)
        }
        infoButton.buttonActionClosure = { [unowned self] in
            self.delegate?.startViewDidTapInfo(self)
        }
    }

}

// MARK: - Delegate

protocol StartViewDelegate: class {

    func startViewDidTapNewGame(startView: StartView)
    func startViewDidTapRanking(startView: StartView)
    func startViewDidTapInfo(startView: StartView)

}
