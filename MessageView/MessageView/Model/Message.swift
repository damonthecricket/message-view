//
//  Message.swift
//  MessageView
//
//  Created by Damon Cricket on 31.08.2019.
//  Copyright © 2019 DC. All rights reserved.
//

import Foundation

class Message {
    
    enum `Type` {
        case incoming
        case outgoing
    }
    
    let text: String
    let type: Type
    
    init(text: String, type: Type) {
        self.text = text
        self.type = type
    }
}
