//
//  BasicWidget.swift
//  BasicWidget
//
//  Created by andev on 10/29/25.
//

import WidgetKit
import SwiftUI

// Provider
// 홈 화면에 사용자가 접근하기 전에, 미리 위젯에 뷰를 그려놓고 시간에 맞춰서 뷰를 업데이트
struct Provider: TimelineProvider {
    // 위젯 최초 렌더링
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀😀😀😀")
    }
    
    // 위젯 갤러리 미리보기 화면
    // 잠금 화면에서 민감한 정보를 숨길 때도 사용할 수 있음
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀😀")
        completion(entry)
    }

    // 위젯 업데이트를 원하는 시간을 배열로 관리
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd) //policy: .atEnd -> 다시 0부터 무한반복 하도록
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

// Entry, TimelineEntry: 실제 위젯에 보여줄 데이터
// date: 추후 위젯이 다시 그려질 시간에 대한 정보, relevance: 스마트스택(시간, score 고려)
struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

// EntryView: 실제 위제에 대한 UI 담당
struct BasicWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            HStack {
                Text("\(UserDefaults.standard.string(forKey: "coin") ?? "없음")")
                Text(entry.date, style: .time)
            }
            Text("RandomNumber: \(Int.random(in: 1...100))")
            Text(entry.emoji)
        }
    }
}

struct BasicWidget: Widget {
    let kind: String = "BasicWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                BasicWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                BasicWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("잭잭 위젯")
        .description("이 위젯을 사용하시면 OO 기능이 있습니다.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    BasicWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
