//
//  FlashcardsViewController.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import UIKit

class InformationsViewController: UIViewController {
    
    var infoArray = [Informations]()
    
    var a = 1

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InformationTableViewCell.self, forCellReuseIdentifier: InformationTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 230/250, green: 209/250, blue: 252/250, alpha: 1)
        title = "Information"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        for i in ObjectInformations.informations {
           
            
            let object = Informations(image: "image\(a)", about: i)
           
            infoArray.append(object)
            a += 1
        }
        
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.leftBarButtonItem = leftBarButton
        leftBarButton.tintColor = .black
    }
    
    @objc func didTapLeftButton() {
        navigationController?.popViewController(animated: true)
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension InformationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
         
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier, for: indexPath) as! InformationTableViewCell
        let obj = infoArray[indexPath.row]
        cell.configure(obj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
}
