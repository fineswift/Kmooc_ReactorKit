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
        $0.delegate = self
        $0.dataSource = self
    }
    
    // MARK: - Methods
    func setupLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension KmoocListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.lectures?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KmoocListItemTableViewCell.identifier) as! KmoocListItemTableViewCell
        cell.bindData(list.lectures![indexPath.row])
        return cell
    }
    
    
}
