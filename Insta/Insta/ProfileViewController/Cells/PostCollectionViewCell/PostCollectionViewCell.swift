//
//  PostCollectionViewCell.swift
//  Insta
//
//  Created by Анна Сычева on 22.10.2022.
//

import UIKit

/// Ячейка поста
final class PostCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public methods
    
    func configure(model: Post) {
        imageView.image = UIImage(named: model.imageName)
    }
}
