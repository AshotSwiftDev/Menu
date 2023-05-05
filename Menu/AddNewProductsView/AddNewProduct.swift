//
//  AddNewProduct.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import Foundation
import SwiftUI

@available(iOS 15.0, *)
struct AddNewProduct: View{
    
    @Environment(\.dismiss) var dismiss
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    @State var showToImagePicker = false
    
    @ObservedObject var vm = ProductViewModel(productModel: ProductModel.init(documentId: "", data: ["String" : "Any"]))
    
    var body: some View{
        ZStack {
            BackgroundView()
            ScrollView(showsIndicators: false){
                VStack {
                    HStack{
                        Spacer()
                        Button {
                            dismiss.callAsFunction()
                            
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                    }.padding(.bottom,40)
                        .padding()
                    Text("Add new Producte")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 20))
                    Button {
                        showToImagePicker = true
                    } label: {
                        VStack{
                            if let image = self.vm.productModel.productImage {
                                Image( uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: width - 80 ,height: 160)
                                    .cornerRadius(20)
                            }else{
                                Image(systemName: "photo")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .padding()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Product name")
                            .foregroundColor(.white)
                            .padding(.bottom, -6)
                        HStack{
                            TextField("", text: $vm.productModel.productName)
                                .padding(.leading)
                        }.padding(.vertical, 12)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(12)
                    }.padding(.bottom, 10)
                    
                    VStack(alignment: .leading){
                        Text("Product description")
                            .foregroundColor(.white)
                            .padding(.bottom, -6)
                        HStack{
                            TextField("", text: $vm.productModel.productDescription).padding(.leading)
                        }.padding(.vertical, 12)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(12)
                    }.padding(.bottom, 10)
                    HStack{
                        Text("Product netto")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Spacer()
                        HStack{
                            TextField("", text: $vm.productModel.productNetto)
                                .padding(.leading)
                                .keyboardType(.numberPad)
                        }
                        .padding(.vertical, 12)
                        .frame(width: 120)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(12)
                        .padding(.trailing, 26)
                    }
                    HStack{
                        Text("Please enter a price")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(.bottom, -6)
                        Spacer()
                        HStack{
                            TextField("", text: $vm.productModel.productPrice)
                                .padding(.leading)
                                .keyboardType(.numberPad)
                        }
                        .padding(.vertical, 12)
                        .frame(width: 120)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(12)
                        Text("$")
                            .foregroundColor(.white)
                        
                            .font(.system(size: 30))
                    }
                    if vm.productModel.productName.isEmpty || vm.productModel.productDescription.isEmpty || vm.productModel.productPrice.isEmpty {
                        VStack{
                            Text("Add Product")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                        .frame(width: UIScreen.main.bounds.width - 60, height: 40)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(12)
                        .padding(.top, height / 40)
                    }else{
                        Button {
                            vm.addnewProduct()
                            self.dismiss.callAsFunction()
                        } label: {
                            VStack{
                                Text("Add Product")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                            .frame(width: UIScreen.main.bounds.width - 60, height: 40)
                            .background(Color.buttonColor)
                            .cornerRadius(12)
                            .padding(.top, height / 40)
                        }
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 200)
                }
            }.padding()
                .padding(.top, 20)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showToImagePicker) {
            ImagePicker(image: $vm.productModel.productImage)
        }
    }
}

struct AddNewProduct_Previews: PreviewProvider {
    static var previews: some View {
        
        if #available(iOS 15.0, *) {
            AddNewProduct()
        } else {
            // Fallback on earlier versions
        }
    }
}

