//
//  Extensions.swift
//  Aircrafts
//
//  Created by Diyorbek Xikmatullayev on 03/10/23.
//

import Foundation
import UIKit

extension UIView {
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    public var left: CGFloat {
        return frame.origin.x
    }
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
}
