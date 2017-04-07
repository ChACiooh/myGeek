//
//  MyModel.swift
//  MyGeek
//
//  Created by 표영권 on 2017. 4. 6..
//  Copyright © 2017년 표영권. All rights reserved.
//

import Foundation
/*
enum GameMachinNames {
    case IIDX, SDVX
}
 */
let IIDX = 0
let SDVX = 1


class Video {
    let name:String
    var url:String?
    init (_ name:String, url:String?) {
        self.name = name
        self.url = url
    }
}

class GameMachine {
    let name:String!
    var numOfItems:Int // 자료 수
    var explanation:String?
    var videos : [Video]?
    let type:Int
    
    init (_ name:String, type:Int) {
        self.name = name
        self.numOfItems = 0
        self.explanation = ""
        self.type = type
        // videos = []
    }
    
    convenience init (_ name:String, type:Int, _ explanation:String) {
        self.init(name, type: type)
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
