//
//  MessageCollectionViewCell.swift
//  MessageView
//
//  Created by Damon Cricket on 30.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

// MARK: - MessageCollectionViewCell

class MessageCollectionViewCell: UICollectionViewCell {
    
    struct Constants {
        
        static let font = UIFont.systemFont(ofSize: 15.0)
        
        struct Padding {
            static let left: CGFloat = 15.0
            static let right: CGFloat = 15.0
        }
        
        struct Text {
            static let minHeight: CGFloat = 35.0
            static let addition: CGFloat = 20.0
        }
        
        struct Back {
            static let padding: CGFloat = 130.0
        }
    }
    
    @IBOutlet weak var backView: UIView?
    @IBOutlet weak var backViewLeadingConstraint: NSLayoutConstraint?
    @IBOutlet weak var backViewTrailingConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var textView: UITextView?

    // MARK: - Object LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView?.layer.cornerRadius = 15.0
    }
    
    // MARK: - Adjust
    
    func adjust(withData data: Message) {
        textView?.text = data.text
    }
    
    // MARK: - Size
    
    class func size(forData data: Message, width: CGFloat) -> CGSize {
        let textHeight = textSize(forData: data, width: width - Constants.Padding.left - Constants.Padding.right - Constants.Back.padding)
        let height = textHeight
        return CGSize(width: width, height: max(height, Constants.Text.minHeight))
    }
    
    class func textSize(forData data: Message, width: CGFloat) -> CGFloat {
        let txtView: UITextView = UITextView()
        txtView.frame = CGRect(x: 0.0, y: 0.0, width: width, height: .greatestFiniteMagnitude)
        txtView.text = data.text
        txtView.textAlignment = .left
        txtView.font = Constants.font
        return txtView.contentSize.height
    }
}



