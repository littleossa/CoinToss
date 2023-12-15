//
//  CoinTossWidget.swift
//  CoinTossWidget
//
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CoinTossWidgetEntryView : View {
    
    @AppStorage(
        UserDefaultsStore.Key.isAnimation.rawValue,
        store: UserDefaultsStore.shared.userDefaults
    )
    var isAnimation = false
    
    @AppStorage(
        UserDefaultsStore.Key.isCoinReversed.rawValue,
        store: UserDefaultsStore.shared.userDefaults
    )
    var isReversed = false
    
    var entry: Provider.Entry

    var rotationAngle: Double {
        isAnimation ? 360 : 0
    }

    var body: some View {
        Button(intent: CoinTossIntent(isTest: false)) {
            CoinView(isReversed: isReversed)
                .rotation3DEffect(.degrees(rotationAngle), axis: (x: 1, y: 1, z: 1))
                .animation(.easeIn(duration: 0.5),
                           value: isAnimation)
        }
        .buttonStyle(.plain)
    }
}

struct CoinTossWidget: Widget {
    let kind: String = "CoinTossWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CoinTossWidgetEntryView(entry: entry)
                .containerBackground(for: .widget) {}
        }
        .configurationDisplayName("Coin toss on a widget")
        .description("You can flip the coin to decide something on a widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    CoinTossWidget()
} timeline: {
    SimpleEntry(date: .now)
    SimpleEntry(date: .now)
}
