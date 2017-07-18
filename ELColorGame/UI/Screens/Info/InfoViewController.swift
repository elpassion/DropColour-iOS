//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, InfoViewDelegate {

    let tracker: TrackerProtocol
    var alertActionFactory: AlertActionCreating
    var alertControllerFactory: AlertControllerCreating
    var viewControllerPresenter: ViewControllerPresenting
    var authorProvider: AuthorProviding
    var urlOpener: UrlOpening

    init(tracker: TrackerProtocol) {
        self.tracker = tracker
        alertActionFactory = AlertActionFactory()
        alertControllerFactory = AlertControllerFactory()
        viewControllerPresenter = ViewControllerPresenter()
        authorProvider = AuthorProvider()
        urlOpener = UrlOpener()
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .custom
        viewControllerPresenter.viewController = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = InfoView(delegate: self, authors: authorProvider.authors)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "InfoViewController")
    }

    // MARK: InfoViewDelegate

    func infoViewDidTapQuit() {
        viewControllerPresenter.dismiss(viewController: self)
    }

    func infoViewDidTapAuthor(_ author: Author) {
        presentAlertController(withAuthor: author)
    }

    func infoViewDidTapCompanyLogo() {
        openCompanyWebsite()
    }

}
