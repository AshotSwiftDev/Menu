//
//  FirebaseConfig.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import Foundation
import Firebase
import FirebaseStorage

class FirebaseConfig: NSObject{
    let auth: Auth
    let firestore: Firestore
    let storage: Storage
    static let shared = FirebaseConfig()
    override init(){
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        self.storage = Storage.storage()
        super.init()
    }
}
