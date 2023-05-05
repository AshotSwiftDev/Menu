//
//  LogInView.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 17.02.23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @StateObject var vm = LoginViewModel(authMadel: AuthModel(), userModel: UserModel(id: "", data: ["":""]))
    @State var logIn = true
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                ScrollView{
                    HStack{
                        Text( logIn ? "Log In" : "Sign In")
                            .font(.system(size: 36))
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            logIn.toggle()
                        } label: {
                            Text( logIn ? "Create ccount! " : "Log in")
                        }
                    }.padding()
                    VStack(alignment: .leading){
                        if !logIn{
                            VStack(spacing: 12){
                                HStack(spacing: 0){
                                    TextField("Name", text: $vm.userModel.name).padding(.leading)
                                }.padding(.vertical, 14)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(16)
                                HStack(spacing: 0){
                                    TextField("Subject Name", text: $vm.userModel.subjectName).padding(.leading)
                                }.padding(.vertical, 14)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(16)
                                HStack(spacing: 0){
                                    TextField("Subject Address", text: $vm.userModel.subjectAddress).padding(.leading)
                                }.padding(.vertical, 14)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(16)
                                HStack(spacing: 0){
                                    Text("Phone").foregroundColor(.white)
                                    Text("+ 374").padding(.trailing)
                                        .foregroundColor(.white)
                                        .font(.system(size: 28))
                                        .padding(.leading, 40)
                                    
                                    if vm.userModel.number.count < 8 ||
                                        vm.userModel.number.count > 8 {
                                    HStack(spacing: 0){
                                       
                                            TextField("Phone Number", text: $vm.userModel.number)
                                            .foregroundColor(.red)
                                            .padding(.leading)
                                                .keyboardType(.numberPad)
                                        if vm.userModel.number != ""{
                                            Image(systemName: "xmark")
                                                .foregroundColor(.red)
                                                .padding(.trailing)
                                        }
                                        }.padding(.vertical, 14)
                                            .background(Color.white.opacity(0.8))
                                            .cornerRadius(16)
                                    } else {
                                        HStack(spacing: 0){
                                        TextField("Phone Number", text: $vm.userModel.number)
                                                .foregroundColor(.green)
                                                .padding(.leading)
                                            .keyboardType(.numberPad)
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.green)
                                                .foregroundColor(.red)
                                                .padding(.trailing)
                                    }.padding(.vertical, 14)
                                        .background(Color.white.opacity(0.8))
                                        .cornerRadius(16)
                                    }
                                }
                            }
                            Text("Email")
                                .padding(.bottom, -6)                                .foregroundColor(.white)
                            HStack(spacing: 0){
                                TextField("", text: $vm.authMadel.email).padding(.leading)
                                
                            }.padding(.vertical, 14)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(16)
                            Text("Pasword")
                                .padding(.bottom, -6)
                                .foregroundColor(.white)
                            HStack(spacing: 0){
                                SecureField("", text: $vm.authMadel.password).padding(.leading)
                            }.padding(.vertical, 14)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(16)
                        }else{
                            Text("Email")
                                .padding(.bottom, -6)
                                .foregroundColor(.white)
                            HStack(spacing: 0){
                                TextField("", text: $vm.authMadel.email).padding(.leading)
                            }.padding(.vertical, 14)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(16)
                            Text("Pasword")
                                .padding(.bottom, -6)
                                .foregroundColor(.white)
                            HStack(spacing: 0){
                                SecureField("", text: $vm.authMadel.password).padding(.leading)
                                
                            }.padding(.vertical, 14)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(16)
                        }
                    }.padding()
                    if self.vm.authMadel.email.isEmpty || self.vm.authMadel.password.isEmpty {
                        VStack{
                            HStack{
                                Text(logIn ? "Log In" : "Add Subject")
                                    .foregroundColor(.white)
                            }.padding()
                                .frame(width: 160, height: 50)
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(18)
                        }
                    } else {
                        
                        Button {
                            if  logIn {
                                self.vm.logIn()
                            } else {
                                self.vm.creatAccount()
                            }
                        } label: {
                            HStack{
                                Text(logIn ? "Log In" : "Add Subject")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 160, height: 50)
                                .background(Color.buttonColor)
                                .cornerRadius(18)
                        }.padding(.top, 20)
                    }
                    if !logIn {
                        Rectangle().foregroundColor(.clear).frame(height: UIScreen.main.bounds.height / 4)
                    }
                }.padding(.top, 80)
            }
        }.fullScreenCover(isPresented: $vm.userModel.isLogined) {
            MyTabView()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        //        WelcomeView(vm: LoginViewModel(userModel: UserModel(id: "", data: ["String" : "Any"])))
        LoginView()
    }
}
