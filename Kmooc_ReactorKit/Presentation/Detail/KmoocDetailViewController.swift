//
//  KmoocDetailViewController.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/26.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class KmoocDetailViewController: UIViewController {
    // MARK: - Properties
    var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    // MARK: - View
    let subView = KmoocDetailView()
    
    func setupLayout() {
        view.addSubview(subView)
        subView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
