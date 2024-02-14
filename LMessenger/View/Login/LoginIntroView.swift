//
//  LoginIntroView.swift
//  LMessenger
//
//  Created by 곽서방 on 2/12/24.
//

import SwiftUI

struct LoginIntroView: View {
    @State private var isPresentedLoginView: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("환영합니다.")
                    .font(.system(size: 26,weight: .bold))
                    .foregroundColor(.customBkText)
                Text("무료 메세지와 영상통화, 음성통화를 부담없이 즐겨보세요!")
                    .font(.system(size: 13))
                    .foregroundColor(.customGreyDeep)
                
                Spacer()
                
                Button{
                    isPresentedLoginView.toggle()
                }label: {
                    Text("로그인")
                }
                .buttonStyle(LoginBtnStyle(textColor: .customLineAppColor)) //로그인 버튼 Style
               
            }
            .navigationDestination(isPresented: $isPresentedLoginView) {
                LoginView()
            }
        }
    }
}

#Preview {
    LoginIntroView()
}
