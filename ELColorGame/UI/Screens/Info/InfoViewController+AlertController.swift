//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

extension InfoViewController {

    func presentAlertControllerWithAuthor(author: Author) {
        let alertController = alertControllerFactory.createAlertControllerWithTitle("\(author.fullName) \(kShowProfile.localized)", message: nil, preferredStyle: .ActionSheet)
        configureProfessionActionIfNeeded(author, alertController: alertController)
        configureTwitterActionIfNeeded(author, alertController: alertController)
        configureCancelActionIfNeeded(author, alertController: alertController)
        presentAlertControllerIfNeeded(author, alertController: alertController)
    }
    
    private func configureProfessionActionIfNeeded(author: Author, alertController: UIAlertController) {
        guard let professionUrl = author.professionUrl else { return }
        guard canOpenUrl(professionUrl) else { return }
        let proffesionAction = openUrlAlertActionWithTitle(author.type == AuthorType.Developer ? kGithub.localized : kDribbble.localized, url: professionUrl)
        alertController.addAction(proffesionAction)
    }
    
    private func configureTwitterActionIfNeeded(author: Author, alertController: UIAlertController) {
        guard let twitterUrl = author.twitterUrl else { return }
        guard canOpenUrl(twitterUrl) else { return }
        let twitterAction = openUrlAlertActionWithTitle(kTwitter.localized, url: twitterUrl)
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
        return canOpenOptionalUrl(author.professionUrl) || canOpenOptionalUrl(author.twitterUrl)
    }

    // MARK: Alert Actions

    private func openUrlAlertActionWithTitle(title: String, url: NSURL) -> UIAlertAction {
        return self.alertActionFactory.createActionWithTitle(title, style: .Default) { [weak self] (action) -> () in
            self?.openUrl(url)
        }
    }

    private func cancelAlertAction() -> UIAlertAction {
        return self.alertActionFactory.createActionWithTitle(kCancel.localized, style: .Cancel, handler: nil)
    }

    // MARK: Open url
    
    private func canOpenOptionalUrl(url: NSURL?) -> Bool {
        guard let url = url else { return false }
        return canOpenUrl(url)
    }
    
    private func canOpenUrl(url: NSURL) -> Bool {
        return UIApplication.sharedApplication().canOpenURL(url)
    }

    private func openUrl(url: NSURL) {
        guard UIApplication.sharedApplication().canOpenURL(url) else { return }
        UIApplication.sharedApplication().openURL(url)
    }

}
