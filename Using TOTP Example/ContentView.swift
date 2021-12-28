//
//  ContentView.swift
//  Using TOTP Example
//
//  Created by Makeeyaf on 2021/12/28.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        Button("Connect OTP", action: {
            Task {
                guard let url = await API.getOTPLink() else { return }

                openURL(url)
            }
        })
            .padding()
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
