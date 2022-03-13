//
//  Main_page_col_cell_4.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 28/2/22.
//

import UIKit

class Main_page_col_cell_5: UICollectionViewCell {
    
    // UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
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
    
    // Declare variables - header
    let header : UITextView = {
        let label = UITextView()
        label.text = "Message d'alerte"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        label.layer.borderColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor
        label.layer.borderWidth = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isScrollEnabled = false
        label.isEditable = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let stack_view : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let stack_middle_view : UIView = {
        let v = UIView()
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let alertVoice_button: UIButton = {
        let btn = UIButton()
        btn.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "user_settings"), for: .normal)
        return btn
    }()
    
    var navigationController: UINavigationController?
    
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
        self.contentView.backgroundColor = .clear
        // Setting for main_view
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        // Setting for main_view
        self.main_view.addSubview(header)
        header.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 16).isActive = true
        header.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.9).isActive = true
        
        // Setting for stack_view
        self.main_view.addSubview(stack_view)
        stack_view.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        stack_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 16).isActive = true
        stack_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.7).isActive = true
        stack_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.9).isActive = true
        
        // Setting for alertVoice_button
        self.stack_view.addSubview(stack_middle_view)
        stack_middle_view.topAnchor.constraint(equalTo: stack_view.topAnchor).isActive = true
        stack_middle_view.centerXAnchor.constraint(equalTo: stack_view.centerXAnchor).isActive = true
        stack_middle_view.centerYAnchor.constraint(equalTo: stack_view.centerYAnchor).isActive = true
        stack_middle_view.widthAnchor.constraint(equalTo: stack_view.widthAnchor, multiplier: 0.3).isActive = true
        
        self.stack_middle_view.addSubview(alertVoice_button)
        alertVoice_button.topAnchor.constraint(equalTo: stack_middle_view.topAnchor).isActive = true
        alertVoice_button.centerXAnchor.constraint(equalTo: stack_middle_view.centerXAnchor).isActive = true
        alertVoice_button.centerYAnchor.constraint(equalTo: stack_middle_view.centerYAnchor).isActive = true
        alertVoice_button.widthAnchor.constraint(equalTo: stack_middle_view.heightAnchor).isActive = true
        
        // Bind action
        alertVoice_button.addTarget(self, action: #selector(q1), for: .touchUpInside)
    }
    
    @objc func q1(){
        let vc = Contact_List_view()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
