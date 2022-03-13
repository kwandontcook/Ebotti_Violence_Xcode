//
//  Contact_Lists_footer.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 6/3/22.
//

import UIKit

class Contact_Lists_footer: UICollectionReusableView {
     
    let footer_label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        addSubview(footer_label)
        footer_label.frame = bounds
    }
    
}
