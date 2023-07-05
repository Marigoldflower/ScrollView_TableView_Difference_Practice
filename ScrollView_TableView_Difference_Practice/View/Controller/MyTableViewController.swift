//
//  ViewController.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import UIKit
import SnapKit
import SDWebImage


final class MyTableViewController: UIViewController {

    let tableView = UITableView()

    
    // MARK: - ViewModel
    
    let appleNewsViewModel = AppleNewsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupTableLayout()
        setupDelegate()
        registerTableView()
        fetchAppleNetwork()
        bindAppleData()
        print("지금 되고는 있는거냐?")
        
    }
    
    
    func setupTableLayout() {
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(0)
            make.top.equalTo(view.snp.top).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
    
    
    func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerTableView() {
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
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
        } receiveValue: { _ in
            self.tableView.reloadData()
        }.store(in: &appleNewsViewModel.cancellables)

    }
    
    
}


extension MyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Publisher 데이터의 개수 \(appleNewsViewModel.appleNewsPublisher.count)")
        return appleNewsViewModel.appleNewsPublisher.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        // 셀을 클릭할 때 아무런 색깔의 변화도 없게 만드는 코드
        cell.selectionStyle = .none
        cell.newsImage.sd_setImage(with: appleNewsViewModel.appleNewsPublisher[indexPath.row].imageSDURL)
        cell.headLine.text = appleNewsViewModel.appleNewsPublisher[indexPath.row].headline
        cell.summary.text = appleNewsViewModel.appleNewsPublisher[indexPath.row].summary
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
}


extension MyTableViewController: UITableViewDelegate {
    
    
}

