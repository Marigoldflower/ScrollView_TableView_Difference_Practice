//
//  AppleNewsNetworkManager.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import Foundation
import Combine
import Alamofire

// 미세먼지를 알려주기 위해 에어코리아 사이트를 사용하면 반드시 앱 배포 전에 개발보고서를 작성해서 에어코리아에 제출해야 한다. ⭐️⭐️⭐️

final class AppleNewsNetworkManager {
    
    static let shared = AppleNewsNetworkManager()
    // 여러객체를 추가적으로 생성하지 못하도록 설정
    private init() {}
    
    private let serviceKey = "cficbc9r01qq9nt20eagcficbc9r01qq9nt20eb0"
    
    

    func fetchNetwork() -> AnyPublisher<AppleNews, Never> {
        
        let todayDate = Date()
        let threeDaysAgoDate = todayDate - (86400 * 3)
        
        
       
        // MARK: - 현재 시간
        let todayformatter = DateFormatter()
        todayformatter.dateFormat = "yyyy-MM-dd"
        let today = todayformatter.string(from: todayDate)
        print("오늘의 날짜는 \(today)")
        
        
        
        // MARK: - 현재 시간으로부터 3일 전 시간
        
        let threeDaysAgoformatter = DateFormatter()
        threeDaysAgoformatter.dateFormat = "yyyy-MM-dd"
        let threeDaysAgo = threeDaysAgoformatter.string(from: threeDaysAgoDate)
        print("오늘의 날짜는 \(threeDaysAgo)")
        
        
        let url = "https://finnhub.io/api/v1/company-news?symbol=AAPL&from=\(threeDaysAgo)&to=\(today)&token=\(serviceKey)"
        
      
        
        return Future<AppleNews, Never> { promise in
            AF.request(url).validate().responseDecodable(of: AppleNews.self) { response in
                switch response.result {
                case .success(let apple):
                    print("Apple 네트워크가 실행되었습니다!")
                    promise(.success(apple))
                case .failure(let error):
                    print("Apple 네트워크에서 에러가 발생했습니다 \(error)")
                }
            }
        }.eraseToAnyPublisher()
    }
    
   
}





