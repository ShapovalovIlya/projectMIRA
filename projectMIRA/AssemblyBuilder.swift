//
//  ModuleBuilder.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 01.08.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createWelcomeScreen(router: RouterProtocol) -> UIViewController
    func createBoardScreen(router: RouterProtocol) -> UICollectionViewController
}

final class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createWelcomeScreen(router: RouterProtocol) -> UIViewController {
        let view = WelcomeViewController()
        let presenter = WelcomeViewPresenter(router: router)
        view.presenter = presenter
        return view
    }
    
    func createBoardScreen(router: RouterProtocol) -> UICollectionViewController {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = BoardCollectionViewController(collectionViewLayout: layout)
        let boardCollectionViewCell = BoardCollectionViewCell()
        let presenter = BoardViewPresenter(
            router: router,
            boardCollectionViewCell: boardCollectionViewCell
        )
        
        view.presenter = presenter
        return view
    }
    
}
