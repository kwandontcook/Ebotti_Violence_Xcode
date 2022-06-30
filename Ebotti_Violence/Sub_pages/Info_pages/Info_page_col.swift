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
        
//        let top = 5.0;
//        let bottom = 5.0;
//        let left = 5.0;
//        let right = 5.0;
//        header.frame = CGRect(x: 0, y: 0, width: header.frame.width + left + right, height: header.frame.height + top + bottom)
//        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
//        header.drawText(in: header.)
        
        
        header.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 0).isActive = true
        //header.bottomAnchor.constraint(equalTo: main_view.bottomAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 1.0).isActive = true
        header.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.6).isActive = true
        
        // icon
        self.main_view.addSubview(icon)
        icon.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 5).isActive = true
        icon.trailingAnchor.constraint(equalTo: main_view.trailingAnchor, constant: -5).isActive = true
        icon.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.8).isActive = true
        icon.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.25).isActive = true
    }
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor
        v.layer.borderWidth = 0.3
        v.layer.cornerRadius = 5
        
        // Setting for shadow
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize.zero
        v.layer.shadowRadius = 5
        v.layer.masksToBounds = false

        
        return v
    }()
    
    let header : UILabel = {
        
       // let frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        
        label.baselineAdjustment = .none
        
        
        
//        let unconstrainedSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
//        label.heightAnchor.constraint(equalToConstant: label.sizeThatFits(unconstrainedSize).height).isActive = true
        
        //label.backgroundColor = UIColor.cyan
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.sizeToFit()
        return label
    }()
    
    let icon : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
}
