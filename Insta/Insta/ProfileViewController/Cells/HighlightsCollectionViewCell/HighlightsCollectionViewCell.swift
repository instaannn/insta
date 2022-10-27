//
//  HighlightsCollectionViewCell.swift
//  Insta
//
//  Created by Анна Сычева on 22.10.2022.
//

import UIKit

/// Ячейка для актуальной истории
final class HighlightsCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlet

    @IBOutlet private weak var highlightImageView: UIImageView!
    @IBOutlet private weak var highlightLabel: UILabel!

    // MARK: - Public methods
    
    func configure(highlight: Highlight) {
        highlightImageView.image = UIImage(named: highlight.imageName)
        highlightLabel.text = highlight.text
    }
}
