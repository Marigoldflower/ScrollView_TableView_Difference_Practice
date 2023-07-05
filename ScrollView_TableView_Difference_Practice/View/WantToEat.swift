//
//  WantToEat.swift
//  ScrollView_TableView_Difference_Practice
//
//  Created by 황홍필 on 2023/07/05.
//

import UIKit
import SnapKit

final class WantToEat: UIView {

    let wantToEat: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        label.numberOfLines = 7
        label.text = "짜장면 먹고 싶다 \n햄버거 먹고싶다 \n피자 먹고싶다 \n족발 먹고싶다 \n치킨 먹고싶다 \n곱창 먹고싶다 \n스테이크 먹고싶다"
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(wantToEat)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupLayout() {
        wantToEat.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.top.equalTo(self.snp.top).offset(20)
//            make.trailing.equalTo(self.snp.trailing).offset(0)
//            make.bottom.equalTo(self.snp.bottom).offset(-20)
        }
    }
}
