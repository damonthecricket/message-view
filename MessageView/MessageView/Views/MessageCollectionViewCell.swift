//
//  MessageCollectionViewCell.swift
//  MessageView
//
//  Created by Damon Cricket on 30.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

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
    }
    
    
    @IBOutlet weak var backView: UIView?
    @IBOutlet weak var backViewLeadingConstraint: NSLayoutConstraint?
    @IBOutlet weak var backViewTrailingConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var textView: UITextView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView?.layer.cornerRadius = 15.0
        
        textView?.isScrollEnabled = false
        textView?.textAlignment = .natural
    }
    
    func adjust(withData data: Message) {
        textView?.text = data.text
        
        var topCorrection = (bounds.size.height - textView!.contentSize.height*textView!.zoomScale)/2.0
        topCorrection = max(0.0, topCorrection)
        textView?.contentInset = UIEdgeInsets(top: topCorrection, left: 0.0, bottom: 0.0, right: 0.0)
    }

    class func size(forData data: Message, width: CGFloat) -> CGSize {
        let textHeight = textViewHeight(forData: data, width: width - Constants.Padding.left - Constants.Padding.right)
        let height = textHeight + Constants.Text.addition //+ Constants.Margin.top + Constants.Margin.bottom
        return CGSize(width: width, height: max(height, Constants.Text.minHeight))
    }
    
    class func textViewHeight(forData data: Message, width: CGFloat) -> CGFloat {
        return (data.text as NSString).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                                    options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                    attributes: [NSAttributedStringKey.font: Constants.font], context: nil).integral.size.height
    }
}



