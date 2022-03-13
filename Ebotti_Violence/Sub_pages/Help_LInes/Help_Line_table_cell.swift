//
//  Help_Line_table_cell.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 28/2/22.
//

import UIKit

class Help_Line_table_cell: UITableViewCell {

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
    
    // Declare variables - description_block
    let description_block : UITextView = {
        let label = UITextView()
        label.text = ""
        label.font = UIFont.italicSystemFont(ofSize: 14.0)
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
    
    var phone_btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "phone_icon2"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.semanticContentAttribute = .forceRightToLeft
        btn.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        btn.layer.borderColor =  UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        btn.layer.borderWidth = 0.3
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(phone_trigger(_:)), for: .touchUpInside)
        return btn
    }()
    
    var phone_btn_1: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "phone_icon2"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.semanticContentAttribute = .forceRightToLeft
        btn.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        btn.layer.borderColor =  UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        btn.layer.borderWidth = 0.3
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(phone_trigger(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func init_component(){
        // Remove header from superview in order to resolve duplicate element
        header.removeFromSuperview()
        // Setting for header
        self.contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.35).isActive = true
        header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        
        // Remove description_block from superview in order to resolve duplicate element
        description_block.removeFromSuperview()
        // Setting for description_block
        self.contentView.addSubview(description_block)
        description_block.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        description_block.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        description_block.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        description_block.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        
        // Remove phone_btn from superview in order to resolve duplicate element
        phone_btn.removeFromSuperview()
        // Setting for phone_btn
        self.contentView.addSubview(phone_btn)
        phone_btn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25).isActive = true
        phone_btn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        phone_btn.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        phone_btn.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        
        // Remove phone_btn_1 from superview in order to resolve duplicate element
        phone_btn_1.removeFromSuperview()
    }
    
    func init_special_component(){
        // Remove header from superview in order to resolve duplicate element
        header.removeFromSuperview()
        // Setting for header
        self.contentView.addSubview(header)
        header.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        header.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        header.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        
        // Remove description_block from superview in order to resolve duplicate element
        description_block.removeFromSuperview()
        // Setting for description_block
        self.contentView.addSubview(description_block)
        description_block.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        description_block.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        description_block.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        description_block.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.7).isActive = true
        
        // Remove phone_btn from superview in order to resolve duplicate element
        phone_btn.removeFromSuperview()
        // Setting for phone_btn
        self.contentView.addSubview(phone_btn)
        phone_btn.topAnchor.constraint(equalTo: description_block.bottomAnchor).isActive = true
        phone_btn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        phone_btn.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
        phone_btn.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        
        // Remove phone_btn_1 from superview in order to resolve duplicate element
        phone_btn_1.removeFromSuperview()
        // Setting for phone_btn
        self.contentView.addSubview(phone_btn_1)
        phone_btn_1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        phone_btn_1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        phone_btn_1.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
        phone_btn_1.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    @objc func phone_trigger (_ sender: UIButton){
        phone_call_function(phone_number:  (sender.titleLabel?.text)!)
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
