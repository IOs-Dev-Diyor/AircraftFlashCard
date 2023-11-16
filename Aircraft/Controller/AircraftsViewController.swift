//
//  AircraftsViewController.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import UIKit
import JDTabBarController
class AircraftsViewController: UIViewController {
    
    var a = 1
    
    static var aircrafts = [Aircrafts]()
    
   
    
    let mg: CGFloat = 10
    let wd = UIScreen.main.bounds.width
    lazy var collectionView: UICollectionView = {
        
        let layot = UICollectionViewFlowLayout()
        layot.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 20
        collectionView.contentInset = UIEdgeInsets(top: 10, left: mg, bottom: 100, right: mg)
        collectionView.register(AircraftsCollectionViewCell.self, forCellWithReuseIdentifier: AircraftsCollectionViewCell.identifier)
        return collectionView
    }()
    
    lazy var buttun: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let backroundImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "aircraftbackroundimage")
        return image
    }()
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(backroundImage)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        title = "Aircrafts"
       
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(didTapLeftButton))
        navigationItem.leftBarButtonItem = leftBarButton
        leftBarButton.tintColor = .black
        
        AircraftsViewController.aircrafts = [
            Aircrafts(name: "MiG-21", year: "1955", role: "Fighter and interceptor aircraft", flag: "sssr", image: "image1", tag: 1),
            Aircrafts(name: "Waco 10", year: "1927", role: "light passenger transport", flag: "usa", image: "image2", tag: 2),
            Aircrafts(name: "Ercoup", year: "1930", role: "carrier", flag: "not", image: "image3", tag: 3),
            Aircrafts(name: "B-24", year: "1939", role: "Heavy bomberAnti-submarine warfare Maritime patrol aircraft", flag: "usa", image: "image4", tag: 4),
            Aircrafts(name: "Mitsubishi Zero", year: "1939", role: "Carrier-based fighter aircraft", flag: "japan", image: "image5", tag: 5),
            Aircrafts(name: "Eclipse 500", year: "2002", role: "Very light jet", flag: "usa", image: "image6", tag: 6),
            Aircrafts(name: "Corvalis", year: "2010", role: "Personal aircraft", flag: "columbia", image: "image7", tag: 7),
            Aircrafts(name: "Boeing 787", year: "2009", role: "passenger aircraft", flag: "usa", image: "image8", tag: 8),
            Aircrafts(name: "Luscombe", year: "1937", role: "civilian", flag: "usa", image: "image9", tag: 9),
            Aircrafts(name: "DA40 DiamondStar", year: "2009", role: "carrier", flag: "england", image: "image10", tag: 10),
            Aircrafts(name: "PC-12", year: "1991", role: "Passenger and cargo aircraft", flag: "shvetsariya", image: "image11", tag: 11),
            Aircrafts(name: "Hawker Beechcraft Premier", year: "1998", role: "Business Jet", flag: "usa", image: "image12", tag: 12),
            Aircrafts(name: "SR-71", year: "1964", role: "Strategic reconnaissance aircraft", flag: "usa", image: "image13", tag: 13),
            Aircrafts(name: "Hawker Siddeley 125", year: "1962", role: "Business Jet", flag: "england", image: "image14", tag: 14),
            Aircrafts(name: "Bleriot XI", year: "1909", role: "    Civil tourer/trainer/military", flag: "france", image: "image15", tag: 15),
            Aircrafts(name: "Piper Apache", year: "1952", role: "Twin-engined light piston utility", flag: "usa", image: "image16", tag: 16),
            Aircrafts(name: "Rutan Voyager", year: "1984", role: "Record plane", flag: "usa", image: "image17", tag: 17),
            Aircrafts(name: "Falcon 7X", year: "2015", role: "Intercontinental business jet", flag: "france", image: "image18", tag: 18),
            Aircrafts(name: "TBM-700", year: "1990", role: "Executive transport and civil utility", flag: "france", image: "image19", tag: 19),
            Aircrafts(name: "Teylorcraft Cub", year: "1930", role: "Light utility aircraft", flag: "usa", image: "image20", tag: 20),
            Aircrafts(name: "F-22", year: "1997", role: "Air superiority fighter", flag: "usa", image: "image21", tag: 21),
            Aircrafts(name: "Cessna 208 Caravan", year: "1982", role: "Utility aircraft", flag: "usa", image: "image22", tag: 22),
            Aircrafts(name: "A320", year: "1987", role: "Narrow-body jet airliner", flag: "france", image: "image23", tag: 23),
            Aircrafts(name: "Aeronca Champion", year: "1944", role: "Light utility aircraft", flag: "usa", image: "image24", tag: 24),
            Aircrafts(name: "Beechcraft Starship", year: "1986", role: "Executive transport", flag: "usa", image: "image25", tag: 25),
            Aircrafts(name: "R22", year: "1975", role: "Light utility and trainer helicopter", flag: "usa", image: "image26", tag: 26),
            Aircrafts(name: "F-16", year: "1974", role: "Multirole fighter, air superiority fighter", flag: "usa", image: "image27", tag: 27),
            Aircrafts(name: "Gossamer Albatros", year: "1979", role: "to the experience", flag: "france", image: "image28", tag: 28),
            Aircrafts(name: "Gulfstream", year: "1958", role: "Subsidiary", flag: "usa", image: "image29", tag: 29),
            Aircrafts(name: "P-38", year: "1939", role: "Fighter Fighter-bomber Aerial reconnaissance", flag: "usa", image: "image30", tag: 30),
        ]
    }
    
    @objc func didTapLeftButton() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backroundImage.frame = view.bounds
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.left.equalTo(0)
            make.height.equalTo(view.height)
        }
    }
    
    @objc func clearbtnTap(_ sender: UIButton) {
        print("hello")
    }

}

extension AircraftsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AircraftsViewController.aircrafts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AircraftsCollectionViewCell.identifier, for: indexPath) as! AircraftsCollectionViewCell
        let obj = AircraftsViewController.aircrafts[indexPath.row]
        cell.configure(obj)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (wd - 3*mg)/2, height:  (wd - 3*mg)/2 + 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
}


