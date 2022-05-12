//
//  Alert_message_view_footer.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 24/3/2022.
//

import UIKit

class Alert_message_view_footer: UICollectionReusableView {
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
