import UIKit

class LogoDescriptionView: UIView {

    init() {
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private let logoImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(asset: .elpassion)
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = infoDescription.localized
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor(color: .white)
        return label
    }()

    private func addSubviews() {
        addSubview(logoImageView)
        addSubview(descriptionLabel)
    }

    // MARK: Layout

    private func setupLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerXWithinMargins.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(25)
            $0.left.equalTo(25)
            $0.right.equalTo(-25)
            $0.bottom.equalToSuperview()
        }
    }

}
