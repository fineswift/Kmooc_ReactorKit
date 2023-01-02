//
//  KmoocListReactor.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/26.
//

import RxSwift
import ReactorKit

class KmoocListReactor: Reactor {
    
    enum Action {
        case refresh
        case loadMore
        case showDetail
    }
    
    enum Mutation {
        case loadList
        case nextList
    }
    
    
    struct State {
        var lectureList: LectureList = LectureList()
        var isLoading: Bool = false
    }
    
    let initialState: State = State()
}

extension KmoocListReactor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .refresh:
            return .just(.loadList)
        case .loadMore:
            return .just(.nextList)
        case .showDetail:
            break
        }
    }
}

extension KmoocListReactor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .loadList:
            newState.isLoading = true
            NetworkService.shared.list {
                newState.lectureList = $0
                newState.isLoading = false
            }
        case .nextList:
            guard !newState.isLoading else { return state }
            newState.isLoading = true
            NetworkService.shared.next(currentPage: newState.lectureList) {
                var lectureList = $0
                lectureList.lectures?.insert(contentsOf: newState.lectureList.lectures ?? [], at: 0)
                newState.lectureList = lectureList
                newState.isLoading = false
            }
        }
        
        return state
    }
}
