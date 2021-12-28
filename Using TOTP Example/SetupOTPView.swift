//
//  SetupOTPView.swift
//  Using TOTP Example
//
//  Created by Makeeyaf on 2021/12/28.
//

import SwiftUI

struct SetupOTPView: View {
    @Environment(\.openURL) var openURL
    @State var code: String = ""
    @State var isTextFieldHidden: Bool = true

    var body: some View {
        if isTextFieldHidden {
            Button("Connect OTP", action: {
                Task {
                    guard let url = await API.getOTPLink() else { return }

                    openURL(url)
                    isTextFieldHidden = false
                }
            })
                .padding()
        } else {
            VStack {
                TextField("OTP Code", text: $code)
                    .textContentType(.oneTimeCode)
                    .padding()
                Button("Cancel", action: {
                    isTextFieldHidden = true
                })
                    .padding()
            }
        }
    }
}

// MARK: - API

enum API {
    struct OTPLink: Codable {
        let link: String
    }

    static let host = URL(string: "http://localhost:4567")!

    static func getOTPLink() async -> URL? {
        let url = Self.host.appendingPathComponent("/setup")

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let otpLink = try JSONDecoder().decode(OTPLink.self, from: data)
            return URL(string: otpLink.link)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}


// MARK: - Previews

struct SetupOTPView_Previews: PreviewProvider {
    static var previews: some View {
        SetupOTPView()
    }
}
