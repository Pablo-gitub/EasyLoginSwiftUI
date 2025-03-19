//
//  SignUpViewModel.swift
//  EasyLogin
//
//  Created by Paolo Pietrelli on 19/03/25.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var copyPassword: String = ""
    
    @Published var errorMessage: String?    = nil
    @Published var isRegistrated: Bool       = false
    
    func registration() {
        isRegistrated = false
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
        
        if !copyPassword.isEmpty && !password.isEmpty && copyPassword != password{
            errorMessage = "Copy password doesn't match password."
            return
        }
        
        if username == "Prova" && password == "prova" && copyPassword == "prova" {
            isRegistrated = true
        } else {
            errorMessage = "Only demo user Prova / prova is allowed"
        }
    }
    
}
