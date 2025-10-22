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

/*
 state property가 변경이 되면, body 프로퍼티를 다시 그림
 @State: RenderView가 다시 그려지는 기준점 -> RenderView 관리 -> SOT(Source Of Truth)
 SOT가 변경이 되면 body가 다시 렌더링
 
 @State, @Binding -> PropertyWrapper (wrappedValue, projectedValue)
 */
struct RenderView: View {
    
    @State private var text = "Jack"
    @State private var nickname = "고래밥"
    
    var body: some View {
        VStack {
            TextField("닉네임을 입력해보세요", text: $text)
            NickNameView(nickname: $nickname)
                .background(.yellow)
            Text("닉네임 추천: \(nickname)")
                .background(.gray)
            Button("추천받기") {
                print("클릭했습니다.")
                nickname = "칙촉 \(Int.random(in: 1...100))"
            }
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

struct NickNameView: View {
    @Binding var nickname: String
    var body: some View {
        HStack {
            Text("닉네임 추천: \(nickname)")
            Button("추천받기") {
                nickname = "카스타드 \(Int.random(in: 1...100))"
            }
        }
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
