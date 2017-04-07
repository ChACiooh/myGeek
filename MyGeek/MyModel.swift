//
//  MyModel.swift
//  MyGeek
//
//  Created by 표영권 on 2017. 4. 6..
//  Copyright © 2017년 표영권. All rights reserved.
//

import Foundation

class Video {
    let name:String
    var url:String
    init (_ name:String) {
        self.name = name
        url = ""
    }
}

class GameMachine {
    let name:String!
    var numOfItems:Int // 자료 수
    var explanation:String?
    var videos : [Video]?
    
    init (_ name:String) {
        self.name = name
        self.numOfItems = 0
        self.explanation = ""
        // videos = []
    }
    
    convenience init (_ name:String, _ explanation:String) {
        self.init(name)
        self.explanation = explanation
    }
    
    func updateNumOfItems() {
        guard let count = videos?.count else {
            numOfItems = 0
            return
        }
        numOfItems = count
    }
}
