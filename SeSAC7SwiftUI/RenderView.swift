//
//  RenderView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/21/25.
//

import SwiftUI
/*
 property, method, struct
 */

struct RenderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            JackView()
            JackView()
            denView
            finnView()
            Text("JackJackJackJackJack")
                .font(.largeTitle)
                .background(.yellow)
                .foregroundStyle(.blue)
            Text("Hue")
                .font(.largeTitle)
                .background(.yellow)
                .foregroundStyle(.blue)
            Text("Bran")
                .font(.largeTitle)
                .background(.yellow)
                .foregroundStyle(.blue)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(.red)
    }
    
    func finnView() -> some View {
        Text("Finn")
            .font(.largeTitle)
            .background(.yellow)
            .foregroundStyle(.blue)
    }
    
    var denView: some View {
        Text("Den")
            .font(.largeTitle)
            .background(.yellow)
            .foregroundStyle(.blue)
    }
}

struct JackView: View {
    var body: some View {
        Text("JackJackJackJackJack")
            .font(.largeTitle)
            .background(.yellow)
            .foregroundStyle(.blue)
    }
}

#Preview {
    RenderView()
}
