import UIKit

class AuthorView: UIView {

    let author: Author

    init(author: Author) {
        self.author = author
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        applyType()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }

    private func applyType() {
        fullNameLabel.text = author.fullName
        authorTypeLabel.text = author.type.rawValue
        professionImageView.image = author.type.image
        configureImageForAvatarImageView()
        configureProfessionLoginLabel()
        configureTwitterLoginLabel()
    }

    // MARK: Configure subviews with data

    private func configureImageForAvatarImageView() {
        guard let avatarUrl = author.avatarUrl else { return }
        avatarImageView.image = UIImage(named: avatarUrl.absoluteString)
    }

    private func configureProfessionLoginLabel() {
        guard let professionUrl = author.professionUrl else { return }
        professionLoginLabel.text = author.loginFromUrl(professionUrl)
    }

    private func configureTwitterLoginLabel() {
        guard let twitterUrl = author.twitterUrl else { return }
        twitterLoginLabel.text = author.loginFromUrl(twitterUrl)
    }

    // MARK: Subviews

    private let avatarImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(font: FontFamily.BebasNeue.bold, size: 20)
        label.textColor = UIColor(color: .white)
        return label
    }()

    private let authorTypeLabel: UILabel = AuthorView.createLabel()

    private let professionImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let professionLoginLabel = AuthorView.createLabel()

    private let twitterImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(asset: .twitter)
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let twitterLoginLabel = AuthorView.createLabel()

    private class func createLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(color: .white).withAlphaComponent(0.8)
        return label
    }

    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(authorTypeLabel)
        addSubview(fullNameLabel)
        addSubview(professionImageView)
        addSubview(professionLoginLabel)
        addSubview(twitterImageView)
        addSubview(twitterLoginLabel)
    }

    // MARK: Layout

    private func setupLayout() {
        avatarImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.lessThanOrEqualTo(0)
            $0.size.equalTo(CGSize(width: 80, height: 80))
            $0.left.equalTo(45)
        }
        fullNameLabel.snp.makeConstraints {
            $0.top.equalTo(avatarImageView.snp.top)
            $0.left.equalTo(avatarImageView.snp.right).offset(15)
            $0.right.equalTo(-16)
        }
        authorTypeLabel.snp.makeConstraints {
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(5)
            $0.left.equalTo(fullNameLabel.snp.left)
            $0.right.equalTo(-16)
        }
        professionImageView.snp.makeConstraints {
            $0.top.equalTo(authorTypeLabel.snp.bottom).offset(5)
            $0.left.equalTo(authorTypeLabel.snp.left)
        }
        professionLoginLabel.snp.makeConstraints {
            $0.left.equalTo(professionImageView.snp.right).offset(5)
            $0.centerY.equalTo(professionImageView.snp.centerY)
        }
        twitterImageView.snp.makeConstraints {
            $0.top.equalTo(professionImageView.snp.bottom).offset(5)
            $0.left.equalTo(professionImageView.snp.left)
        }
        twitterLoginLabel.snp.makeConstraints {
            $0.left.equalTo(twitterImageView.snp.right).offset(5)
            $0.centerY.equalTo(twitterImageView.snp.centerY)
            $0.bottom.lessThanOrEqualTo(0)
        }
    }

}

private extension AuthorType {
    var image: UIImage? {
        switch self {
        case .developer:
            return UIImage(asset: .github)
        case .designer:
            return UIImage(asset: .dribbble)
        }
    }
}
