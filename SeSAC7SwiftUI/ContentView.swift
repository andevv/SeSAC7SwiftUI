//
//  ContentView.swift
//  SeSAC7SwiftUI
//
//  Created by andev on 10/20/25.
//

/*
 View Protocol
 body - 연산 프로퍼티
 - 매번 타입을 선언해주기가 번거롭다 -> 타입을 알고있음에도 타입을 숨기자
 - (Swift 5.1) Opaque Type = 불투명 타입 = 역제네릭 타입 => some
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("타입 확인") {
            let value = type(of: self.body)
            print(value)
        }
        .foregroundStyle(.red)
    }
}

#Preview {
    ContentView()
}
