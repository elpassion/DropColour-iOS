import UIKit

class GameViewController: UIViewController {

    let tracker: TrackerProtocol

    init(tracker: TrackerProtocol) {
        self.tracker = tracker
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(GameViewController.applicationWillResignActive),
                                               name: NSNotification.Name.UIApplicationWillResignActive,
                                               object: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: Application state

    func applicationWillResignActive() {
        game?.pause()
    }

    // MARK: View

    override func loadView() {
        let view = GameView()
        view.delegate = self
        self.view = view
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tracker.trackScreenWithName(screenName: "GameViewController")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGameIfNeeded()
    }

    // MARK: Game

    var game: Game?

    private func setupGameIfNeeded() {
        guard self.game == nil else { return }
        guard let gameView = view as? GameView else { return }
        let boardView = createGameBoardView(gameView: gameView)
        gameView.boardView = boardView
        let game = Game(boardSize: BoardSize(columns: boardView.columns, rows: boardView.rows))
        game.delegate = self
        self.game = game
        game.start()
    }

    private func createGameBoardView(gameView: GameView) -> GameBoardView {
        let slotSize = CGSize(width: 44, height: 44)
        let spacing: CGFloat = 15.5
        let boardSize = gameView.boardContainerView.frame.size
        let (rows, columns) = GameBoardView.maxBoardSize(forViewSize: boardSize, slotSize: slotSize, spacing: spacing)
        return GameBoardView(slotSize: slotSize, rows: rows, columns: columns, spacing: spacing)
    }

}
