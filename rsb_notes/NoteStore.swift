//
//  NoteStore.swift
//  rsb_notes
//
//  Created by Roman Brazhnikov on 05.06.2018.
//  Copyright © 2018 Roman Brazhnikov. All rights reserved.
//

import UIKit

class NoteStore {
    // all item notes
    var items = [NoteItem]()
    
    /// Creates new random note item and add it to the store
    @discardableResult func createNoteItem() -> NoteItem {
        let newNote = NoteItem(random: true)
        items.append(newNote)
        return newNote
    }
    
}
