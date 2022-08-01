//
//  WelcomeViewPresenter.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 01.08.2022.
//

import Foundation

protocol WelcomeViewPresenterProtocol {
    func login()
}

class WelcomeViewPresenter: WelcomeViewPresenterProtocol {
    
    private var router: RouterProtocol?
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func login() {
        router?.showMainView()
    }
    
}
