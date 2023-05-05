//
//  ProfileViewModel.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 20.02.23.
//

import Foundation

class ProfileViewModel: ObservableObject{
    
    @Published var profileModel: ProfileModel?
    @Published var isLogined = false
    
    init(profileModel: ProfileModel) {
        self.profileModel = profileModel
        getprofile()
    }
    
    func logOut() {
        self.isLogined = true
        try?  FirebaseConfig.shared.auth.signOut()
    }
    
    func getprofile() {
        guard let uid = FirebaseConfig.shared.auth.currentUser?.uid else { return }
        let document = FirebaseConfig.shared.firestore.collection("Users")
            .document(uid)
            .collection("user")
        document.addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error.localizedDescription, "error fetch" )
                    return
                }
                querySnapshot?.documents.forEach({ queryDocumentSnapshot in
                    let data = queryDocumentSnapshot.data()
                    print(data.description)
                    let email = data["email"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let subjectName = data["subjectName"] as? String ?? ""
                    let number = data["number"] as? String ?? ""
                    let subjectAddress = data["subjectAddress"] as? String ?? ""
                    let uid = data["uid"] as? String ?? ""
                    self.profileModel = ProfileModel(uid: uid, email: email, name: name, subjectName: subjectName, number: number, subjectAddress: subjectAddress)
                    
                })
            }
    }
}
