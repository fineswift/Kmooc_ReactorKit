//
//  KmoocDetailView.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/27.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import WebKit

class KmoocDetailView: UIView {
    let disposeBag = DisposeBag()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    lazy var scrollView = UIScrollView()
    
    lazy var containerView = UIView()
    
    lazy var stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }
    
    lazy var lectureImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    lazy var lectureNumber = UILabel().then {
        $0.font = .notoSans(size: 17)
    }
    
    lazy var lectureType = UILabel().then {
        $0.font = .notoSans(size: 17)
    }
    
    lazy var lectureOrg = UILabel().then {
        $0.font = .notoSans(size: 17)
    }
    
    lazy var lectureTeachers = UILabel().then {
        $0.font = .notoSans(size: 17)
    }
    
    lazy var lectureDue = UILabel().then {
        $0.font = .notoSans(size: 17)
    }
    
    lazy var webView = WKWebView()
    
    // MARK: - Methods
    func setupLayout() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.edges.equalToSafeAreaAuto(self)
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        
        containerView.addSubviews([stackView, webView])
        stackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        webView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        stackView.addArrangedSubviews([lectureImage, lectureNumber, lectureType, lectureOrg, lectureTeachers, lectureDue])
        lectureImage.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(lectureImage.snp.height).multipliedBy(1.7778)
        }
        
        [lectureNumber, lectureType, lectureOrg, lectureTeachers, lectureDue].forEach {
            $0.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
            }
        }
    }
}
