//
//  LoginViewModel.swift
//  EasyLogin
//
//  Created by Paolo Pietrelli on 19/03/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var errorMessage: String?    = nil
    @Published var isAuthenticated: Bool       = false
    
    func login() {
        isAuthenticated = false
        errorMessage = nil
        
        if username.isEmpty && !password.isEmpty{
            errorMessage = "Username is required"
            return
        }
        
        if !username.isEmpty && password.isEmpty{
            errorMessage = "Password is required"
            return
        }
        
        if username.isEmpty && password.isEmpty{
            errorMessage = "Username and password are required."
            return
        }
        
        if username == "Prova" && password == "prova" {
            isAuthenticated = true
        } else {
            errorMessage = "Username or password incorrect"
        }
    }
    
}
