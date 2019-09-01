//
//  UITextView+Extensions.swift
//  MessageView
//
//  Created by Damon Cricket on 01.09.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import UIKit

extension UITextView {
    
    func centerVerticaly() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height*zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}

