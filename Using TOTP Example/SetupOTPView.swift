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

    var body: some View {
        VStack {
            Button("Connect OTP", action: {
                Task {
                    guard let url = await API.getOTPLink() else { return }

                    openURL(url)
                }
            })
                .padding()

            TextField("OTP Code", text: $code)
                .textContentType(.oneTimeCode)
                .keyboardType(.decimalPad)
                .padding()
        }
    }
}

// MARK: - API

enum API {
    struct OTPLink: Codable {
        let link: String
    }

    static let host: URL = {
        guard let host = Bundle.main.object(forInfoDictionaryKey: "HOST") as? String else {
            fatalError("There is no HOST key in Info.plist")
        }

        return URL(string: "https://" + host)!
    }()

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
