//
//  TamagochiView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/23/25.
//

import SwiftUI

struct TamagochiView: View {
    
    @State private var rice = 0
    @State private var water = 0
    
    var body: some View {
        VStack {
            Text("밥알 \(rice)개, 물방울 \(water)개")
                .font(.title)
            RiceButtonView(rice: $rice)
            Button("물방울 먹이기") {
                print("물방울 클릭")
                water += 1
            }
            .font(.title)
        }
    }
}

struct RiceButtonView: View {
    
    @Binding var rice: Int
    
    var body: some View {
        Button("밥알 먹이기") {
            print("밥알 클릭")
            rice += 1
        }
        .font(.title)
    }
}

#Preview {
    TamagochiView()
}
