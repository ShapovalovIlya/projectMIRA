//
//  MainViewPresenter.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 01.08.2022.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    init(router: RouterProtocol)
    func notificationTapped()
    
}

final class MainViewPresenter: MainViewPresenterProtocol {
    
    var router: RouterProtocol?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func notificationTapped() {
        
    }
    
}

