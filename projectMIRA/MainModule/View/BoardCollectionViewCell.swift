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
        tableView.register(BoardHeaderView.self, forHeaderFooterViewReuseIdentifier: K.BoardHeaderViewId)
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height / 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5
    }
    
    
    
}

//MARK: - Table View Data Source
extension BoardCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.BoardTableViewCellId, for: indexPath) as! BoardTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: K.BoardHeaderViewId) as! BoardHeaderView
        return header
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
