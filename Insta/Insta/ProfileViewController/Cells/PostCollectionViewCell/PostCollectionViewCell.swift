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
    
    @IBOutlet private weak var postImageView: UIImageView!
    
    // MARK: - Public methods
    
    func configure(model: Post) {
        postImageView.image = UIImage(named: model.imageName)
    }
}
