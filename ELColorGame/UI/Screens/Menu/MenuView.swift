import UIKit

class MenuView: UIView {

    private weak var delegate: MenuViewDelegate?

    init(delegate: MenuViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        loadSubviews()
        setupLayout()
        resumeButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapResume(self)
        }
        newGameButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapNewGame(self)
        }
        quitButton.buttonActionClosure = { [unowned self] in
            delegate?.menuViewDidTapQuit(self)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private func loadSubviews() {
        addSubview(blurEffectView)
        addSubview(resumeButton)
        addSubview(newGameButton)
        addSubview(quitButton)
        addSubview(pauseImageView)
        addSubview(pauseLabelText)
    }

    private let blurEffectView = Factory.blurEffectView
    private let resumeButton = Button(title: resume.localized, color: UIColor(color: .blue0091FC))
    private let newGameButton = Button(title: newGame.localized, color: UIColor(color: .green6BE01A))
    private let quitButton = Button(title: quit.localized, color: UIColor(color: .redE82654))
    private let pauseImageView = Factory.pauseImageView
    private let pauseLabelText = Factory.pauseLabel

    // MARK: Layout

    private func setupLayout() {
        blurEffectView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        resumeButton.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalToSuperview()
            $0.centerYWithinMargins.equalToSuperview()
        }
        newGameButton.snp.makeConstraints {
            $0.top.equalTo(resumeButton.snp.bottom).offset(15)
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalToSuperview()
        }
        quitButton.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalToSuperview()
            $0.bottom.equalTo(-40)
        }
        pauseLabelText.snp.makeConstraints {
            $0.centerXWithinMargins.equalToSuperview()
            $0.bottom.equalTo(resumeButton.snp.top).offset(-40)
        }
        pauseImageView.snp.makeConstraints {
            $0.bottom.equalTo(pauseLabelText.snp.top).offset(-20)
            $0.centerXWithinMargins.equalToSuperview()
        }
    }

}

// MARK: - Delegate

protocol MenuViewDelegate: class {

    func menuViewDidTapResume(_ menuView: MenuView)
    func menuViewDidTapNewGame(_ menuView: MenuView)
    func menuViewDidTapQuit(_ menuView: MenuView)

}

private extension MenuView {
    struct Factory {
        static var blurEffectView: UIVisualEffectView {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            return UIVisualEffectView(effect: blurEffect)
        }

        static var pauseImageView: UIImageView {
            let view = UIImageView(frame: .zero)
            view.image = UIImage(asset: .pauseIcon)
            view.contentMode = .scaleAspectFit
            return view
        }

        static var pauseLabel: UILabel {
            let label = UILabel(frame: CGRect.zero)
            label.text = pause.localized
            label.font = UIFont(font: FontFamily.BebasNeue.bold, size: 30)
            label.textColor = UIColor(color: .white)
            return label
        }
    }
}
