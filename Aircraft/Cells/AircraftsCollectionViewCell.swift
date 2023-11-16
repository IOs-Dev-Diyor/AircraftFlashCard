//
//  AircraftsCollectionViewCell.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import UIKit
import SnapKit

protocol AircraftsCollectionViewCellDelegate: AnyObject {
    func buttonTapped(sender: UIButton)
}

class AircraftsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AircraftsCollectionViewCell"
    
    public weak var delegate: AircraftsCollectionViewCellDelegate?
    
        
    private let flagImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    private let roleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let roleIcon: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "role")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .black
        
        return image
    }()

    
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .purple
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    public let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        label.numberOfLines = 2
        return label
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .purple.withAlphaComponent(0.2)
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.addSubview(name)
        contentView.addSubview(imageView)
        imageView.addSubview(flagImage)
        name.addSubview(yearLabel)
        contentView.addSubview(roleIcon)
        contentView.addSubview(roleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(imageView.snp.width)
            make.bottom.equalTo(name.snp.top).offset(-5)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.equalTo(10)
            make.right.equalTo(0)
            if name.numberOfLines == 1 {
                make.height.equalTo(20)
            }
            make.height.equalTo(40)
        }
    
        
        flagImage.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        roleIcon.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.width.equalTo(30)
            make.width.equalTo(30)
            make.bottom.equalTo(contentView.bottom).offset(-45)
        }
        
        roleLabel.snp.makeConstraints { make in
            make.left.equalTo(roleIcon.snp.right).offset(5)
            make.right.lessThanOrEqualTo(-5)
            if roleLabel.numberOfLines == 1 {
                make.height.equalTo(20)
            }
            make.height.equalTo(60)
            make.bottom.equalTo(contentView.bottom).offset(-25)
        }
        
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(1)
            make.right.equalTo(-3)
            make.height.equalTo(25)
            make.width.equalTo(40)
            make.bottom.equalTo(name.snp.top).offset(-5)
        }
        
        
        
        
        
    
    }
        public func configure(_ model: Aircrafts) {
            imageView.image = UIImage(named: model.image)
            name.text = model.name
            flagImage.image = UIImage(named: model.flag)
            yearLabel.text = model.year
            roleLabel.text = model.role
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
