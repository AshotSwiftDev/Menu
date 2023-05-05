//
//  MenuViewModel.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    
    @Published var productModel: ProductModel
    
    init(productModel: ProductModel){
        self.productModel = productModel
    }
    
    func addnewProduct(){
        persistImageToStorage()
    }
    
    func persistImageToStorage(){
        
        let uid = FirebaseConfig.shared.firestore
            .collection("Products")
            .document().documentID
        let ref = FirebaseConfig.shared.storage.reference(withPath: uid)
        guard let imageData = self.productModel.productImage?.jpegData(compressionQuality: 0.5) else {return}
        ref.putData(imageData, metadata: nil) {metadata, err in
            
            if let err = err{
                print(err)
                return
            }
            ref.downloadURL { url, error in
                if let err = err{
                    print(err)
                    return
                }
                
                guard let url = url else { return }
                self.productInformation(productImage: url)
            }
        }
    }
    
    func productInformation (productImage:  URL){
        
        guard let uid = FirebaseConfig.shared.auth.currentUser?.uid else { return }
        
        let document = FirebaseConfig.shared.firestore.collection("Market")
            .document(uid)
            .collection("Products")
            .document()
        let doc = [
            "productName" : productModel.productName ,
            "productDescription" : productModel.productDescription,
            "productPrice" : productModel.productPrice,
            "productNetto" : productModel.productNetto,
            "productImage": productImage.absoluteString
        ] as [String : Any]
        document.setData(doc) {error in
            if let error = error {
                print("No SetData",  error.localizedDescription)
            }
        }
    }
}
