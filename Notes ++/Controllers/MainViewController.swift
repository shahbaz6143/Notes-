//
//  ViewController.swift
//  Notes ++
//
//  Created by Shahbaz Alam on 08/09/20.
//  Copyright © 2020 Shahbaz Alam. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
 
class MainViewController: UIViewController {
    
    @IBOutlet weak var NotesTableView: UITableView!
    
    let realm = try! Realm()
    var notes: Results<Note>?
   
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotesTableView.delegate = self
        NotesTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        notes = realm.objects(Note.self)
        NotesTableView.reloadData()
        
        guard let navBar = navigationController?.navigationBar else {fatalError() }
 
        navBar.tintColor = UIColor.black
        
    }
}


 
extension MainViewController: UITableViewDelegate , UITableViewDataSource {
    
    
    //MARK:- Data source Method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! NoteTableViewCell
        cell.titleLabel?.text = notes?[indexPath.row].title
        cell.bodyLabel.text = notes?[indexPath.row].body
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        cell.dateLabel.text = dateFormatter.string(from: (notes?[indexPath.row].dateCreated)!)
        
        if let colour = UIColor(hexString: "56a69e")!.darken(byPercentage: CGFloat(indexPath.row) / CGFloat(notes!.count))
        {
            cell.backgroundColor = colour
            cell.titleLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.bodyLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.dateLabel.textColor = ContrastColorOf(colour, returnFlat: true)
        }
        return cell
    }

 
    
    //MARK:- Delegate Method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NoteViewSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NoteViewSegue" {
            let addNoteVc: NoteViewController = segue.destination as! NoteViewController
            addNoteVc.Notes = notes?[NotesTableView.indexPathForSelectedRow!.row]
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            do {
                try realm.write {
                    realm.delete(notes![indexPath.row])
                    NotesTableView.deleteRows(at: [indexPath], with: .fade)
                    NotesTableView.reloadData()

                }
            } catch {
                print("Error found while deleting note \(error)")
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 1.0) {
            
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    }
    

