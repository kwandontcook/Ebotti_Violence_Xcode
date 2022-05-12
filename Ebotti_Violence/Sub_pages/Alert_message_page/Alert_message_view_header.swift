//
//  Alert_message_view_header.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 24/3/2022.
//

import UIKit

class Alert_message_view_header: UICollectionReusableView {
        
    
    let header_label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode  = NSLineBreakMode.byWordWrapping; 
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        addSubview(header_label)
        header_label.frame = bounds
    }
}
