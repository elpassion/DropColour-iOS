//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class InfoView: UIView, UIGestureRecognizerDelegate {

    private weak var delegate: InfoViewDelegate?

    init(delegate: InfoViewDelegate?) {
        self.delegate = delegate
        super.init(frame: CGRectZero)
        addSubviews()
        setupLayout()
        configureButtonActions()
        configureTapGesturesRecognizer()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: Subviews

    private let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
    private let scrollView = UIScrollView(frame: CGRectZero)
    private let closeButton = Button(image: UIImage(asset: .Close))
    private let logoDescriptionView = LogoDescriptionView()
    private let lineViewAuthors = LineViewAuthors()
    private let firstAuthorView = AuthorView(author: AuthorRepository.firstAuthor())
    private let secondAuthorView = AuthorView(author: AuthorRepository.secondAuthor())
    private let thirdAuthorView = AuthorView(author: AuthorRepository.thirdAuthor())
    
    func addSubviews() {
        addSubview(blurEffectView)
        addSubview(closeButton)
        addSubview(scrollView)
        scrollView.addSubview(logoDescriptionView)
        scrollView.addSubview(lineViewAuthors)
        scrollView.addSubview(firstAuthorView)
        scrollView.addSubview(secondAuthorView)
        scrollView.addSubview(thirdAuthorView)
    }

    // MARK: Layout

    func setupLayout() {
        blurEffectView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        closeButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(30)
            make.right.equalTo(-15)
        }
        scrollView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(closeButton.snp_bottom).offset(5)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-20)
        }
        logoDescriptionView.snp_makeConstraints { (make) -> Void in
            make.top.left.right.centerX.equalTo(0)
        }
        lineViewAuthors.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(logoDescriptionView.snp_bottom).offset(30)
            make.left.right.equalTo(0)
        }
        firstAuthorView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(lineViewAuthors.snp_bottom).offset(20)
            make.left.right.equalTo(0)
        }
        secondAuthorView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(firstAuthorView.snp_bottom).offset(20)
            make.left.right.equalTo(0)
        }
        thirdAuthorView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(secondAuthorView.snp_bottom).offset(20)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    // MARK: Button actions

    private func configureButtonActions() {
        closeButton.buttonActionClosure = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.delegate?.infoViewDidTapQuit(weakSelf)
        }
    }
    
    // MARK: Tap gestures
    
    private func configureTapGesturesRecognizer() {
        let tapGestureFirstAuthor = UITapGestureRecognizer(target: self, action: "tapFirstAuthor:")
        let tapGestureSecondAuthor = UITapGestureRecognizer(target: self, action: "tapSecondAuthor:")
        let tapGestureThirdAuthor = UITapGestureRecognizer(target: self, action: "tapThirdAuthor:")
        tapGestureFirstAuthor.delegate = self
        tapGestureSecondAuthor.delegate = self
        tapGestureThirdAuthor.delegate = self
        firstAuthorView.addGestureRecognizer(tapGestureFirstAuthor)
        secondAuthorView.addGestureRecognizer(tapGestureSecondAuthor)
        thirdAuthorView.addGestureRecognizer(tapGestureThirdAuthor)
    }
    
    func tapFirstAuthor(sender: UITapGestureRecognizer) {
        delegate?.infoViewDidTapAuthor(firstAuthorView.author)
    }
    
    func tapSecondAuthor(sender: UITapGestureRecognizer) {
        delegate?.infoViewDidTapAuthor(secondAuthorView.author)
    }

    func tapThirdAuthor(sender: UITapGestureRecognizer) {
        delegate?.infoViewDidTapAuthor(thirdAuthorView.author)
    }

}

protocol InfoViewDelegate: class {

    func infoViewDidTapQuit(infoView: InfoView)
    func infoViewDidTapAuthor(author: Author)

}
