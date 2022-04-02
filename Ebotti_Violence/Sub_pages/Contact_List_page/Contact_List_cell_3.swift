//
//  Contact_List_cell_2.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 6/3/22.
//

import UIKit
import DLRadioButton
import CoreData

class Contact_List_cell_3: UICollectionViewCell {
    
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
        main_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        // Add component
        self.add_component()
    }
    
    func add_component(){
        self.main_view.addSubview(firstContact_cbvoice)
        firstContact_cbvoice.topAnchor.constraint(equalTo: main_view.topAnchor,constant: 5).isActive = true
        firstContact_cbvoice.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 24).isActive = true
        firstContact_cbvoice.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.45).isActive = true
        firstContact_cbvoice.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.85).isActive = true
        
        
        self.main_view.addSubview(twoContacts_cbvoice)
        twoContacts_cbvoice.topAnchor.constraint(equalTo: firstContact_cbvoice.bottomAnchor).isActive = true
        twoContacts_cbvoice.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 24).isActive = true
        twoContacts_cbvoice.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.45).isActive = true
        twoContacts_cbvoice.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.85).isActive = true
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
    
    
    var firstContact_cbvoice : DLRadioButton = {
        let btn = DLRadioButton()
        btn.setTitle("", for: .normal);
        btn.setTitleColor(.black, for: .normal)
        btn.iconColor = .systemGray;
        btn.indicatorColor = .red;
        btn.isIconSquare = true
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 12.0)
        btn.isSelected = true
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        btn.contentHorizontalAlignment = .left
        btn.contentVerticalAlignment = .center
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var twoContacts_cbvoice : DLRadioButton = {
        let btn = DLRadioButton()
        btn.setTitle("", for: .normal);
        btn.setTitleColor(.black, for: .normal)
        btn.iconColor = .systemGray;
        btn.indicatorColor = .red;
        btn.isIconSquare = true
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 12.0)
        btn.isSelected = true
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        btn.contentHorizontalAlignment = .left
        btn.contentVerticalAlignment = .center
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
}
