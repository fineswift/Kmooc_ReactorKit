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
    
    
    
    // MARK: - Methods
    func setupLayout() {
        
    }
}
