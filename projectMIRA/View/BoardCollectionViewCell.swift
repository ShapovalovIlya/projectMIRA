//
//  BoardCollectionReusableView.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 29.07.2022.
//

import UIKit

final class BoardCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Private Properties
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBlue
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - init(_:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setDelegates()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    private func setupView() {
        self.backgroundColor = .red
        tableView.register(BoardTableViewCell.self, forCellReuseIdentifier: K.BoardTableViewCellId)
        addSubview(tableView)
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

//MARK: - Table View Delegate
extension BoardCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

//MARK: - Table View Data Source
extension BoardCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.BoardTableViewCellId, for: indexPath) as! BoardTableViewCell
        return cell
    }
    
}

//MARK: - Set Constraints
private extension BoardCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
