//
//  Contacy_Lists_header.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 6/3/22.
//

import UIKit

class Contact_Lists_header: UICollectionReusableView {
    
    let header_label : UILabel = {
        let label = UILabel()
       // label.heightAnchor.constraint(equalTo: label.heightAnchor, multiplier: 1.0, constant: 50.0)
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        addSubview(header_label)
        header_label.frame = bounds
    }
    
}
