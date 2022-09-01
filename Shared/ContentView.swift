//
//  ContentView.swift
//  Shared
//
//  Created by Mohammad Jawed Ahmad Ansari on 29/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername =  0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
    
    var body: some View {
       
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.3).foregroundColor(.white)
                
                VStack{
                    Text("Login").font(.largeTitle).bold().padding()
                    TextField("Username",text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                        .border(.red,width:CGFloat(wrongUsername))
                    
                    SecureField("Passwrod",text: $password)
                        .padding()
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                    Button("Login"){
                        authenticateUser(username: username, password: password)
                        
                    }.foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    NavigationLink(destination: Text("You are logged in @\(username)"),isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                    
                }
            }
        }.navigationBarHidden(true)
        
    /*VStack{
            
                Text("Hello, world! jad").font(.title).foregroundColor(.blue)
            Text("This is my first iOS App in swift language").font(.subheadline).foregroundColor(.red)
            
            Image("Image").clipShape(Circle()).overlay(Circle().stroke(.white,lineWidth: 4))
                .shadow(radius: 7)
        }*/
    }
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "jawed2022"{
            wrongUsername = 0
            if password.lowercased() == "jad123" {
                wrongPassword = 0
                showingLoginScreen = true
            }else {
                wrongPassword = 2
            }
        }else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
