//
//  BoardTableViewCell.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 29.07.2022.
//

import UIKit

final class BoardTableViewCell: UITableViewCell {
    
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.text = "I'm Title!"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cellContent: UILabel = {
        let label = UILabel()
        label.text = "I'm Content!"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        
      //  setupCell()
       // setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupCell() {
        backgroundColor = .white
        addSubview(cellTitle)
        addSubview(cellContent)
    }

}

//MARK: - Set Constraints
private extension BoardTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cellTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            cellTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            cellTitle.heightAnchor.constraint(equalToConstant: frame.height / 2)
        ])
        
        NSLayoutConstraint.activate([
            cellContent.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 0),
            cellContent.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            cellContent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            cellContent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
