//
//  NewNoteViewController.swift
//  Notes ++
//
//  Created by Shahbaz Alam on 08/09/20.
//  Copyright © 2020 Shahbaz Alam. All rights reserved.
//

import UIKit
import RealmSwift

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
 
    let realm = try! Realm()
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveNote(_ sender: UIBarButtonItem) {
        
         
        if let titleText = titleTextField.text, let bodyText = noteTextView.text , titleText != "", bodyText != "" {
                
            realm.beginWrite()
            let newNote = Note()
            newNote.title = titleText
            newNote.body = bodyText
            newNote.dateCreated = Date()
            realm.add(newNote)
            try! realm.commitWrite()
            
            self.navigationController?.popViewController(animated: true)
        }
            
        else {
            print("Error found while saving new note")
        }
    }
        
 }
