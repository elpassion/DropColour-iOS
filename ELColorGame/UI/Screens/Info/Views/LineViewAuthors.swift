//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class LineViewAuthors: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = authors.localized
        label.textAlignment = .center
        label.font = UIFont(name: BebasNeueBold, size: 14)
        label.textColor = UIColor(color: .white)
        return label
    }()

    private let leftLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(color: .white).withAlphaComponent(0.1)
        return view
    }()

    private let rightLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(color: .white).withAlphaComponent(0.1)
        return view
    }()

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(leftLineView)
        addSubview(rightLineView)
    }

    // MARK: Layout

    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.centerX.equalTo(0)
        }
        leftLineView.snp.makeConstraints {
            $0.left.equalTo(30)
            $0.height.equalTo(1)
            $0.centerY.equalTo(0)
            $0.right.equalTo(titleLabel.snp.left).offset(-10)
        }
        rightLineView.snp.makeConstraints {
            $0.right.equalTo(-30)
            $0.height.equalTo(leftLineView.snp.height)
            $0.left.equalTo(titleLabel.snp.right).offset(10)
            $0.centerY.equalTo(titleLabel.snp.centerY)
        }
    }

}
