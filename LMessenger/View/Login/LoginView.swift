//
//  LoginView.swift
//  LMessenger
//
//  Created by 곽서방 on 2/12/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss //현재 화면을 dismiss해서 이전 화면으로 돌아가기 위해 사용
    var body: some View {
        VStack(alignment: .leading,spacing: 5) {
            Group{
                Text("로그인")
                    .font(.system(size: 30,weight: .bold))
                    .foregroundColor(.customBkText)
                    .padding(.top,80)
                
                Text("아래 제공되는 서비스로 로그인을 해주세요.")
                    .font(.system(size: 16))
                    .foregroundColor(.customGreyDeep)
            }
            .padding(.horizontal,30)
            
            
            Spacer()
          
            LoginBtnView()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button{
                    dismiss()  //pop
                }label: {
                    Image("back")
                }
            }
        }
    
    }
}
private struct LoginBtnView: View {
   fileprivate var body: some View {
       VStack(spacing: 5) {
           Button{
               //TODO:
           }label: {
               Text("Google로 로그인")
           }
           
           Button{
               //TODO:
           }label: {
               Text("Apple로 로그인")
           }
       }
       .buttonStyle(LoginBtnStyle(textColor: .customBkText,borderColor: .customGreyLight))
      
    }
}
#Preview {
    LoginView()
}
