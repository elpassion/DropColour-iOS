import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {

    private weak var delegate: MenuViewControllerDelegate?
    let tracker: TrackerProtocol

    init(delegate: MenuViewControllerDelegate?, tracker: TrackerProtocol) {
        self.delegate = delegate
        self.tracker = tracker
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = MenuView(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "MenuViewController")
    }

    // MARK: MenuViewDelegate

    func menuViewDidTapResume(_ menuView: MenuView) {
        dismiss(animated: true) {
            self.delegate?.menuViewControllerDidResumeGame(self)
        }
    }

    func menuViewDidTapNewGame(_ menuView: MenuView) {
        dismiss(animated: true) {
            self.delegate?.menuViewControllerDidTapNewGame(self)
        }
    }

    func menuViewDidTapQuit(_ menuView: MenuView) {
        dismiss(animated: true) {
            self.delegate?.menuViewControllerDidTapQuit(self)
        }
    }

}

// MARK: - Delegate

protocol MenuViewControllerDelegate: class {
    func menuViewControllerDidResumeGame(_ menuViewController: MenuViewController)
    func menuViewControllerDidTapNewGame(_ menuViewController: MenuViewController)
    func menuViewControllerDidTapQuit(_ menuViewController: MenuViewController)
}
