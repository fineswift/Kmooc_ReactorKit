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
    
    lazy var containerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 16
    }
    
    lazy var thumbnailImageView = UIImageView()
    
    lazy var contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.spacing = 0
    }
    
    lazy var nameLabel = UILabel()
    
    lazy var orgNameLabel = UILabel()
    
    lazy var durationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        contentStackView.addArrangedSubviews([])
        containerStackView.addArrangedSubviews([thumbnailImageView, contentStackView])
    }
}
