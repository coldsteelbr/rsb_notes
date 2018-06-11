//
//  DetailViewController.swift
//  rsb_notes
//
//  Created by Roman Brazhnikov on 11.06.2018.
//  Copyright © 2018 Roman Brazhnikov. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentText: UITextView!
    
    /// incoming note item
    var note: NoteItem!
    
    //
    //  Life cycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bEdit = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(NoteViewController.showInEditor))
        navigationItem.rightBarButtonItems = [bEdit]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = note.title
        contentText.text = note.content
    }
    //
    // Logic
    //
    
    @objc func showInEditor(){
        print("\(#function): \(note?.title ?? "--")")
        performSegue(withIdentifier: "ShowInEditor", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editorVC = segue.destination as! EditorViewController
        editorVC.note = note
    }
}
