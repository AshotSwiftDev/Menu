//
//  ProfileView.swift
//  Menu
//
//  Created by Ashot Kirakosyan on 20.02.23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var vm = ProfileViewModel(profileModel: ProfileModel(uid: "", email: "", name: "", subjectName: "", number: "", subjectAddress: ""))
    var body: some View {
        ZStack{
            TabViewBackground()
            VStack{
                Text("Administrator profile")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
                VStack(alignment: .leading, spacing: 30){
                    HStack{
                        Text("Name")
                            .foregroundColor(.white)
                        Spacer()
                        Text(vm.profileModel?.name ?? "" )
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Email")
                            .foregroundColor(.white)
                        
                        Spacer()
                        Text(vm.profileModel?.email ?? "")
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Phone")
                            .foregroundColor(.white)
                        Spacer()
                        Text(vm.profileModel?.number ?? "")
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Subject Name")
                            .foregroundColor(.white)
                        Spacer()
                        Text(vm.profileModel?.subjectName ?? "")
                            .foregroundColor(.white)
                    }
                    HStack{
                        Text("Subject Address")
                            .foregroundColor(.white)
                        Spacer()
                        Text(vm.profileModel?.subjectAddress ?? "")
                            .foregroundColor(.white)
                    }
                }.padding(.top, 80)
                
                Button {
                    vm.logOut()
                } label: {
                    Text("Log Out")
                        .foregroundColor(.white)
                        .padding().border(.white)
                }.padding(.top, 120)
                
            }.padding()
        }.fullScreenCover(isPresented: $vm.isLogined) {
            LoginView()
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
