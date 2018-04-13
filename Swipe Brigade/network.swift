//
//  network.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/12/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation
import FirebaseDatabase

class network{
    let database: DatabaseReference
    
    init(){
        database = Database.database().reference()
        database.child("username").observe(DataEventType.value){(snapshot)
            in
            print(snapshot.description)
            print(snapshot.value as Any)
        }
    }
}
