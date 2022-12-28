//
//  KmoocListItemtableViewCell.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/26.
//

import UIKit
import Then
import SnapKit

class KmoocListItemTableViewCell: UITableViewCell {
    static let identifier = String(describing: KmoocListItemTableViewCell.self)
    
    lazy var containerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 16
    }
    
    lazy var thumbnailImageView = UIImageView().then {
        $0.backgroundColor = .black
    }
    
    lazy var contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 0
    }
    
    lazy var nameLabel = UILabel().then {
        $0.font = .notoSans(.medium, size: 20)
    }
    
    lazy var orgNameLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .notoSans(size: 12)
    }
    
    lazy var durationLabel = UILabel().then {
        $0.textColor = .lightGray
        $0.font = .notoSans(size: 12)
    }
    
    lazy var underLineView = UIView().then {
        $0.backgroundColor = .systemGray3
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        selectionStyle = .none
        
        contentStackView.addArrangedSubviews([nameLabel, orgNameLabel, durationLabel])
        nameLabel.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        containerStackView.addArrangedSubviews([thumbnailImageView, contentStackView])
        thumbnailImageView.snp.makeConstraints {
            $0.height.equalToSuperview()
            $0.width.equalTo(thumbnailImageView.snp.height).multipliedBy(16 / 9)
        }
        
        addSubview(containerStackView)
        containerStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bindData() {
        
    }
}
