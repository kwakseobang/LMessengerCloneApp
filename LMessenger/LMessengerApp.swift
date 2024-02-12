//
//  LMessengerApp.swift
//  LMessenger
//
//  Created by 곽서방 on 2/10/24.
//

import SwiftUI

@main
struct LMessengerApp: App {
    //DIContainer를 EnvironmentObject로 주입하기 위해 @StateObject 선언
    @StateObject var container: DIContainer = .init(services: Services())
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: .init()) // viewModel를 초기화 하는 시점은 AuthenticatedView를 만들 때. 그 이유는 viewModel에서 컨테이너를 초기화할때 주입해줄려고
                .environmentObject(container) // DIContainer를 environmentObject로 추가
        }
    }
}
