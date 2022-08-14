//
//  MainViewPresenter.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 01.08.2022.
//

import UIKit

protocol BoardCollectionViewCellProtocol: AnyObject {
    func addTableViewCell(at addedIndexPath: IndexPath)
}

protocol BoardViewPresenterProtocol: AnyObject {
    init(router: RouterProtocol, boardCollectionViewCell: BoardCollectionViewCellProtocol)
    var boards: [Board]? { get set }
    func notificationTapped()
    func addIndexPath(at indexPath: IndexPath)
    func addToBoards(newElement element: Board)
    func getBoard(withIndex index: Int) -> Board
    func getAlert(_ alert: UIAlertController)
    func popToRoot()
}

final class BoardViewPresenter: BoardViewPresenterProtocol {
    
    weak var boardCollectionViewCell: BoardCollectionViewCellProtocol?
    var router: RouterProtocol?
    var boards: [Board]?
    
    //MARK: - init(_:)
    init(router: RouterProtocol,
         boardCollectionViewCell: BoardCollectionViewCellProtocol) {
        self.router = router
        self.boardCollectionViewCell = boardCollectionViewCell
        
        boards = [
            Board(title: "Todo", items: ["Database Migration", "Schema Design", "Storage Management", "Model Abstraction"]),
            Board(title: "In Progress", items: ["Push Notification", "Analytics", "Machine Learning"]),
            Board(title: "Done", items: ["System Architecture", "Alert & Debugging"])
        ]
    }
    
    //MARK: - public methods
    func notificationTapped() {
        
    }
    
    func addIndexPath(at indexPath: IndexPath) {
        boardCollectionViewCell?.addTableViewCell(at: indexPath)
    }
    
    func addToBoards(newElement element: Board) {
        boards?.append(element)
    }
    
    func getBoard(withIndex index: Int) -> Board {
        if let board = boards?[index] {
            return board
        }else {
            return Board(title: "Nothing", items: ["Error"])
        }
    }
    
    func getAlert(_ alert: UIAlertController) {
        router?.showAlert(alert)
    }
    
    func popToRoot() {
        router?.popToRoot()
    }
    
}

