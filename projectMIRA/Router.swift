//
//  Router.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 01.08.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func showWelcomeView()
    func showMainView()
    func showNotificationsView()
    
}

final class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func showWelcomeView() {
        guard let navigationController = navigationController else { return }
        guard let welcomeViewController = assemblyBuilder?.createWelcomeScreen(router: self) else { return }
        navigationController.viewControllers = [welcomeViewController]
    }
    
    func showMainView() {
        guard let navigationController = navigationController else { return }
        guard let mainViewController = assemblyBuilder?.createBoardScreen(router: self) else { return }
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func showNotificationsView() {
        
    }
    
}
