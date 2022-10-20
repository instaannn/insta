//
//  ActionsViewController.swift
//  Insta
//
//  Created by Анна Сычева on 19.10.2022.
//

import UIKit

/// Экран с уведомлениями о действиях
final class ActionsViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let actionPostIdentifier = "ActionPostTableViewCell"
        static let actionSubscribeIdentifier = "ActionSubscribeTableViewCell"
        static let sectionNewTitle = "Новое"
        static let sectionThisWeekTitle = "На этой неделе"
        static let avatarFourImageName = "avatarFour"
        static let avatarFiveImageName = "avatarFive"
        static let avatarThreeImageName = "avatarThree"
        static let userNameCatYay = "cat_yay"
        static let userNameAllyoucaneat = "allyoucaneat"
        static let userNameEmmylee = "emmylee"
        static let userNameLeeviahq = "leeviahq"
        static let subscribeText = "подписался(-ась) на ваши обновления."
        static let likeVideoText = "нравится ваше видео."
        static let likeCommentText = "понравился ваш комментарий: \"Спасибо\""
        static let likeCommentTwoText = "понравился ваш комментарий: \"Красиво!\""
        static let commentPhotoText = "прокомментировал(-а) ваше фото: 💪🏆"
        static let commentPhotoTwoText = "прокомментировал(-а) ваше фото: Привет"
        static let mentionText = "упомянул(-а) вас в комментарии: @emmylee спасибо)"
        static let tenHourText = "10ч."
        static let twelveHourText = "12ч."
        static let fourteenHourText = "14ч."
        static let threeDayText = "3д."
        static let fiveDayText = "5д."
        static let sixDayText = "6д."
        static let sevenDayText = "7д."
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Visual Components
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Private properties
    
    private var newActionContent: [ActionContent] = []
    private var thisWeekContent: [ActionContent] = []
        
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupTableView()
        setupRefreshControl()
    }
    
    // MARK: - Private methods
    
    private func setupTableView() {
        tableView.refreshControl = refreshControl
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refresAction(_:)), for: .valueChanged)
    }
    
    private func registerCells() {
        tableView.register(
            UINib(nibName: Constants.actionPostIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.actionPostIdentifier
        )
        tableView.register(
            UINib(nibName: Constants.actionSubscribeIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.actionSubscribeIdentifier
        )
    }
    
    private func generateItems() -> [ActionsItem] {
        var actionsItem: [ActionsItem] = [ActionsItem]()
        newActionContent = [
            ActionContent(
                userName: Constants.userNameCatYay,
                content: Constants.likeVideoText,
                time: Constants.tenHourText,
                avatarImageName: Constants.avatarFourImageName,
                isButtonCell: false,
                isSubscribe: nil
            ),
            ActionContent(
                userName: Constants.userNameAllyoucaneat,
                content: Constants.likeCommentText,
                time: Constants.tenHourText,
                avatarImageName: Constants.avatarFiveImageName,
                isButtonCell: false,
                isSubscribe: nil
            ),
            ActionContent(
                userName: Constants.userNameEmmylee,
                content: Constants.likeVideoText,
                time: Constants.twelveHourText,
                avatarImageName: Constants.avatarThreeImageName,
                isButtonCell: false,
                isSubscribe: nil
            ),
            ActionContent(
                userName: Constants.userNameAllyoucaneat,
                content: Constants.subscribeText,
                time: Constants.fourteenHourText,
                avatarImageName: Constants.avatarThreeImageName,
                isButtonCell: true,
                isSubscribe: true
            )
        ]
        actionsItem.append(.newContent(items: newActionContent))
        
        thisWeekContent = [
            ActionContent(
                userName: Constants.userNameEmmylee,
                content: Constants.subscribeText,
                time: Constants.threeDayText,
                avatarImageName: Constants.avatarFiveImageName,
                isButtonCell: true,
                isSubscribe: false
            ),
            ActionContent(
                userName: Constants.userNameAllyoucaneat,
                content: Constants.likeCommentTwoText,
                time: Constants.threeDayText,
                avatarImageName: Constants.avatarFiveImageName,
                isButtonCell: false,
                isSubscribe: nil
            ),
            ActionContent(
                userName: Constants.userNameLeeviahq,
                content: Constants.subscribeText,
                time: Constants.fiveDayText,
                avatarImageName: Constants.avatarThreeImageName,
                isButtonCell: true,
                isSubscribe: true
            ),
            ActionContent(
                userName: Constants.userNameEmmylee,
                content: Constants.commentPhotoText,
                time: Constants.sixDayText,
                avatarImageName: Constants.avatarThreeImageName,
                isButtonCell: false,
                isSubscribe: nil
            ),
            ActionContent(
                userName: Constants.userNameCatYay,
                content: Constants.mentionText,
                time: Constants.sixDayText,
                avatarImageName: Constants.avatarFiveImageName,
                isButtonCell: false,
                isSubscribe: nil
            ),
            ActionContent(
                userName: Constants.userNameAllyoucaneat,
                content: Constants.commentPhotoTwoText,
                time: Constants.sevenDayText,
                avatarImageName: Constants.avatarFourImageName,
                isButtonCell: false,
                isSubscribe: nil
            )
        ]
        actionsItem.append(.thisWeekContent(items: thisWeekContent))
        
        return actionsItem
    }
    
    @objc private func refresAction(_ sender: Any) {
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDelegate

extension ActionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = .label
        header?.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        header?.textLabel?.text = header?.textLabel?.text?.capitalized
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
}

// MARK: - UITableViewDataSource

extension ActionsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = generateItems()[section]
        switch item {
        case .newContent:
            return newActionContent.count
        case .thisWeekContent:
            return thisWeekContent.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let actionSubscribeCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.actionSubscribeIdentifier,
            for: indexPath
        ) as? ActionSubscribeTableViewCell else { return UITableViewCell() }
        guard let actionPostCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.actionPostIdentifier,
            for: indexPath
        ) as? ActionPostTableViewCell else { return UITableViewCell() }
        let actionsItem = generateItems()[indexPath.section]
        switch actionsItem {
        case let .newContent(items):
            let item = items[indexPath.row]
            if item.isButtonCell {
                actionSubscribeCell.configure(model: item)
                return actionSubscribeCell
            } else {
                actionPostCell.configure(model: item)
                return actionPostCell
            }
        case let .thisWeekContent(items):
            let item = items[indexPath.row]
            if item.isButtonCell {
                actionSubscribeCell.configure(model: item)
                return actionSubscribeCell
            } else {
                actionPostCell.configure(model: item)
                return actionPostCell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Constants.sectionNewTitle
        case 1:
            return Constants.sectionThisWeekTitle
        default:
            return Constants.sectionNewTitle
        }
    }
}
