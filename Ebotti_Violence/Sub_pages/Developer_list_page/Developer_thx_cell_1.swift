//
//  Developer_thx_cell_1.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 8/3/22.
//

import UIKit

class Developer_thx_cell_1: UITableViewCell {

    // Declare variables - header
    let header : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.contentMode = .scaleAspectFit
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let description_header : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.contentMode = .scaleAspectFit
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Declare variables - description_block
    let description_block : UITextView = {
        let label = UITextView()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isScrollEnabled = false
        label.isEditable = false
        label.contentMode = .scaleAspectFit
        label.isUserInteractionEnabled = false
        return label
    }()
    
    // Declare variables - header
    let header_contact : UILabel = {
        let label = UILabel()
        label.text = "Contact"
        label.numberOfLines = 0
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contact_btn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "email"), for: .normal)
        btn.addTarget(self, action: #selector(send_email), for: .touchUpInside)
        return btn
    }()
    
    var gouv_button : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "logogouv"), for: .normal)
        return btn
    }()
    
    var sln_button : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "logosln2"), for: .normal)
        return btn
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func remove_component(){
        self.header.removeFromSuperview()
        self.header_contact.removeFromSuperview()
        self.description_header.removeFromSuperview()
        self.description_block.removeFromSuperview()
        self.contact_btn.removeFromSuperview()
        self.gouv_button.removeFromSuperview()
        self.sln_button.removeFromSuperview()
    }
    
    
    
    func init_component_cell_1(){
        self.remove_component()
        self.contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        
        self.contentView.addSubview(description_header)
        description_header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        description_header.leadingAnchor.constraint(equalTo: header.trailingAnchor).isActive = true
        description_header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        description_header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        
        self.contentView.addSubview(header_contact)
        header_contact.topAnchor.constraint(equalTo: description_header.bottomAnchor, constant: 10).isActive = true
        header_contact.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -110).isActive = true
        header_contact.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        header_contact.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        
        self.contentView.addSubview(contact_btn)
        contact_btn.topAnchor.constraint(equalTo: description_header.bottomAnchor, constant: 0).isActive = true
        contact_btn.leadingAnchor.constraint(equalTo: header_contact.trailingAnchor, constant: 5).isActive = true
        contact_btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        contact_btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func init_component_cell_2(){
        self.remove_component()
        self.contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.15).isActive = true
        
        self.contentView.addSubview(description_header)
        description_header.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        description_header.leadingAnchor.constraint(equalTo: header.trailingAnchor).isActive = true
        description_header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
        description_header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.83).isActive = true
    }
    
    func init_component_cell_3(){
        self.remove_component()
        self.contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25).isActive = true
        
        self.contentView.addSubview(description_header)
        description_header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        description_header.leadingAnchor.constraint(equalTo: header.trailingAnchor).isActive = true
        description_header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        description_header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
        
        self.contentView.addSubview(header_contact)
        header_contact.topAnchor.constraint(equalTo: description_header.bottomAnchor, constant: 10).isActive = true
        header_contact.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -185).isActive = true
        header_contact.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        header_contact.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        
        self.contentView.addSubview(contact_btn)
        contact_btn.topAnchor.constraint(equalTo: description_header.bottomAnchor, constant: 0).isActive = true
        contact_btn.leadingAnchor.constraint(equalTo: header_contact.trailingAnchor, constant: 5).isActive = true
        contact_btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        contact_btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
    
    func init_component_cell_4(){
        self.remove_component()
        self.contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35).isActive = true
        
        self.contentView.addSubview(gouv_button)
        gouv_button.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        gouv_button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        gouv_button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        gouv_button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        
        self.contentView.addSubview(sln_button)
        sln_button.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        sln_button.leadingAnchor.constraint(equalTo: gouv_button.trailingAnchor, constant: 10).isActive = true
        sln_button.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        sln_button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.55).isActive = true
    }

    func init_component_cell_5(){
        self.remove_component()
        self.contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        
        self.contentView.addSubview(description_block)
        description_block.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        description_block.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        description_block.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        description_block.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        
        self.contentView.addSubview(contact_btn)
        contact_btn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        contact_btn.leadingAnchor.constraint(equalTo: description_block.trailingAnchor, constant: 10).isActive = true
        contact_btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        contact_btn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    @objc func send_email(){
        if let email = self.contact_btn.titleLabel?.text!{
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }else{
                print("error")
            }
        }
    }
}
