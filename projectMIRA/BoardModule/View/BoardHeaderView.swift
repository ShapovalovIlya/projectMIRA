//
//  BoardHeaderView.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 29.07.2022.
//

import UIKit

final class BoardHeaderView: UITableViewHeaderFooterView {
    
    weak var presenter: BoardViewPresenterProtocol?
    weak var mainView: BoardCollectionViewCell?
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    //MARK: - init(_:)
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConatraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Method
    @objc private func addButtonTap() {
        print("Add button tapped!")

        let alertController = UIAlertController(title: "Add item", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard
                let self = self,
                let text = alertController.textFields?.first?.text,
                !text.isEmpty
            else { return }
         
            guard let data = self.mainView?.board else { return }
            
            data.items.append(text)
            
            let addedIndexPath = IndexPath(item: data.items.count - 1, section: 0)
            
            self.presenter?.addIndexPath(at: addedIndexPath)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.presenter?.getAlert(alertController)
    }
    
}

private extension BoardHeaderView {
    func setupView() {
        
        contentView.addSubViews([addButton])
    }
    
    func setConatraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
