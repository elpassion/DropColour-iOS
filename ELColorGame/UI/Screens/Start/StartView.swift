import UIKit
import Spring
import SnapKit

class StartView: UIView {

    private weak var delegate: StartViewDelegate?

    init(delegate: StartViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
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
        let backgroundView = UIView(frame: .zero)
        backgroundView.backgroundColor = UIColor(color: .gray202B39)
        return backgroundView
    }()

    private let backgroundImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(asset: .circleBackground)
        view.contentMode = .scaleAspectFill
        return view
    }()

    private let logoImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(asset: .dropColourLogo)
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let newGameButton = Button(title: newGame.localized, color: UIColor(color: .green6BE01A))
    private let rankingButton = Button(title: ranking.localized, color: UIColor(color: .turquoise54C7C7))
    private let infoButton = Button(image: UIImage(asset: .info))

    // MARK: Layout

    private func setupLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }

        backgroundImageView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }

        logoImageView.snp.makeConstraints {
            $0.centerYWithinMargins.equalTo(0).offset(-80)
            $0.centerXWithinMargins.equalTo(0)
        }

        newGameButton.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(50)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalTo(0)
        }
        rankingButton.snp.makeConstraints {
            $0.top.equalTo(newGameButton.snp.bottom).offset(15)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalTo(0)
        }
        infoButton.snp.makeConstraints {
            $0.right.equalTo(-15)
            $0.bottom.equalTo(-20)
        }
    }

    private func addGradientForView(_ view: UIView) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = UIScreen.main.bounds
        let topColor = UIColor(color: .purpleC86DD7).cgColor
        let bottomColor = UIColor(color: .blue3023AE).cgColor
        guard let topColorWithAlpha = topColor.copy(alpha: 0.2) else { return }
        guard let bottomColorWithAlpha = bottomColor.copy(alpha: 0.2) else { return }
        gradient.colors = [topColorWithAlpha, bottomColorWithAlpha]
        view.layer.insertSublayer(gradient, at: 0)
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
    func startViewDidTapNewGame(_ startView: StartView)
    func startViewDidTapRanking(_ startView: StartView)
    func startViewDidTapInfo(_ startView: StartView)
}
