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
    
    init(reactor: KmoocListReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "K-MOOC"
        setupLayout()
        self.reactor?.action.onNext(.refresh)
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
        kmoocListView.bind(reactor)
        
//        self.rx.viewDidLoad
//            .map { Reactor.Action.refresh }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
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
