//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class LogoDescriptionView: UIView {

    init() {
        super.init(frame: CGRectZero)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private let logoImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.image = UIImage(asset: .Elpassion)
        view.contentMode = UIViewContentMode.ScaleAspectFit
        return view
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.text = infoDescription.localized
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(11)
        label.textColor = UIColor(color: .White)
        return label
    }()

    private func addSubviews() {
        addSubview(logoImageView)
        addSubview(descriptionLabel)
    }

    // MARK: Layout

    private func setupLayout() {
        logoImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.centerX.equalTo(0)
        }
        descriptionLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(logoImageView.snp_bottom).offset(25)
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.bottom.equalTo(0)
        }
    }

}
