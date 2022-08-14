//
//  BoardCollectionReusableView.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 29.07.2022.
//

import UIKit

final class BoardCollectionViewCell: UICollectionViewCell {
    
    weak var presenter: BoardViewPresenterProtocol?
    var board: Board?
    
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
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Public methods
    func setup(with board: Board) {
        self.board = board
        tableView.reloadData()
    }
    
    //MARK: - Private methods
    
    
}

//MARK: - Board Collection View Cell Protocol
extension BoardCollectionViewCell: BoardCollectionViewCellProtocol {
    func addTableViewCell(at addedIndexPath: IndexPath) {
        self.tableView.insertRows(at: [addedIndexPath], with: .automatic)
        self.tableView.scrollToRow(at: addedIndexPath, at: .bottom, animated: true)
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
        return board?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return board?.title ?? "Nothing"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.BoardTableViewCellId, for: indexPath) as! BoardTableViewCell
        if let cellTitle = board?.items[indexPath.row] {
            cell.setTitle(with: cellTitle)
        }else{
            cell.setTitle(with: "Coud't set title!")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: K.BoardHeaderViewId) as! BoardHeaderView
        header.presenter = presenter
        return header
    }
    
}

//MARK: - Private Extension
private extension BoardCollectionViewCell {
    func setupView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = .red
        tableView.register(BoardTableViewCell.self, forCellReuseIdentifier: K.BoardTableViewCellId)
        tableView.register(BoardHeaderView.self, forHeaderFooterViewReuseIdentifier: K.BoardHeaderViewId)
        tableView.tableFooterView = UIView()
        addSubview(tableView)
    }
    
    func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
