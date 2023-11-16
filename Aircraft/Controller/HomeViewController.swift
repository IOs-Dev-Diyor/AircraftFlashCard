//
//  ViewController.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let mg: CGFloat = 25
    let hd = UIScreen.main.bounds.width
    lazy var x = (hd - 3*mg)/2
    var a = 0
    
    private let backroundImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "backroundimage")
        return image
    }()
    
    let buttonData = [
        ButtonData(image: "aircraft", tag: 0),
        ButtonData(image: "information", tag: 1),
        ButtonData(image: "game", tag: 2),
        ButtonData(image: "about1", tag: 3),
    ]
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "List of planes with pictures"
        label.textColor = .blue
        label.textAlignment = .center
        label.font = UIFont(name: "Cochin-Italic", size: 40)
        label.numberOfLines = 2
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(backroundImage)
        view.addSubview(label)
        buttons()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backroundImage.frame = view.bounds
        label.frame = CGRect(x: 30,
                             y: 150,
                             width: view.width - 60,
                             height: 100)
    }

  private  func buttons() {
        for i in 0...1 {
            for j in 0...1 {
                let button = UIButton()
                button.backgroundColor = .white
                button.frame = CGRect(x: CGFloat(i)*(x + mg) + mg, y: 270 + CGFloat(j)*(x + mg) + mg , width: x, height: x)
                button.tag = buttonData[a].tag
                button.setImage(UIImage(named:  buttonData[a].image)?.withRenderingMode(.alwaysTemplate), for: .normal)
                button.tintColor = .purple
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.borderWidth = 6
                button.layer.cornerRadius = 20
                button.layer.shadowColor = UIColor.gray.cgColor
                button.layer.shadowOffset = CGSize(width: 0, height: 3)
                button.layer.shadowRadius = 20
                button.layer.opacity = 0.4
                button.layer.shadowPath = nil
               
                a += 1
                view.addSubview(button)
                button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            }
        }
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            let vc = AircraftsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = InformationsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = GameQuizViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = AbountAppViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            fatalError("error")
        }
     
    
    }
    
}

