//
//  HomeViewController.swift
//  Insta
//
//  Created by Анна Сычева on 17.10.2022.
//

import UIKit

/// Экран постов
final class HomeViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let storiesIdentifier = "StoriesCell"
        static let postIdentifier = "PostCell"
        static let recommendationIdentifier = "RecommendationCell"
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Visual Components
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Private properties
    
    private let items: [InstaItem] = [InstaItem]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefreshControl()
    }
    
    // MARK: - Public methods
    
    // MARK: - IBAction
    
    // MARK: - Private methods
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refresAction(_:)), for: .valueChanged)
    }
    
    private func generateItems() -> [InstaItem] {
        var instaItems: [InstaItem] = [InstaItem]()
        instaItems.append(InstaItem.stories)
        instaItems.append(InstaItem.post)
        instaItems.append(InstaItem.recommendation)
        instaItems.append(InstaItem.post)
        instaItems.append(InstaItem.post)
        return instaItems
    }
    
    @objc private func refresAction(_ sender: Any) {
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate { }

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return generateItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = generateItems()[indexPath.row]
        switch item {
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storiesIdentifier, for: indexPath)
            return cell
        case .post:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifier, for: indexPath)
            return cell
        case .recommendation:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recommendationIdentifier,
                for: indexPath
            )
            return cell
        }
    }
}
