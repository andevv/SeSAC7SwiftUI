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

/// 프로퍼티가 var여도 내부 프로퍼티 변경 불가능
/// mutating
/// 연산 프로퍼티에서 get은 nonmutating이지만, mutating get으로 수정하면 내부 프로퍼티 변경 가능
struct User {
    var nickname = "고래밥"
    
    var introduce: String {
        mutating get {
            nickname = "칙촉"
            return "안녕하세요 저는 \(nickname)입니다."
        }
    }
    
    func changeNickname() {
        print("안녕하세요 저는 \(nickname)입니다.")
    }
}

/// 구조체에서 값 변경은 불가능, mutating get으로 값 변경 가능
/// 하지만 SwiftUI View 프로토콜은 nonmutating get 특성을 가진 body로 이루어져 있음
/// -> SwiftUI Data Flow -> Swift PropertyWrapper(Swift 5.1)
/// @State, @Binding, @StateObject
struct ContentView: View {
    
    var nickname = "고래밥"
    
    var body: some View {
//        get {
//            Text(nickname)
//            Button("닉네임 변경") {
//                nickname = "칙촉"
//                print("닉네임 변경 완료: \(nickname)")
//            }
//        }
    }
}

#Preview {
    ContentView()
}
