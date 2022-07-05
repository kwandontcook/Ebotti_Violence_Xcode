//
//  Contact_List_cell_4.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 6/3/22.
//

import UIKit

class Contact_List_cell_4: UICollectionViewCell {
    
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
        // Create mainView
        self.contentView.addSubview(main_view)
//        CGRect frame = CGRect(x: 10, y: 10, width: 100, height: 300);
//        self.contentView.frame = frame
        main_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        //main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        // Add component
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        text_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor).isActive = true
        text_view.trailingAnchor.constraint(equalTo: main_view.trailingAnchor).isActive = true
        text_view.bottomAnchor.constraint(equalTo: main_view.bottomAnchor).isActive = true
        
    }
    

    let main_view :UIView = {
        //let frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        let v = UIView()
        v.backgroundColor = UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.clear.cgColor
        v.layer.borderWidth = 0.3
        v.layer.cornerRadius = 5
        // Setting for shadow
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.5
        v.layer.shadowOffset = CGSize.zero
        v.layer.shadowRadius = 5
        v.layer.masksToBounds = false
        // v.layer.backgroundColor = CGColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        return v
    }()
    
    let text_view : UITextView = {
        let label = UITextView()
        label.text = ""
        label.backgroundColor = UIColor.cyan
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.isEditable = false
        label.isScrollEnabled = false
        label.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return label
    }()
    
    
}
