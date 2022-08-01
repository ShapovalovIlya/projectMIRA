//
//  BoardHeaderView.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 29.07.2022.
//

import UIKit

final class BoardHeaderView: UITableViewHeaderFooterView {
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
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
    private func setupView() {
        contentView.addSubview(addButton)
    }
    
    @objc private func addButtonTap() {
        print("Add button tapped!")
    }
    
}

private extension BoardHeaderView {
    func setConatraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
