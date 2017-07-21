import UIKit

protocol GameOverViewDelegate: class {
    func gameOverViewDidTapRetry(_ gameOverView: GameOverView)
    func gameOverViewDidTapShowLeaders(_ gameOverView: GameOverView)
    func gameOverViewDidTapQuit(_ gameOverView: GameOverView)
}

class GameOverView: UIView {

    let score: Int

    private weak var delegate: GameOverViewDelegate?

    init(score: Int, delegate: GameOverViewDelegate?) {
        self.score = score
        self.delegate = delegate
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        configureButtonActions()
        updateScore()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateScore() {
        scoreNumberLabel.text = "\(score)"
    }

    // MARK: Subviews

    private func addSubviews() {
        addSubview(blurEffectView)
        addSubview(scoreView)
        scoreView.addSubview(scoreNumberLabel)
        scoreView.addSubview(scoreTextLabel)
        addSubview(retryButton)
        addSubview(rankingButton)
        addSubview(quitButton)
    }

    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark))
    private let scoreView = UIView(frame: CGRect.zero)
    private let retryButton = Button(title: retry.localized, color: UIColor(color: .green6BE01A))
    private let rankingButton = Button(title: ranking.localized, color: UIColor(color: .turquoise54C7C7))
    private let quitButton = Button(title: quit.localized, color: UIColor(color: .redE82654))

    private let scoreNumberLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(font: FontFamily.BebasNeue.bold, size: 60)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = UIColor(color: .white)
        return label
    }()

    private let scoreTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = yourScore.localized
        label.font = UIFont(font: FontFamily.BebasNeue.bold, size: 20)
        label.textColor = UIColor(color: .white)
        return label
    }()

    // MARK: Layout

    private func setupLayout() {
        blurEffectView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        scoreView.snp.makeConstraints {
            $0.centerYWithinMargins.equalTo(0).offset(-110)
            $0.centerXWithinMargins.equalTo(0)
        }
        scoreNumberLabel.snp.makeConstraints {
            $0.top.equalTo(0)
            $0.centerXWithinMargins.equalTo(0)
            $0.left.greaterThanOrEqualTo(0)
            $0.right.lessThanOrEqualTo(0)
        }
        scoreTextLabel.snp.makeConstraints {
            $0.top.equalTo(scoreNumberLabel.snp.bottom)
            $0.centerXWithinMargins.equalTo(0)
            $0.left.greaterThanOrEqualTo(0)
            $0.right.lessThanOrEqualTo(0)
            $0.bottom.equalTo(0)
        }
        retryButton.snp.makeConstraints {
            $0.top.equalTo(scoreTextLabel.snp.bottom).offset(40)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalTo(0)
        }
        rankingButton.snp.makeConstraints {
            $0.top.equalTo(retryButton.snp.bottom).offset(15)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalTo(0)
        }
        quitButton.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalTo(0)
            $0.bottom.equalTo(-40)
        }
    }

    // MARK: Button actions

    private func configureButtonActions() {
        retryButton.buttonActionClosure = { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.gameOverViewDidTapRetry(self)
        }
        rankingButton.buttonActionClosure = { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.gameOverViewDidTapShowLeaders(self)
        }
        quitButton.buttonActionClosure = { [weak self] in
            guard let `self` = self else { return }
            self.delegate?.gameOverViewDidTapQuit(self)
        }
    }

}
