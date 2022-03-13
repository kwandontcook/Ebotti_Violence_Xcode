//
//  Contact_List_cell_5.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 6/3/22.
//

import UIKit

class Contact_List_cell_5: UICollectionViewCell {
    
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
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        text_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor).isActive = true
        text_view.trailingAnchor.constraint(equalTo: main_view.trailingAnchor).isActive = true
        text_view.bottomAnchor.constraint(equalTo: main_view.bottomAnchor).isActive = true
    }
    

    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.clear
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.masksToBounds = true
        return v
    }()
    
    let text_view : UITextView = {
        let label = UITextView()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.isEditable = false
        label.isScrollEnabled = false
        return label
    }()
}
