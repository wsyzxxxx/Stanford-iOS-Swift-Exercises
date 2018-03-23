//
//  Card.swift
//  Concentration
//
//  Created by 薛伟 on 2018/3/21.
//  Copyright © 2018年 Will. All rights reserved.
//

import Foundation


struct Card
{
    var isFaceUp = false
    var isMathced = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
