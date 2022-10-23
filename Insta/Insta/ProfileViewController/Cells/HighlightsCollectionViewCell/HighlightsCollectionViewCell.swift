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

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Public methods
    
    func configure(model: Highlight) {
        imageView.image = UIImage(named: model.imageName)
        label.text = model.text
    }
}
