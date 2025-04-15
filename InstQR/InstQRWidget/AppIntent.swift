//
//  AppIntent.swift
//  InstQRWidget
//
//  Created by Daniel Freitas on 14/04/2025.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "InstQR" }
    static var description: IntentDescription { "This is quick QR code generator." }
    @Parameter(title: "", default: "")
    var config: String
}
