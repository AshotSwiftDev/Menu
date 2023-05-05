//
//  Menu.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 16.02.23.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var vm = MenuViewModel()
    
    @State var logOut = false
    @State var showAddNewProduct = false
    @State var delet = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        
        NavigationView {
            ZStack (alignment: .bottom){
                TabViewBackground()
                VStack{
                    if vm.productModel.isEmpty{
                        NoProductsView()
                    }else{
                        VStack{
                            HStack{
                                Text("Menu")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                
                                Spacer()
                                Button {
                                    self.showAddNewProduct.toggle()
                                } label: {
                                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                }
                            } .padding(.top, 100)
                                .padding(.horizontal, 8)
                            
                            ScrollView(showsIndicators: false){
                                LazyVGrid(columns: columns) {
                                    ForEach(vm.productModel, id: \.id) {product in
                                        ZStack(alignment: .top){
                                            NavigationLink {
                                                ProductView(image: product.productImage, name: product.productName, description: product.productDescription, netto: product.productNetto, price: product.productPrice)
                                            } label: {
                                                ProductCell(image: product.productImage,name: product.productName, description: product.productDescription,
                                                            netto: product.productNetto,
                                                            price: product.productPrice).padding(.vertical, 4)
                                            }
                                        }
                                    }
                                }
                            }.padding(.bottom, UIScreen.main.bounds.height / 12)
                                .refreshable {
                                    self.vm.getMenu()
                                }
                        }
                    }
                }.padding(.horizontal, 10)
                
            }.fullScreenCover(isPresented: $showAddNewProduct){
                AddNewProduct()
            }.fullScreenCover(isPresented: $logOut) {
                LoginView()
            }
        }
    }
}

struct NoProductsView: View {
    
    @State var showAddNewProduct = false
    var body: some View {
        VStack{
            Text("Sorry")
                .font(.system(size: 40))
                .padding(.top, 100)
            Text("Empty Market")
                .foregroundColor(.red)
                .bold()
                .font(.system(size: 40))
                .padding(.bottom, 60)
            
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.white)
                .font(.system(size: 100))
            VStack{
                HStack{
                    Text("Add Products")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding()
                    Spacer()
                    Button {
                        self.showAddNewProduct.toggle()
                    } label: {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                }.padding(.top, 30)
            }.padding()
            
            Spacer()
        }.fullScreenCover(isPresented: $showAddNewProduct) {
            AddNewProduct()
        }.refreshable {
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
