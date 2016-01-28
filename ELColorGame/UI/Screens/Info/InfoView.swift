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
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: Subviews

    private let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))

    func addSubviews() {
        addSubview(blurEffectView)
    }

    // MARK: Layout

    func setupLayout() {
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
    }

}

protocol InfoViewDelegate: class {

    func infoViewDidTapQuit(infoView: InfoView)

}
