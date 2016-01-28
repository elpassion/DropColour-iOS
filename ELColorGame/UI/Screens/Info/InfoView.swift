//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class InfoView: UIView {

    private weak var delegate: InfoViewDelegate?

    init(delegate: InfoViewDelegate?) {
        self.delegate = delegate
        super.init(frame: CGRectZero)
        addSubviews()
        setupLayout()
        configureButtonActions()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: Subviews

    private let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
    private let closeButton = Button(image: UIImage(asset: .Close))
    private let logoDescriptionView = LogoDescriptionView()

    func addSubviews() {
        addSubview(blurEffectView)
        addSubview(closeButton)
        addSubview(logoDescriptionView)
    }

    // MARK: Layout

    func setupLayout() {
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        closeButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(30)
            make.right.equalTo(-15)
        }
        logoDescriptionView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(closeButton.snp_bottom).offset(30)
            make.left.right.equalTo(0)
        }
    }
    
    // MARK: Button actions
    
    private func configureButtonActions() {
        closeButton.buttonActionClosure = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.delegate?.infoViewDidTapQuit(weakSelf)
        }
    }

}

protocol InfoViewDelegate: class {

    func infoViewDidTapQuit(infoView: InfoView)

}
