//
//  NoteListTableViewController.swift
//  rsb_notes
//
//  Created by Roman Brazhnikov on 05.06.2018.
//  Copyright © 2018 Roman Brazhnikov. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController{
    
    var noteItemStore: NoteStore!
    
    
    
    @IBAction func toggleEditingMode(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func addNewNote(_ sender: UIBarButtonItem) {
    }
    
    //
    // UITableViewDataSource protocol's methods
    //
    
    /// count of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteItemStore.items.count
    }
    
    /// returns reusable UITableViewCell
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
    
    
}
