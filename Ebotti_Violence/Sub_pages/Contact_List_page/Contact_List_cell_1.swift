//
//  Contact_List_cell_1.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 6/3/22.
//

import UIKit
import Contacts
import ContactsUI

class Contact_List_cell_1: UICollectionViewCell {
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
    
    func add_phone_component_1(){
        // Add Name_label
        self.main_view.addSubview(Name_label)
        Name_label.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 10).isActive = true
        Name_label.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        Name_label.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.2).isActive = true
        Name_label.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.3).isActive = true
        
        // Add Name_text_view
        self.main_view.addSubview(Name_text_view)
        Name_text_view.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 10).isActive = true
        Name_text_view.leadingAnchor.constraint(equalTo: Name_label.trailingAnchor).isActive = true
        Name_text_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.2).isActive = true
        Name_text_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.45).isActive = true
        
        self.main_view.addSubview(Add_user_img_view)
        Add_user_img_view.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 5).isActive = true
        Add_user_img_view.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        Add_user_img_view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        Add_user_img_view.widthAnchor.constraint(equalToConstant: 30).isActive = true
     
    }
    
    func add_phone_component_2(){
        // Add Telephone_label
        self.main_view.addSubview(Telephone_label)
        Telephone_label.topAnchor.constraint(equalTo: Name_label.bottomAnchor, constant: 30).isActive = true
        Telephone_label.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        Telephone_label.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.2).isActive = true
        Telephone_label.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.3).isActive = true
            
        // Add Telephone_text_view
        self.main_view.addSubview(Telephone_text_view)
        Telephone_text_view.topAnchor.constraint(equalTo: Name_text_view.bottomAnchor, constant: 30).isActive = true
        Telephone_text_view.leadingAnchor.constraint(equalTo: Telephone_label.trailingAnchor).isActive = true
        Telephone_text_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.2).isActive = true
        Telephone_text_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.45).isActive = true
            
        // Delete_img_view
        self.main_view.addSubview(Delete_img_view)
        Delete_img_view.topAnchor.constraint(equalTo: Add_user_img_view.bottomAnchor, constant: 15).isActive = true
        Delete_img_view.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60).isActive = true
        Delete_img_view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        Delete_img_view.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func init_component(){
        // Create mainView
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        add_phone_component_1()
        add_phone_component_2()
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
    
    let Name_label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Telephone_label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Name_text_view : UILabel = {
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Telephone_text_view : UILabel = {
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Add_user_img_view : UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "user_add"), for: .normal)
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let Delete_img_view : UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "phone_remove"), for: .normal)
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    

    
}
