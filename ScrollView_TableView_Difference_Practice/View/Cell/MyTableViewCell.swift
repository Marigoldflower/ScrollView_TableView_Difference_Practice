//
//  MyTableViewCell.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import UIKit
import SnapKit
import SDWebImage

final class MyTableViewCell: UITableViewCell {

    static let identifier = "MyTableViewCell"
    
    
    let headLine: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        label.numberOfLines = 3
        return label
    }()
    
    
    let newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    let summary: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 3
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.addSubview(newsImage)
        self.addSubview(headLine)
        self.addSubview(summary)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    func setupLayout() {
        newsImage.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.snp.top).offset(10)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.width.height.equalTo(110)
        }
        
        headLine.snp.makeConstraints { make in
            make.leading.equalTo(newsImage.snp.trailing).offset(15)
            make.top.equalTo(newsImage.snp.top)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        
        summary.snp.makeConstraints { make in
            make.leading.equalTo(newsImage.snp.trailing).offset(15)
            make.top.equalTo(headLine.snp.bottom).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
    }
    
}
