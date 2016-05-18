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
        modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        modalPresentationStyle = UIModalPresentationStyle.Custom
        viewControllerPresenter.viewController = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = InfoView(delegate: self, authors: authorProvider.authors)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "InfoViewController")
    }

    // MARK: InfoViewDelegate

    func infoViewDidTapQuit() {
        viewControllerPresenter.dismissViewController(self)
    }

    func infoViewDidTapAuthor(author: Author) {
        presentAlertControllerWithAuthor(author)
    }

    func infoViewDidTapCompanyLogo() {
        openCompanyWebsite()
    }

}
