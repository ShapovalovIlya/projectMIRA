//
//  BoardTableViewCell.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 29.07.2022.
//

import UIKit

final class BoardTableViewCell: UITableViewCell {
    
    private let tableCellTitle: UILabel = {
        let label = UILabel()
        label.text = "I'm Title!"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableCellContent: UILabel = {
        let label = UILabel()
        label.text = "I'm Content!"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: - Public methods
    func setTitle(with title: String) {
        tableCellTitle.text = title
    }
  
}

//MARK: - Private Extension
private extension BoardTableViewCell {
    
    func setupCell() {
        backgroundColor = .white
        addSubview(tableCellTitle)
        addSubview(tableCellContent)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableCellTitle.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tableCellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tableCellTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            tableCellTitle.heightAnchor.constraint(equalToConstant: frame.height / 2),
        
            tableCellContent.topAnchor.constraint(equalTo: tableCellTitle.bottomAnchor, constant: 0),
            tableCellContent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tableCellContent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            tableCellContent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
