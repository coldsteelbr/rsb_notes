//
//  NoteItem.swift
//  rsb_notes
//
//  Created by Roman Brazhnikov on 05.06.2018.
//  Copyright © 2018 Roman Brazhnikov. All rights reserved.
//

import UIKit

let titles =   ["My note","Holiday","Diary","ToDo list","Shopping","",]
let contents = ["Single line",
                """
                Some multi line text
                to demonstrate the work
                of the app and short desc-
                ription.
                """,
                "1. Make the list. Check.",
                "Shoes",
                "Birthday party is on Sunday, yeah! Let's party!",
                "Just another boring note about a gray rainy day...",
                "",]

class NoteItem: NSObject {
    var title: String
    var content: String
    var dateChanged: Date
    var unique: String?
    var _id: Int64 = 0
    
    init(title: String, content: String, unique: String?, _id: Int64){
        self.title = title
        self.content = content
        self.dateChanged = Date()
        self.unique = unique
        self._id = _id
    }
    
    /// Generates a note with randomly populated fields
    convenience init(random: Bool = false){
        if random {
            // random title
            var index = arc4random_uniform(UInt32(titles.count))
            let randTitle = titles[Int(index)]
            
            // random content
            index = arc4random_uniform(UInt32(contents.count))
            let randContent = contents[Int(index)]
            
            // random UUID
            let randUUID = UUID().uuidString.components(separatedBy: "-").first!
            
            // compiling
            self.init(title: randTitle, content: randContent, unique: randUUID, _id: 0)
        } else {
            // empty note
            self.init(title: "", content: "", unique: nil, _id: 0)
        }
    }
}
