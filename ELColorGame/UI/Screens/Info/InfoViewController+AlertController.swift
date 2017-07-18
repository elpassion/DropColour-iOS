//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

extension InfoViewController {

    func presentAlertController(withAuthor author: Author) {
        let alertController = alertControllerFactory.createAlertController(withTitle: "\(author.fullName) \(showProfile.localized)", message: nil, preferredStyle: .actionSheet)
        configureProfessionActionIfNeeded(author, alertController: alertController)
        configureTwitterActionIfNeeded(author, alertController: alertController)
        configureCancelActionIfNeeded(author, alertController: alertController)
        presentAlertControllerIfNeeded(author, alertController: alertController)
    }

    func openCompanyWebsite() {
        let companyUrl = URL(string: "https://www.elpassion.com")
        guard let url = companyUrl else { return }
        _ = urlOpener.open(url: url)
    }

    private func configureProfessionActionIfNeeded(_ author: Author, alertController: UIAlertController) {
        guard let professionUrl = author.professionUrl else { return }
        guard urlOpener.canOpen(url: professionUrl) else { return }
        let proffesionAction = openUrlAlertActionWithTitle(author.type == .developer ? github.localized : dribbble.localized, url: professionUrl)
        alertController.addAction(proffesionAction)
    }

    private func configureTwitterActionIfNeeded(_ author: Author, alertController: UIAlertController) {
        guard let twitterUrl = author.twitterUrl else { return }
        guard urlOpener.canOpen(url: twitterUrl) else { return }
        let twitterAction = openUrlAlertActionWithTitle(twitter.localized, url: twitterUrl as URL)
        alertController.addAction(twitterAction)
    }

    private func configureCancelActionIfNeeded(_ author: Author, alertController: UIAlertController) {
        guard hasOneCorrectUrlAtLeast(author) else { return }
        let cancelAction = cancelAlertAction()
        alertController.addAction(cancelAction)
    }

    private func presentAlertControllerIfNeeded(_ author: Author, alertController: UIAlertController) {
        guard hasOneCorrectUrlAtLeast(author) else { return }
        viewControllerPresenter.present(viewController: alertController)
    }

    private func hasOneCorrectUrlAtLeast(_ author: Author) -> Bool {
        return urlOpener.canOpen(url: author.professionUrl) || urlOpener.canOpen(url: author.twitterUrl)
    }

    // MARK: Alert Actions

    private func openUrlAlertActionWithTitle(_ title: String, url: URL) -> UIAlertAction {
        return self.alertActionFactory.createAction(withTitle: title, style: .default) { [weak self] (action) -> () in
            _ = self?.urlOpener.open(url: url)
        }
    }

    private func cancelAlertAction() -> UIAlertAction {
        return self.alertActionFactory.createAction(withTitle: cancel.localized, style: .cancel, handler: nil)
    }

}
