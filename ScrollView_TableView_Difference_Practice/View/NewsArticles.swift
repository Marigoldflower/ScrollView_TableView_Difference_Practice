//
//  NewsArticles.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import UIKit
import SnapKit


final class NewsArticles: UIView {

    let summary: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        label.numberOfLines = 5
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(summary)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupLayout() {
        summary.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.snp.top).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
//            make.trailing.equalTo(self.snp.trailing).offset(0)
//            make.bottom.equalTo(self.snp.bottom).offset(0)
        }
    }
    
}
