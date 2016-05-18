//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

extension InfoViewController {

    func presentAlertControllerWithAuthor(author: Author) {
        let alertController = alertControllerFactory.createAlertControllerWithTitle("\(author.fullName) \(showProfile.localized)", message: nil, preferredStyle: .ActionSheet)
        configureProfessionActionIfNeeded(author, alertController: alertController)
        configureTwitterActionIfNeeded(author, alertController: alertController)
        configureCancelActionIfNeeded(author, alertController: alertController)
        presentAlertControllerIfNeeded(author, alertController: alertController)
    }

    func openCompanyWebsite() {
        let companyUrl = NSURL(string: "https://www.elpassion.com")
        guard let url = companyUrl else { return }
        urlOpener.openURL(url)
    }

    private func configureProfessionActionIfNeeded(author: Author, alertController: UIAlertController) {
        guard let professionUrl = author.professionUrl else { return }
        guard urlOpener.canOpenURL(professionUrl) else { return }
        let proffesionAction = openUrlAlertActionWithTitle(author.type == AuthorType.Developer ? github.localized : dribbble.localized, url: professionUrl)
        alertController.addAction(proffesionAction)
    }

    private func configureTwitterActionIfNeeded(author: Author, alertController: UIAlertController) {
        guard let twitterUrl = author.twitterUrl else { return }
        guard urlOpener.canOpenURL(twitterUrl) else { return }
        let twitterAction = openUrlAlertActionWithTitle(twitter.localized, url: twitterUrl)
        alertController.addAction(twitterAction)
    }

    private func configureCancelActionIfNeeded(author: Author, alertController: UIAlertController) {
        guard hasOneCorrectUrlAtLeast(author) else { return }
        let cancelAction = cancelAlertAction()
        alertController.addAction(cancelAction)
    }

    private func presentAlertControllerIfNeeded(author: Author, alertController: UIAlertController) {
        guard hasOneCorrectUrlAtLeast(author) else { return }
        viewControllerPresenter.presentViewController(alertController)
    }

    private func hasOneCorrectUrlAtLeast(author: Author) -> Bool {
        return urlOpener.canOpenURL(author.professionUrl) || urlOpener.canOpenURL(author.twitterUrl)
    }

    // MARK: Alert Actions

    private func openUrlAlertActionWithTitle(title: String, url: NSURL) -> UIAlertAction {
        return self.alertActionFactory.createActionWithTitle(title, style: .Default) { [weak self] (action) -> () in
            self?.urlOpener.openURL(url)
        }
    }

    private func cancelAlertAction() -> UIAlertAction {
        return self.alertActionFactory.createActionWithTitle(cancel.localized, style: .Cancel, handler: nil)
    }

}
