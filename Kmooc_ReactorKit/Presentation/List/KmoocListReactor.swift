//
//  KmoocListReactor.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/26.
//

import RxSwift
import ReactorKit

class KmoocListREactor: Reactor {
    
    enum Action {
        case none
    }
    
    enum Mutation {
        case none
    }
    
    
    struct State {
        let test: String = ""
    }
    
    let initialState: State = State()
}
