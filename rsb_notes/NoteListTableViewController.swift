//
//  NoteListTableViewController.swift
//  rsb_notes
//
//  Created by Roman Brazhnikov on 05.06.2018.
//  Copyright © 2018 Roman Brazhnikov. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController{
    let THE_ONLY_SECTION_NUMBER = 0
    var noteItemStore: NoteStore!
    
    
    /// Turns on and off the edtting mode
    @IBAction func toggleEditingMode(_ sender: UIBarButtonItem) {
        // Editting mode?
        if isEditing {
            // turning off
            setEditing(false, animated: true)
        } else {
            // turning on
            setEditing(true, animated: true)
        }
    }
    
    /// Adds new note
    @IBAction func addNewNote(_ sender: UIBarButtonItem) {
        // creating new note item
        let newNote = noteItemStore.createNoteItem()
        
        // getting new item's index in the array
        if let index = noteItemStore.items.index(of: newNote) {
            // getting position to insert
            let indexPath = IndexPath(row: index, section: THE_ONLY_SECTION_NUMBER)
            
            // Inserting new cell
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    //
    // UITableViewDataSource protocol's methods
    //
    
    /// Returns count of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteItemStore.items.count
    }
    
    /// Returns reusable UITableViewCell
    /// populated with data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // creating an instance of UITableViewCell
        let cell =  tableView.dequeueReusableCell(withIdentifier: "StandardCell", for: indexPath)
        
        // getting appropriate item
        let item = noteItemStore.items[indexPath.row]
        
        // populating fields of the cell
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.content
        
        // returning the set cell
        return cell
    }
    
    /// Deletes item cell from the table view
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //
        //  Building "Remove" action
        //
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Remove") {
            (action, indexPath) in
            
            // getting item
            let itemToRemove = self.noteItemStore.items[indexPath.row]
            
            //
            // building action sheet
            //
            let alertTitle = "Delete \(itemToRemove.title ?? "the item" )?"
            let alertMessage = "Are you sure you want to delete this note?"
            let ac = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet)
            
            // adding actions...
            // ...delete
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) {
                (action) -> Void in
                // removing item
                self.noteItemStore.removeItem(itemToRemove)
                
                // removing UI cell from the table view
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            ac.addAction(deleteAction)
            
            // ... cancel
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            // showing the alert dialog
            self.present(ac, animated: true, completion: nil)
            
        }
        
        return [deleteAction]
    }
    
    
    
    
    
    
    
    
}
