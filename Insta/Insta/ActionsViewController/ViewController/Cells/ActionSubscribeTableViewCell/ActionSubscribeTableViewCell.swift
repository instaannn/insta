//
//  ActionSubscribeTableViewCell.swift
//  Insta
//
//  Created by Анна Сычева on 19.10.2022.
//

import UIKit

/// Ячейка с кнопкой
final class ActionSubscribeTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var subscribeButton: UIButton!
    @IBOutlet private weak var youSubscribedButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public methods
    
    func configure(model: ActionContent) {
        contentLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.userName) ")
            .normal("\(model.content) ")
            .normalGray("\(model.time)")
        avatarImageView.image = UIImage(named: model.avatarImageName)
        if model.isSubscribe ?? true {
            subscribeButton.isHidden = true
            youSubscribedButton.isHidden = false
        } else {
            subscribeButton.isHidden = false
            youSubscribedButton.isHidden = true
        }
    }
}
