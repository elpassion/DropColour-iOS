import UIKit

protocol InfoViewDelegate: class {

    func infoViewDidTapQuit()
    func infoViewDidTapAuthor(_ author: Author)
    func infoViewDidTapCompanyLogo()

}

class InfoView: UIView {

    private weak var delegate: InfoViewDelegate?
    private var authorViews: [AuthorView]

    init(delegate: InfoViewDelegate?, authors: [Author]) {
        self.delegate = delegate
        self.authorViews = authors.map { AuthorView(author: $0) }
        super.init(frame: .zero)
        addSubviews()
        setupLayout()
        configureButtonActions()
        configureTapGesturesRecognizer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        closeButtonBlur.layer.cornerRadius = closeButtonBlur.frame.width / 2
    }

    // MARK: Subviews

    private let scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 20, right: 0)
        return view
    }()

    private let closeButtonBlur: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.clipsToBounds = true
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        view.addSubview(blur)
        blur.snp.makeConstraints { $0.edges.equalToSuperview() }
        return view
    }()

    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    private let closeButton = Button(image: UIImage(asset: .close))
    private let logoDescriptionView = LogoDescriptionView()
    private let lineViewAuthors = LineViewAuthors()

    private func addSubviews() {
        addSubview(blurEffectView)
        addSubview(scrollView)
        scrollView.addSubview(logoDescriptionView)
        scrollView.addSubview(lineViewAuthors)
        for authorView in authorViews {
            scrollView.addSubview(authorView)
        }
        addSubview(closeButtonBlur)
        addSubview(closeButton)
    }

    // MARK: Layout

    private func setupLayout() {
        blurEffectView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        logoDescriptionView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.centerXWithinMargins.equalToSuperview()
        }
        lineViewAuthors.snp.makeConstraints {
            $0.top.equalTo(logoDescriptionView.snp.bottom).offset(30)
            $0.left.right.equalToSuperview()
        }
        for (idx, authorView) in authorViews.enumerated() {
            authorView.snp.makeConstraints {
                $0.left.right.equalToSuperview()
                if authorView == authorViews.first {
                    $0.top.equalTo(lineViewAuthors.snp.bottom).offset(20)
                } else {
                    let previous = authorViews[idx - 1]
                    $0.top.equalTo(previous.snp.bottom).offset(20)
                }
                if authorView == authorViews.last {
                    $0.bottom.equalToSuperview()
                }
            }
        }
        closeButton.snp.makeConstraints {
            $0.top.equalTo(30)
            $0.right.equalTo(-15)
        }
        closeButtonBlur.snp.makeConstraints {
            $0.centerWithinMargins.equalTo(closeButton.snp.centerWithinMargins)
            $0.size.equalTo(closeButton.snp.size)
        }
    }

    // MARK: Button actions

    private func configureButtonActions() {
        closeButton.buttonActionClosure = { [weak self] in
            self?.delegate?.infoViewDidTapQuit()
        }
    }

    // MARK: Tap gestures

    func tapLogoDescriptionView(_ sender: UITapGestureRecognizer) {
        delegate?.infoViewDidTapCompanyLogo()
    }

    func tapAuthor(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view as? AuthorView else { return }
        delegate?.infoViewDidTapAuthor(view.author)
    }

    private func configureTapGesturesRecognizer() {
        let tapLogoRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapLogoDescriptionView(_:)))
        logoDescriptionView.addGestureRecognizer(tapLogoRecognizer)
        for authorView in authorViews {
            let tapAuthorRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAuthor(_:)))
            authorView.addGestureRecognizer(tapAuthorRecognizer)
        }
    }

}
