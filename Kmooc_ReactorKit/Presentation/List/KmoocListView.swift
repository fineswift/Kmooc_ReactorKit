//
//  KmoocListView.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/26.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class KmoocListView: UIView {
    let disposeBag = DisposeBag()
    var list = LectureList()
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    lazy var tableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(KmoocListItemTableViewCell.self, forCellReuseIdentifier: KmoocListItemTableViewCell.identifier)
    }
    
    // MARK: - Methods
    func setupLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(_ reactor: KmoocListReactor) {
        reactor.state
            .compactMap { $0.lectureList.lectures }
            .bind(to: tableView.rx.items(cellIdentifier: KmoocListItemTableViewCell.identifier, cellType: KmoocListItemTableViewCell.self)) { row, item, cell in
                cell.bindData(item)
            }.disposed(by: disposeBag)
    }
}
