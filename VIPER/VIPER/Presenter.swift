//
//  Presenter.swift
//  VIPER
//
//  Created by tiking on 2021/07/31.
//

import Foundation

// object
// protocol
// ref to interactor, router, view

enum FetchError: Error {
    case faild
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPersenter: AnyPresenter {
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
    
    var router: AnyRouter?
}


