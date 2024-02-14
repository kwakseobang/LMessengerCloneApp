//
//  DIContainer.swift
//  LMessenger
//
//  Created by 곽서방 on 2/12/24.
//

import Foundation

///해당 클래스는 의존성 주입 컨테이너로 앱 외부에서 주입되어야하는 정보나 로직들을 관리하는 컨테이너.
///메신저 앱에서는 이 컨테이너를 통해 서비스 레이어에 접근할 수 있도록 정의.
///이 컨테이너는 EnvironmentObject로 주입할 예정.
///앱 시작 시 초기화를 한 후 EnvironmentObject에 해당 컨테이너를 넣어서 뷰 모델에서 컨테이너를 통해 서비스와 통신하도록 구조 잡을 예정
class DIContainer: ObservableObject {
    var services : ServiceType
    init(services: ServiceType) {
        self.services = services
    }
}
