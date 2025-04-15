//
//  ContentView.swift
//  InstQR
//
//  Created by Daniel Freitas on 14/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: String = ""
    var body: some View {
        VStack {
            InputView({ value in
                inputValue = value
            })
            QRCodeView(url: inputValue)
            if !inputValue.isEmpty {
                Button("Clear", action: {
                    inputValue = ""
                })
            }
        }
        .padding(4)
    }
}

#Preview {
    ContentView().environment(\.locale, Locale(identifier: "pt_BR"))
}
