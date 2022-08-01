//
//  ModuleBuilder.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 01.08.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createBoardScreen(router: RouterProtocol) -> UICollectionViewController
}

final class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createBoardScreen(router: RouterProtocol) -> UICollectionViewController {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = MainCollectionViewController(collectionViewLayout: layout)
        let presenter = MainViewPresenter(router: router)
        view.presenter = presenter
        return view
    }
    
}