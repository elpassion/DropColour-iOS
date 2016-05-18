//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class LineViewAuthors: UIView {

    init() {
        super.init(frame: CGRectZero)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.text = authors.localized
        label.textAlignment = .Center
        label.font = UIFont(name: BebasNeueBold, size: 14)
        label.textColor = UIColor(color: .White)
        return label
    }()

    private let leftLineView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor(color: .White).colorWithAlphaComponent(0.1)
        return view
    }()

    private let rightLineView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor(color: .White).colorWithAlphaComponent(0.1)
        return view
    }()

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(leftLineView)
        addSubview(rightLineView)
    }

    // MARK: Layout

    private func setupLayout() {
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.bottom.centerX.equalTo(0)
        }
        leftLineView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(30)
            make.height.equalTo(1)
            make.centerY.equalTo(0)
            make.right.equalTo(titleLabel.snp_left).offset(-10)
        }
        rightLineView.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-30)
            make.height.equalTo(leftLineView.snp_height)
            make.left.equalTo(titleLabel.snp_right).offset(10)
            make.centerY.equalTo(titleLabel.snp_centerY)
        }
    }

}
