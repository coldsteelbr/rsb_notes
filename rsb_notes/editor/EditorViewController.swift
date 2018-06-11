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
    
    var isModified: Bool {
        get {
            let a = (note.content?.isEqual(tv_content.text))!
            let b = (note.title?.isEqual(txt_title.text))!
            
            return !(a && b)
        }
    }
    
    //
    //  Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bSave = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(EditorViewController.saveChanges))
        
        navigationItem.rightBarButtonItems = [bSave]
        navigationItem.backBarButtonItem?.title = "Note"
        navigationItem.title = "Editor"
        
        txt_title.text = note.title
        tv_content.text = note.content
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // showing action sheet dialog TODO
    }
    
    //
    // Logic
    //
    @objc func saveChanges(){
        //print("\(#function)IsModified: \(isModified)")
        note.title = txt_title.text
        note.content = tv_content.text
        //print("\(#function)IsModified: \(isModified)")
    }
    

}
