//
//  MainCollectionViewController.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 28.07.2022.
//

import UIKit

final class MainCollectionViewController: UICollectionViewController {
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        setupView()
        setupNavigationBar()
    }
    
    //MARK: - Private Methods
    private func setupView() {
        collectionView.backgroundColor = .white
        self.collectionView!.register(BoardCollectionViewCell.self, forCellWithReuseIdentifier: K.BoardCollectionViewCellId)
    }
    
    private func setupNavigationBar() {
        let notificationNavbar = UIBarButtonItem(
            image: UIImage(systemName: "bell.circle"),
            style: .plain,
            target: self,
            action: #selector(notificationTap)
        )
        
        navigationItem.rightBarButtonItem = notificationNavbar
    }
    
    @objc private func notificationTap() {
        
    }
    
}

// MARK: UICollection View Data Source
extension MainCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.BoardCollectionViewCellId, for: indexPath) as! BoardCollectionViewCell
        return cell
    }
}

// MARK: UICollection View Delegate
extension MainCollectionViewController {
    
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
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: 320, height: 480)
        return itemSize
    }
}
