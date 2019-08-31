//
//  MessageCollectionViewCell.swift
//  MessageView
//
//  Created by Damon Cricket on 30.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

class MessageCollectionViewCell: UICollectionViewCell {
    
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
        return CGSize(width: width, height: textViewHeight(forData: data, width: width))
    }
    
    class func textViewHeight(forData data: Message, width: CGFloat) -> CGFloat {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left

        return (data.text as NSString).boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15), NSAttributedStringKey.paragraphStyle: paragraph], context: nil).integral.size.height
    }
}



