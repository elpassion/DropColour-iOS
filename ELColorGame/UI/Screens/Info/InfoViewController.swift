//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, InfoViewDelegate {

    var alertActionFactory: AlertActionCreating
    var alertControllerFactory: AlertControllerCreating
    var viewControllerPresenter: ViewControllerPresenting
    var authorProvider: AuthorProviding
    let tracker: Tracker
    
    init(tracker: Tracker) {
        self.tracker = tracker
        alertActionFactory = AlertActionFactory()
        alertControllerFactory = AlertControllerFactory()
        viewControllerPresenter = ViewControllerPresenter()
        authorProvider = AuthorProvider()
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        modalPresentationStyle = UIModalPresentationStyle.Custom
        viewControllerPresenter.viewController = self
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() {
        view = InfoView(delegate: self, authors: authorProvider.authors)
    }

    // MARK: InfoViewDelegate

    func infoViewDidTapQuit() {
        viewControllerPresenter.dismissViewController(self)
    }

    func infoViewDidTapAuthor(author: Author) {
        presentAlertControllerWithAuthor(author)
    }

}
