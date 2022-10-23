//
//  ProfileViewController.swift
//  Insta
//
//  Created by Анна Сычева on 21.10.2022.
//

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
    func presentPopUpView(imageName: String)
}

/// Экран выбранного профиля
final class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let highlightsCellIdentifier = "HighlightsTableViewCell"
        static let postsCellIdentifier = "PostsTableViewCell"
        static let profileCellIdentifier = "ProfileAvatarCell"
        static let profileBioCellIdentifier = "ProfileBioCell"
    }

    // MARK: - IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private var blurView: UIVisualEffectView!
    @IBOutlet private var popUpView: UIView!
    @IBOutlet private weak var selectImageView: UIImageView!
    
    // MARK: - Visual Components
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefreshControl()
        setupPopUpView()
    }
    
    // MARK: - Private methods
    
    private func setupPopUpView() {
        blurView.bounds = view.bounds
        popUpView.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        popUpView.layer.cornerRadius = 15
        popUpView.clipsToBounds = true
    }
    
    private func animateIn(desiredView: UIView) {
        let background = view
        background?.addSubview(desiredView)
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = background?.center ?? CGPoint(x: 0, y: 0)
        
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })
    }
    
    private func animateOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }, completion: { _ in
            desiredView.removeFromSuperview()
        })
    }
    
    private func setupTableView() {
        tableView.refreshControl = refreshControl
        tableView.register(
            UINib(nibName: Constants.highlightsCellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.highlightsCellIdentifier
        )
        tableView.register(
            UINib(nibName: Constants.postsCellIdentifier, bundle: nil),
            forCellReuseIdentifier: Constants.postsCellIdentifier
        )
    }
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refresAction(_:)), for: .valueChanged)
    }
    
    private func generateItems() -> [ProfileItem] {
        var profileItems: [ProfileItem] = [ProfileItem]()
        profileItems.append(ProfileItem.profileAvatar)
        profileItems.append(ProfileItem.profileBio)
        profileItems.append(ProfileItem.highlights)
        profileItems.append(ProfileItem.posts)
        return profileItems
    }
    
    @objc private func refresAction(_ sender: Any) {
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        generateItems().count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let item = generateItems()[indexPath.row]
        switch item {
        case .profileAvatar:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileCellIdentifier
            ) else { return UITableViewCell() }
            return cell
        case .profileBio:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileBioCellIdentifier
            ) else { return UITableViewCell() }
            return cell
        case .highlights:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.highlightsCellIdentifier
            ) as? HighlightsTableViewCell else { return UITableViewCell() }
            return cell
        case .posts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postsCellIdentifier
            ) as? PostsTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension  ProfileViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - ProfileViewControllerDelegate

extension ProfileViewController: ProfileViewControllerDelegate {
    
    func presentPopUpView(imageName: String) {
        animateIn(desiredView: blurView)
        animateIn(desiredView: popUpView)
        selectImageView.image = UIImage(named: imageName)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateOut(desiredView: self.blurView)
            self.animateOut(desiredView: self.popUpView)
        }
    }
}
