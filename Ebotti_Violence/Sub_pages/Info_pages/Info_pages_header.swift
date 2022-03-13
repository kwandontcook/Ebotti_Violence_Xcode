//
//  Info_pages_header.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 1/3/22.
//

import UIKit

class Info_pages_header: UICollectionReusableView {

    let header_label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        addSubview(header_label)
        header_label.frame = bounds
    }
}
