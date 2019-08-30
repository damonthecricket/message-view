//
//  MessageItem.swift
//  MessageView
//
//  Created by Damon Cricket on 30.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import Foundation

struct MessageData {
    
    enum `Type` {
        case input
        case output
    }
    
    let text: String
}
