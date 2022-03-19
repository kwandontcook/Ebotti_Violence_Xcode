//
//  Main_page_col_cell_1.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 27/2/22.
//

import UIKit

class Main_page_col_cell_1: UICollectionViewCell {
    
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
        stack_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.6).isActive = true
        stack_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.9).isActive = true
        
        // Bind action to button
        police_button.addTarget(self, action: #selector(police_call), for: .touchUpInside)
        fireman_button.addTarget(self, action: #selector(fireman_call), for: .touchUpInside)
        samu_button.addTarget(self, action: #selector(samu_call), for: .touchUpInside)

        // Setting for police button view
        add_police_block()
        add_fireman_block()
        add_samu_block()

    }
    
    func add_police_block(){
        // Setting for police view
        self.stack_view.addSubview(police_view)
        police_view.topAnchor.constraint(equalTo: stack_view.topAnchor).isActive = true
        police_view.leadingAnchor.constraint(equalTo: stack_view.leadingAnchor).isActive = true
        police_view.heightAnchor.constraint(equalTo: stack_view.heightAnchor).isActive = true
        police_view.widthAnchor.constraint(equalTo: stack_view.widthAnchor, multiplier: 0.3).isActive = true
        
        // Setting for police button
        self.police_view.addSubview(police_button)
        police_button.topAnchor.constraint(equalTo: police_view.topAnchor).isActive = true
        police_button.leadingAnchor.constraint(equalTo: police_view.leadingAnchor, constant: 10).isActive = true
        police_button.heightAnchor.constraint(equalTo: police_view.heightAnchor, multiplier: 0.8).isActive = true
        police_button.widthAnchor.constraint(equalTo: police_view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Setting for police text
        self.police_view.addSubview(police_text)
        police_text.topAnchor.constraint(equalTo: police_button.bottomAnchor    ).isActive = true
        police_text.leadingAnchor.constraint(equalTo: police_view.leadingAnchor, constant: 10.0).isActive = true
        police_text.heightAnchor.constraint(equalTo: police_view.heightAnchor, multiplier: 0.2).isActive = true
        police_text.widthAnchor.constraint(equalTo: police_view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    func add_fireman_block(){
        // Setting for police button view
        self.stack_view.addSubview(fireman_view)
        fireman_view.topAnchor.constraint(equalTo: stack_view.topAnchor).isActive = true
        fireman_view.leadingAnchor.constraint(equalTo: police_view.trailingAnchor, constant: 15).isActive = true
        fireman_view.heightAnchor.constraint(equalTo: stack_view.heightAnchor).isActive = true
        fireman_view.widthAnchor.constraint(equalTo: stack_view.widthAnchor, multiplier: 0.3).isActive = true
        
        // Setting for police button button
        self.fireman_view.addSubview(fireman_button)
        fireman_button.topAnchor.constraint(equalTo: fireman_view.topAnchor).isActive = true
        fireman_button.leadingAnchor.constraint(equalTo: fireman_view.leadingAnchor, constant: 10).isActive = true
        fireman_button.heightAnchor.constraint(equalTo: fireman_view.heightAnchor, multiplier: 0.8).isActive = true
        fireman_button.widthAnchor.constraint(equalTo: fireman_view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Setting for police text
        self.fireman_view.addSubview(fireman_text)
        fireman_text.topAnchor.constraint(equalTo: fireman_button.bottomAnchor).isActive = true
        fireman_text.leadingAnchor.constraint(equalTo: fireman_view.leadingAnchor, constant: 10).isActive = true
        fireman_text.heightAnchor.constraint(equalTo: fireman_view.heightAnchor, multiplier: 0.2).isActive = true
        fireman_text.widthAnchor.constraint(equalTo: fireman_view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    func add_samu_block(){
        // Setting for police button view
        self.stack_view.addSubview(samu_view)
        samu_view.topAnchor.constraint(equalTo: stack_view.topAnchor).isActive = true
        samu_view.leadingAnchor.constraint(equalTo: fireman_view.trailingAnchor, constant: 15).isActive = true
        samu_view.heightAnchor.constraint(equalTo: stack_view.heightAnchor).isActive = true
        samu_view.widthAnchor.constraint(equalTo: stack_view.widthAnchor, multiplier: 0.3).isActive = true
        
        // Setting for police button button
        self.samu_view.addSubview(samu_button)
        samu_button.topAnchor.constraint(equalTo: samu_view.topAnchor,constant: 5).isActive = true
        samu_button.leadingAnchor.constraint(equalTo: samu_view.leadingAnchor, constant: 10).isActive = true
        samu_button.heightAnchor.constraint(equalTo: samu_view.heightAnchor, multiplier: 0.7).isActive = true
        samu_button.widthAnchor.constraint(equalTo: samu_view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Setting for police text
        self.samu_view.addSubview(samu_text)
        samu_text.topAnchor.constraint(equalTo: samu_button.bottomAnchor,constant: 4).isActive = true
        samu_text.leadingAnchor.constraint(equalTo: samu_view.leadingAnchor,constant: 10).isActive = true
        samu_text.heightAnchor.constraint(equalTo: samu_view.heightAnchor, multiplier: 0.2).isActive = true
        samu_text.widthAnchor.constraint(equalTo: samu_view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    // UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 0.3
        
        // Setting for shadow - It needs client to confirm the shadow color
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize.zero
        v.layer.shadowRadius = 5
        v.layer.masksToBounds = false
        
        return v
    }()
    
    // Declare variables - header
    let header : UITextView = {
        let label = UITextView()
        label.text = "Appels d'urgence"
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
    
    var police_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "police"), for: .normal)
        return btn
    }()
    
    var police_view: UIView = {
        let v = UIView()

        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var police_text: UILabel = {
        let label = UILabel()
        label.text = "17"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var fireman_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "pompier"), for: .normal)
        return btn
    }()
    
    var fireman_view: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var fireman_text: UILabel = {
        let label = UILabel()
        label.text = "18"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var samu_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.contentHorizontalAlignment = .fill;
        btn.contentVerticalAlignment = .fill;
        btn.setImage(UIImage(named: "sosecoute"), for: .normal)
        return btn
    }()
    
    var samu_view: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var samu_text: UILabel = {
        let label = UILabel()
        label.text = "05 30 30"
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    @objc func police_call(){
        phone_call_function(phone_number: police_text.text!.filter({$0 != " "}))
    }
    
    @objc func fireman_call(){
        phone_call_function(phone_number: fireman_text.text!.filter({$0 != " "}))
    }
    
    @objc func samu_call(){
        phone_call_function(phone_number: samu_text.text!.filter({$0 != " "}))
    }
    
    func phone_call_function(phone_number: String){
        // Retrieve telephone link by URL
        let URL_String = (URL(string: "tel://\(phone_number)"))
        // Make a phone call by URL
        if(UIApplication.shared.canOpenURL(URL_String!)){
            UIApplication.shared.open(URL_String!, options: [:], completionHandler: nil)
        }else{
            print("Fail to call the host")
        }
    }
}
