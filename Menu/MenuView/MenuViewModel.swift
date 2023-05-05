//
//  MenuViewModel.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//
import CoreData
import Foundation
import Firebase
import FirebaseFirestore


struct GetProductModel: Identifiable, Codable{
    var id: String { documentId }
    let documentId: String
    let productName: String
    let productDescription: String
    let productPrice: String
    let productImage: String
    let productNetto: String

    init(documentId: String,data: [String: Any]){
        self.productName = data["productName"] as? String ?? ""
        self.productDescription = data["productDescription"] as? String ?? ""
        self.productPrice = data["productPrice"] as? String ?? ""
        self.productImage = data["productImage"] as? String ?? ""
        self.productNetto =  data["productNetto"] as? String ?? ""
        self.documentId = documentId
    }
}

class MenuViewModel: ObservableObject{
    @Published var productModel = [GetProductModel]()
    
    init(){
        getMenu()
    }
    
    func getMenu(){
        guard let uid = FirebaseConfig.shared.auth.currentUser?.uid else { return }
        FirebaseConfig.shared.firestore
            .collection("Market")
            .document(uid)
            .collection("Products")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print(error.localizedDescription, "error fetch" )
                    return
                }
                self.productModel.removeAll()
                querySnapshot?.documents.forEach({ queryDocumentSnapshot in
                    
                    let data = queryDocumentSnapshot.data()
                    let docId = queryDocumentSnapshot.documentID
                    
                    print(queryDocumentSnapshot.documentID)
                    self.productModel.append(.init(documentId: docId, data: data))
                })
            }
    }
    
    func deleteItem(index: Int, docId: String){
        productModel.remove(at: index)
        guard let uid = FirebaseConfig.shared.auth.currentUser?.uid else { return }
        FirebaseConfig.shared.firestore
            .collection("Products")
            .document(uid)
            .collection("Market")
            .document(docId).delete { error in
                if let error = error{
                    print(error)
                }
            }
    }
}
