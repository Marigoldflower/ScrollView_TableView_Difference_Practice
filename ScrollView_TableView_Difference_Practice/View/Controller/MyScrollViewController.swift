//
//  MyScrollViewController.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import UIKit
import SnapKit

final class MyScrollViewController: UIViewController {
    
    
    let appleNewsViewModel = AppleNewsViewModel()
    
    
    let newsArticles: NewsArticles = {
        let view = NewsArticles()
        
        return view
    }()
    
    
    let newsImage: NewsImage = {
        let view = NewsImage()
        
        return view
    }()
    
    
    let wantToEat: WantToEat = {
        let view = WantToEat()
        
        return view
    }()
    
    
    let redView: RedView = {
        let view = RedView()
        view.backgroundColor = .red
        return view
    }()
    
    
    let stackView: UIStackView = {
         let stack = UIStackView() // arrangedSubview를 이용해서 바로 할당하지 말 것
         stack.axis = .vertical // 가로로 스크롤하고 싶으면 horizontal로 맞추기
         stack.spacing = 5
         stack.distribution = .fill
         return stack
    }()
    
    
    let scrollView: UIScrollView = {
         let scroll = UIScrollView()
         return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        setupLayout()
        fillStackView()
        fetchAppleNetwork()
        bindAppleData()
        
    }

    
  
    func setupLayout() {
        
        newsArticles.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        
//      
        newsImage.snp.makeConstraints { make in
            make.height.equalTo(350)
        }
        
        
        wantToEat.snp.makeConstraints { make in
            make.height.equalTo(250)
        }
        
       
        redView.snp.makeConstraints { make in
            make.height.equalTo(390)
        }
        
        
        scrollView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(view.snp.top)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(scrollView.snp.leading)
            make.top.equalTo(scrollView.snp.top)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            
            make.width.equalTo(scrollView.snp.width)
            
        }
    }
    
    
    func fillStackView() {
        let array = [newsArticles, newsImage, wantToEat, redView]
        for stuff in array {
            var elementView = UIView()
            elementView = stuff
            elementView.translatesAutoresizingMaskIntoConstraints = false
            // ⭐️ 스크롤 방향이 세로 방향이면 widthAnchor에 값을 할당하는 부분은 지워도 된다.
//            elementView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            // ⭐️ 스크롤 방향이 가로 방향이면 heightAnchor에 값을 할당하는 부분은 지워도 된다.
            elementView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
            stackView.addArrangedSubview(elementView)
        }
    }
    
    
    func fetchAppleNetwork() {
        appleNewsViewModel.fetchNetwork()
    }
    
    func bindAppleData() {
        appleNewsViewModel.$appleNewsPublisher.receive(on: DispatchQueue.main).sink { completion in
            switch completion {
            case .finished:
                print("Subscribe가 완료되었습니다")
            }
        } receiveValue: { [weak self] apple in
            for data in apple {
                self?.newsArticles.summary.text = data.summary
                self?.newsImage.newsImage.sd_setImage(with: data.imageSDURL)
            }
        }.store(in: &appleNewsViewModel.cancellables)

    }

}
