//
//  AppleNewsViewModel.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import Foundation
import Combine
import Alamofire

final class AppleNewsViewModel {
    
    var cancellables: Set<AnyCancellable> = []
    @Published var appleNewsPublisher: AppleNews = []
    
    
    func fetchNetwork() {
        AppleNewsNetworkManager.shared.fetchNetwork().sink { [weak self] apple in
            self?.appleNewsPublisher = apple
            print("지금 Publisher에 Apple Data가 들어왔습니다")
        }.store(in: &cancellables)
    }
    
}
