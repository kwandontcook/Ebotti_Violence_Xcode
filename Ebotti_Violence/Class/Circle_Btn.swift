//
//  Custom_Btn_View.swift
//  DogApp
//
//  Created by kwok chung  kwan on 5/4/2022.
//

import Foundation
import UIKit

class Circle_Btn: UIButton{
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         self.layer.cornerRadius = self.bounds.size.width / 2
         self.clipsToBounds = true
     }
}
