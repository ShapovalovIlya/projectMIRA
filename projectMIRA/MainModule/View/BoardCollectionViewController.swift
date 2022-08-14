//
//  MainCollectionViewController.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 28.07.2022.
//

import UIKit

final class BoardCollectionViewController: UICollectionViewController {
    
    var presenter: BoardViewPresenterProtocol!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        setupView()
        setupNavigationBar()
        updateCollextionView(with: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        updateCollextionView(with: size)
    }
    
    //MARK: - Private Methods
    @objc private func notificationTap() {
        
    }
    
    @objc private func addListTapped() {
        let alertController = UIAlertController(
            title: "Add List",
            message: nil,
            preferredStyle: .alert
        )
        
        alertController.addTextField()
        
        let alertAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard
                let self = self,
                let boards = self.presenter.boards,
                let text = alertController.textFields?.first?.text,
                !text.isEmpty
            else { return }
            
            self.presenter.addToBoards(newElement: Board(title: text, items: []))
            
            let addedIndexPath = IndexPath(item: boards.count - 1, section: 0)
            self.collectionView.insertItems(at: [addedIndexPath])
            self.collectionView.scrollToItem(at: addedIndexPath, at: .centeredHorizontally, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        
        self.presenter.getAlert(alertController)
    }
    
    @objc private func popToRoot() {
        presenter.popToRoot()
    }
    
}

// MARK: UICollection View Data Source
extension BoardCollectionViewController {
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.boards?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.BoardCollectionViewCellId, for: indexPath) as! BoardCollectionViewCell
        let board = presenter.getBoard(withIndex: indexPath.item)
        cell.presenter = presenter
        cell.setup(with: board)
        return cell
    }
}

// MARK: UICollection View Delegate
extension BoardCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
}

//MARK: - UICollection View Delegate Flow Layout
extension BoardCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: 320, height: 480)
        return itemSize
    }
}

//MARK: - Private Extension
private extension BoardCollectionViewController {
    func setupView() {
        collectionView.backgroundColor = .white
        self.collectionView!.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: K.BoardCollectionViewCellId)
    }
    
    func setupNavigationBar() {
        
        let notificationNavbar = UIBarButtonItem(
            image: UIImage(systemName: "bell.circle"),
            style: .plain,
            target: self,
            action: #selector(notificationTap)
        )
        
        let addButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addListTapped)
        )
                
        navigationItem.rightBarButtonItems = [ notificationNavbar, addButtonItem]
    }
    
    func updateCollextionView(with size: CGSize) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.itemSize = CGSize(width: 255, height: size.height * 0.8)
    }
}
