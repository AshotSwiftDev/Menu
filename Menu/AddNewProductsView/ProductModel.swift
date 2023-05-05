//
//  ProductModel.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import Foundation
import SwiftUI


struct ProductModel: Identifiable{
    var id: String { documentId }
    var documentId: String
    var productName: String
    var productDescription: String
    var productPrice: String
    var productNetto: String
    var productImage: UIImage?
    
    init(documentId: String,data: [String: Any]) {
        self.productName = data["productName"] as? String ?? ""
        self.productDescription = data["productDescription"] as? String ?? ""
        self.productPrice = data["productPrice"] as? String ?? ""
        self.productNetto = data["productNetto"] as? String ?? ""
        self.documentId = documentId
    }
}




