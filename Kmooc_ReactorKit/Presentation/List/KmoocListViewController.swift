//
//  KmoocListViewController.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/26.
//

import UIKit
import SnapKit

class KmoocListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    let kmoocListView = KmoocListView()
    
    func setupLayout() {
        view.addSubview(kmoocListView)
        kmoocListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
