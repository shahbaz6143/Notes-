//
//  Note.swift
//  Notes ++
//
//  Created by Shahbaz Alam on 09/09/20.
//  Copyright © 2020 Shahbaz Alam. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    @objc dynamic var color: String = ""
    @objc dynamic var dateCreated : Date = Date()
    
 
}
