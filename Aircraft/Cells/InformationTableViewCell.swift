//
//  InformationTableViewCell.swift
//  Aircraft
//
//  Created by Diyorbek Xikmatullayev on 04/10/23.
//

import UIKit
import SnapKit

class InformationTableViewCell: UITableViewCell {
    
    static let identifier = "InformationTableViewCell"
    
    private let infoImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .purple
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    public var aboutLabel: UILabel = {
        let label = UILabel()
//        view.text = "salom salom salom salom salom salom salom salom salom salom salom salom "
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 50
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray.withAlphaComponent(0.4)
        contentView.addSubview(infoImageView)
        contentView.addSubview(aboutLabel)
        
        infoImageView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(infoImageView.snp.width)
            make.bottom.equalTo(aboutLabel.snp.top).offset(-5)
        }
        
        aboutLabel.snp.makeConstraints { make in
                  make.top.equalTo(infoImageView.snp.bottom).offset(5)
                  make.left.equalTo(5)
                  make.bottom.equalTo(-5)
                  make.right.lessThanOrEqualTo(-5)
              }
        
    }
    
    public func configure(_ model: Informations) {
        infoImageView.image = UIImage(named: model.image)
        aboutLabel.text = model.about
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
