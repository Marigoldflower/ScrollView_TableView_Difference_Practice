//
//  MainTabController.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import UIKit

final class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    private func configureUI() {
        // 각각의 뷰 컨트롤러가 내비게이션 컨트롤러를 이미 사용하고 있기 때문에
        // SceneDelegate에서 UINavigationController(rootViewController:)
        // 메소드를 또 사용하지 않아도 된다.
        let vc1 = UINavigationController(rootViewController: MyTableViewController())
        let vc2 = UINavigationController(rootViewController: MyScrollViewController())
        
        
        
        viewControllers = [vc1, vc2]
        
        modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .red
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()  // 탭 바 투명하지 않게
//        appearance.backgroundColor = .white     // 탭 바 색상설정
        
        tabBar.tintColor = .systemPink
        tabBar.scrollEdgeAppearance = appearance
        
        
        
        
        // 탭바 이미지 설정
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "list.bullet")?.withTintColor(.systemPink, renderingMode: .alwaysTemplate)
        items[1].image = UIImage(systemName: "hand.draw")?.withTintColor(.systemPink, renderingMode: .alwaysTemplate)
        

        
        
        
        
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = .white
        
        self.tabBar.standardAppearance = tabAppearance
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        
    }
    
    
}

