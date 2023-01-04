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
        case requestList(LectureList)
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
            return requestLectureList().flatMap { lectureList -> Observable<Mutation> in
                return .just(.requestList(lectureList))
            }
        case .loadMore:
            return .just(.nextList)
        case .showDetail:
            break
        }
        return .just(.nextList)
    }
    
    func requestLectureList() -> Observable<LectureList> {
        return Observable<LectureList>.create { observer in
            NetworkService.shared.list {
                observer.onNext($0)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}

extension KmoocListReactor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .requestList(let list):
            newState.isLoading = true
            newState.lectureList = list
            newState.isLoading = false
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
        
        return newState
    }
}
