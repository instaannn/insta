//
//  HighlightsTableViewCell.swift
//  Insta
//
//  Created by Анна Сычева on 22.10.2022.
//

import UIKit

/// Ячейка с коллекцией историй
final class HighlightsTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let oneImageName = "one"
        static let twoImageName = "two"
        static let threeImageName = "three"
        static let fourImageName = "four"
        static let fiveImageName = "five"
        static let sixImageName = "six"
        static let sevenImageName = "seven"
        static let highlightsCellIdentifier = "HighlightsCollectionViewCell"
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private Properties
    
    private let items: [Highlight] = [
        Highlight(imageName: Constants.oneImageName, text: Constants.oneImageName),
        Highlight(imageName: Constants.twoImageName, text: Constants.twoImageName),
        Highlight(imageName: Constants.threeImageName, text: Constants.threeImageName),
        Highlight(imageName: Constants.fourImageName, text: Constants.fourImageName),
        Highlight(imageName: Constants.fiveImageName, text: Constants.fiveImageName),
        Highlight(imageName: Constants.sixImageName, text: Constants.sixImageName),
        Highlight(imageName: Constants.sevenImageName, text: Constants.sevenImageName)
    ]

    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }
    
    // MARK: - Private Methods
    
    private func setupCollection() {
        collectionView.register(
            UINib(nibName: Constants.highlightsCellIdentifier, bundle: nil),
            forCellWithReuseIdentifier: Constants.highlightsCellIdentifier
        )
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension HighlightsTableViewCell: UICollectionViewDataSource {
    
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
            withReuseIdentifier: Constants.highlightsCellIdentifier,
            for: indexPath
        ) as? HighlightsCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(model: items[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HighlightsTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 70, height: 90)
    }
}
