//
//  EditorViewController.swift
//  rsb_notes
//
//  Created by Roman Brazhnikov on 11.06.2018.
//  Copyright © 2018 Roman Brazhnikov. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {
    @IBOutlet var txt_title: UITextField!
    @IBOutlet var tv_content: UITextView!
    
    /// incoming note item
    var note: NoteItem!
    
    //
    //  Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txt_title.text = note.title
        tv_content.text = note.content
    }
    
}
