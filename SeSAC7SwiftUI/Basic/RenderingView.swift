//
//  RenderingView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/23/25.
//

import SwiftUI

//State Property를 보여주고 있는 곳이 어느 곳도 없다면 렌더링 X
//State Property를 한 군데라도 쓰고 있다면 렌더링 O
//body와 init 시점은 다르다 (init은 되는데 렌더링은 안함)
struct RenderingView: View {
    
    init() {
        print("RenderingView Init")
    }
    
    @State private var age = 0
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("다음 화면으로 넘어가기") {
                    Finn()
                }
                Text("Hue: \(age)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.random())
                den
                bran()
                Finn()
                Button("클릭") {
                    print(age)
                    age = Int.random(in: 1...100)
                }
            }
            .navigationTitle("네비게이션 타이틀")
        }
    }
    
    var den: some View {
        Text("Den")
            .font(.largeTitle)
            .padding()
            .background(Color.random())
    }
    
    func bran() -> some View {
        Text("Bran")
            .font(.largeTitle)
            .padding()
            .background(Color.random())
    }
}

private struct Finn: View {
    var body: some View {
        Text("Finn")
            .font(.largeTitle)
            .padding()
            .background(Color.random())
    }
    
    init() {
        print("Finn Init")
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1)
        )
    }
}

#Preview {
    RenderingView()
}
