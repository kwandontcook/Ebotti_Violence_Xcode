//
//  Info_page_col.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 1/3/22.
//

import UIKit

class Info_page_col: UICollectionViewCell {
    
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        init_component()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func init_component(){
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        // Add text label
        self.main_view.addSubview(header)
        header.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.6).isActive = true
        
        // icon
        self.main_view.addSubview(icon)
        icon.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 10).isActive = true
        icon.trailingAnchor.constraint(equalTo: main_view.trailingAnchor, constant: -10).isActive = true
        icon.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.6).isActive = true
        icon.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.15).isActive = true
    }
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor
        v.layer.borderWidth = 0.3
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        return v
    }()
    
    let header : UILabel = {
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let icon : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
}
