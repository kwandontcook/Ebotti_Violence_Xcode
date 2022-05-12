//
//  Alert_message_view_cell_2.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 24/3/2022.
//

import UIKit

class Alert_message_view_cell_2: UICollectionViewCell {
    
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func remove_component(){
        self.text_view.removeFromSuperview()
        self.text_view_content.removeFromSuperview()
        self.main_view.removeFromSuperview()
    }
    
    let main_view :UIView = {
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
        return v
    }()
    
    let text_view : UITextView = {
        let label = UITextView()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.isEditable = false
        label.isScrollEnabled = false
        return label
    }()
    
    let text_view_content : UITextView = {
        let label = UITextView()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.isEditable = false
        label.isScrollEnabled = false
        return label
    }()
    
    
    func init_component(){
        self.remove_component()
        // Create mainView
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        text_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        text_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        text_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: text_view.bottomAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        // Add component
        self.main_view.addSubview(text_view_content)
        text_view_content.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        text_view_content.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        text_view_content.heightAnchor.constraint(equalTo: main_view.heightAnchor).isActive = true
        text_view_content.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.92).isActive = true
    }
    
    func init_component_footer(){
        self.remove_component()
        // Create mainView
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        text_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        text_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9).isActive = true
        text_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
    }
    
}
