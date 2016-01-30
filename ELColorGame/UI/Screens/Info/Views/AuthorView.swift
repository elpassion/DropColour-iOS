//
// Created by Mateusz Szklarek on 29/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

extension AuthorType {
    var image: UIImage? {
        switch self {
        case .Developer:
            return UIImage(asset: .Github)
        case .Designer:
            return UIImage(asset: .Dribbble)
        }
    }
}

class AuthorView: UIView {

    let author: Author

    init(author: Author) {
        self.author = author
        super.init(frame: CGRectZero)
        addSubviews()
        setupLayout()
        applyType()
    }

    private func applyType() {
        fullNameLabel.text = author.fullName
        authorTypeLabel.text = author.type.rawValue
        proffesionImageView.image = author.type.image
        guard let avatarUrl = author.avatar else { return }
        avatarImageView.image = UIImage(named: avatarUrl.absoluteString)
        guard let professionUrl = author.proffesionUrl else { return }
        professionLabel.text = author.loginFromUrl(professionUrl)
        guard let twitterUrl = author.twitterUrl else { return }
        twitterLabel.text = author.loginFromUrl(twitterUrl)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }

    // MARK: Subviews

    private let avatarImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.contentMode = UIViewContentMode.ScaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont(name: BebasNeueBold, size: 20)
        label.textColor = UIColor(color: .White)
        return label
    }()

    private let authorTypeLabel: UILabel = AuthorView.createLabel()

    private let proffesionImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
        view.contentMode = UIViewContentMode.ScaleAspectFit
        return view
    }()

    private let professionLabel = AuthorView.createLabel()

    private let twitterImageView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.image = UIImage(asset: .Twitter)
        view.contentMode = UIViewContentMode.ScaleAspectFit
        return view
    }()
    
    private let twitterLabel = AuthorView.createLabel()
    
    private class func createLabel() -> UILabel {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor(color: .White).colorWithAlphaComponent(0.8)
        return label
    }

    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(authorTypeLabel)
        addSubview(fullNameLabel)
        addSubview(proffesionImageView)
        addSubview(professionLabel)
        addSubview(twitterImageView)
        addSubview(twitterLabel)
    }

    // MARK: Layout

    private func setupLayout() {
        avatarImageView.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 60, height: 60))
            make.left.equalTo(45)
            make.centerY.equalTo(0)
        }
        fullNameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(avatarImageView.snp_right).offset(15)
            make.right.equalTo(-16)
        }
        authorTypeLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(fullNameLabel.snp_bottom).offset(5)
            make.left.equalTo(fullNameLabel.snp_left)
            make.right.equalTo(-16)
        }
        proffesionImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(authorTypeLabel.snp_bottom).offset(5)
            make.left.equalTo(authorTypeLabel.snp_left)
        }
        professionLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(proffesionImageView.snp_right).offset(5)
            make.centerY.equalTo(proffesionImageView.snp_centerY)
        }
        twitterImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(proffesionImageView.snp_bottom).offset(5)
            make.left.equalTo(proffesionImageView.snp_left)
        }
        twitterLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(twitterImageView.snp_right).offset(5)
            make.centerY.equalTo(twitterImageView.snp_centerY)
            make.bottom.equalTo(0)
        }
    }

}
