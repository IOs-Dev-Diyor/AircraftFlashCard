//
//  Models.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import Foundation
import UIKit

struct ButtonData {
    var image: String
    var tag: Int
}
 

struct Aircrafts {
    var name: String
    var year: String
    var role: String
    var flag: String
    var image: String
    var tag: Int
}

struct Informations {
    var image: String
    var about: String
}

struct Qustion {
    let text: String
    let answer: String
    let color: UIColor
    let image: UIImage
}
