//
//  NoteViewController.swift
//  Notes ++
//
//  Created by Shahbaz Alam on 13/11/20.
//  Copyright © 2020 Shahbaz Alam. All rights reserved.
//

import UIKit
import RealmSwift

class NoteViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    let realm = try! Realm()
    var Notes: Note?
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = Notes?.title
        noteTextView.text = Notes?.body
    }

  
    
    @IBAction func deleteBtn(_ sender: UIBarButtonItem) {
        
        do {
            try realm.write {
                realm.delete((Notes)!)
            }
        } catch {
            print("Error found while deleting note \(error)")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
