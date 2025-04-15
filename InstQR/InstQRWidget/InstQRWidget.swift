//
//  InstQRWidget.swift
//  InstQRWidget
//
//  Created by Daniel Freitas on 14/04/2025.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        return Timeline(entries: [SimpleEntry(date: Date())] as [SimpleEntry], policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct InstQRWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        VStack {
            HStack {
                Image("Logo").resizable().frame(width: 108, height: 108)
            }
        }
    }
}

struct InstQRWidget: Widget {
    let kind: String = "InstQRWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            InstQRWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }.supportedFamilies([.systemSmall])
    }
}
