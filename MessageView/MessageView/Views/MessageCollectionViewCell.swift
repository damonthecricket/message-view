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

        struct Margin {
            static let top: CGFloat = 10.0
            static let bottom: CGFloat = 10.0
        }
        
        struct Text {
            static let minHeight: CGFloat = 50.0
            static let addition: CGFloat = 18.0
        }
    }
    
    
    @IBOutlet weak var backView: UIView?
    @IBOutlet weak var textView: UITextView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView?.layer.cornerRadius = 15.0
    }
    
    func adjust(withData data: Message) {
        textView?.text = data.text
    }

    class func size(forData data: Message, width: CGFloat) -> CGSize {
        let textHeight = textViewHeight(forData: data, width: width)
        let height = textHeight + Constants.Margin.top + Constants.Margin.bottom + Constants.Text.addition
        return CGSize(width: width, height: max(height, Constants.Text.minHeight))
    }
    
    class func textViewHeight(forData data: Message, width: CGFloat) -> CGFloat {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left

        return (data.text as NSString).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedStringKey.font: Constants.font, NSAttributedStringKey.paragraphStyle: paragraph], context: nil).integral.size.height
    }
}



