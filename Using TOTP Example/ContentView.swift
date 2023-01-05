//
//  ContentView.swift
//  Using TOTP Example
//
//  Created by Makeeyaf on 2021/12/28.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = "email@example.com" // Hardcoded ID. See api.rb line 9.
    @State var password: String = ""

    private var isInvalid: Bool {
        email.isEmpty || password.isEmpty
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textContentType(.username)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .padding()

                SecureField("New Password", text: $password)
                    .textContentType(.password)
                    .padding()

                NavigationLink(destination: SetupOTPView()) {
                    Text("Sign in")
                }
                .padding()
                .disabled(isInvalid)
            }
        }
    }
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
