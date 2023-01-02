//
//  KmoocListViewController.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/26.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import ReactorKit

class KmoocListViewController: UIViewController, View {
    typealias Reactor = KmoocListReactor
    
    // MARK: - Properties
    var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "K-MOOC"
        setupLayout()
//        bindData()
    }
    
    // MARK: - View
    let kmoocListView = KmoocListView()
    
    func setupLayout() {
        view.addSubview(kmoocListView)
        kmoocListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    func bind(reactor: Reactor) {
        <#code#>
    }
    
//    func bindData() {
//        kmoocListView.tableView.rx.itemSelected
//            .subscribe(onNext: { [weak self] _ in
//                guard let self = self else { return }
//                let VC = KmoocDetailViewController()
//                self.navigationController?.pushViewController(VC, animated: true)
//            }).disposed(by: disposeBag)
//    }
}
