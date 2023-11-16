//
//  AbountAppViewController.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import UIKit

class AbountAppViewController: UIViewController {
   
    
    private let label: UILabel = {
        let label = UILabel()
        label.text =  "This app contains the originality plane with pictures Flying's Top 100. It will happen helps to obtain information about the aircraft and improve your knowledge. Through the application you will increase your knowledge. You will get a lot of interesting information"
        label.font = UIFont(name: "Cochin-Italic", size: 30)
        label.textAlignment = .left
        label.numberOfLines = 20
        label.layer.cornerRadius = 20
//        label.backgroundColor = .purple.withAlphaComponent(0.4)
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "about")
        image.layer.cornerRadius = 10
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 230/250, green: 209/250, blue: 252/250, alpha: 1)
        title = "About App"
        view.addSubview(label)
        view.addSubview(imageView)
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.leftBarButtonItem = leftBarButton
        leftBarButton.tintColor = .black
    }
    
    @objc func didTapLeftButton() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 10,
                                 y: 100,
                                 width: view.width - 20,
                                 height: 325)
        
        imageView.frame = CGRect(x: 10,
                                 y: label.bottom + 15,
                                 width: view.width - 20,
                                 height: 370)
    }
   


}
