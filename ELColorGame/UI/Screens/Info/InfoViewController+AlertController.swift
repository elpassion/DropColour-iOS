//
// Created by Mateusz Szklarek on 30/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

extension InfoViewController {

    func presentAlertControllerWithAuthor(author: Author) {
        guard let proffesionUrl = author.proffesionUrl else { return }
        guard let twitterUrl = author.twitterUrl else { return }
        let alertController = alertControllerFactory.createAlertControllerWithTitle("\(author.fullName) \(kShowProfile)", message: nil, preferredStyle: .ActionSheet)
        let proffesionAction = openUrlAlertActionWithTitle(author.type == AuthorType.Developer ? kGithub : kDribbble, url: proffesionUrl)
        let twitterAction = openUrlAlertActionWithTitle(kTwitter, url: twitterUrl)
        let cancelAction = cancelAlertAction()
        alertController.addAction(proffesionAction)
        alertController.addAction(twitterAction)
        alertController.addAction(cancelAction)
        viewControllerPresenter.presentViewController(alertController)
    }

    private func openUrlAlertActionWithTitle(title: String, url: NSURL) -> UIAlertAction {
        return self.alertActionFactory.createActionWithTitle(title, style: .Default) { [weak self] (action) -> () in
            self?.openUrl(url)
        }
    }

    private func cancelAlertAction() -> UIAlertAction {
        return self.alertActionFactory.createActionWithTitle(kCancel, style: .Cancel, handler: nil)
    }

    private func openUrl(url: NSURL) {
        guard UIApplication.sharedApplication().canOpenURL(url) else { return }
        UIApplication.sharedApplication().openURL(url)
    }

}
