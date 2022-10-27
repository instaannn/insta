//
//  PostsTableViewCell.swift
//  Insta
//
//  Created by Анна Сычева on 22.10.2022.
//

import UIKit

/// Ячейка с постами
final class PostsTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let oneImageName = "one"
        static let twoImageName = "two"
        static let threeImageName = "three"
        static let fourImageName = "four"
        static let fiveImageName = "five"
        static let sixImageName = "six"
        static let sevenImageName = "seven"
        static let postCellIdentifier = "PostCollectionViewCell"
    }
    
    // MARK: - IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Public Properties
    
    weak var delegate: ProfileViewControllerDelegate?
    
    // MARK: - Private Properties
    
    private let items: [Post] = [
        Post(imageName: Constants.oneImageName),
        Post(imageName: Constants.twoImageName),
        Post(imageName: Constants.threeImageName),
        Post(imageName: Constants.fourImageName),
        Post(imageName: Constants.fiveImageName),
        Post(imageName: Constants.sixImageName),
        Post(imageName: Constants.sevenImageName)
    ]
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }
    
    // MARK: - Private Methods
    
    private func setupCollection() {
        collectionView.register(
            UINib(nibName: Constants.postCellIdentifier, bundle: nil),
            forCellWithReuseIdentifier: Constants.postCellIdentifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension PostsTableViewCell: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.postCellIdentifier,
            for: indexPath
        ) as? PostCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.presentPopUpView(imageName: items[indexPath.row].imageName)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PostsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 124, height: 124)
    }
}
