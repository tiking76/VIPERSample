//
//  Router.swift
//  VIPER
//
//  Created by tiking on 2021/07/31.
//

import Foundation

// object
// Entry point

import UIKit

typealias EntryPoint = AnyView & UIViewController


protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        var view: AnyView = UserViewController()
        var pesenter: AnyPresenter = UserPersenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = pesenter
        
        interactor.presenter = pesenter
        
        pesenter.router = router
        pesenter.interactor = interactor
        pesenter.view = view
        
        router.entry = view as? EntryPoint
        
        
        return router
    }
}

