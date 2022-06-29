//
//  Alert_message_view_cell_1.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 24/3/2022.
//

import UIKit
import DLRadioButton
import DropDown

class Alert_message_view_cell_1: UICollectionViewCell {
    
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
        self.main_view.removeFromSuperview()
        self.text_view_content.removeFromSuperview()
        self.firstContact_cbvoice.removeFromSuperview()
        self.twoContacts_cbvoice.removeFromSuperview()
//        self.list_btn.removeFromSuperview()
//        self.list_view.removeFromSuperview()
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
    
//    var drop_menu_option : [String]?
    
    var firstContact_cbvoice : DLRadioButton = {
        let btn = DLRadioButton()
        btn.setTitle("", for: .normal);
        btn.setTitleColor(.black, for: .normal)
        btn.iconColor = .systemGray;
        btn.indicatorColor = .red;
        btn.tag = 0
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 14.0)
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
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 14.0)
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        btn.contentHorizontalAlignment = .left
        btn.contentVerticalAlignment = .center
        btn.tag = 1
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // Bool variable - Check first section button status
    var first_button_status = false
    var second_button_status = true
    // Variable - For retrieving the access to CoreData
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var sos_list = [SOS_C]()
    
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
    
    let list_view : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
//    let list_btn : UIButton = {
//        var configuration = UIButton.Configuration.plain()
//        configuration.title = "\t\t\t"
//        configuration.image = UIImage(named: "sort_down")
//        configuration.imagePadding = 200
//        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
//        
//        let btn = UIButton(configuration: configuration, primaryAction: nil)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.contentHorizontalAlignment = .left
//        btn.contentVerticalAlignment = .center
//        btn.semanticContentAttribute = .forceRightToLeft
//        btn.setImage(UIImage(named: "sort_down"), for: .normal)
//        btn.titleLabel?.textAlignment = .left
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
//      //  btn.addTarget(self, action: #selector(drop_down_show), for: .touchUpInside)
//        btn.setTitleColor(.black, for: .normal)
//        return btn
//    }()
    
//    let dropDown = DropDown()
    
    func init_component_header(){
        self.remove_component()
        // Create mainView
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        text_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        text_view.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        text_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    func init_component(){
        self.remove_component()
        // Create mainView
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        text_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        text_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.38).isActive = true
        text_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: text_view.bottomAnchor, constant: 5).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        // Add component
        self.main_view.addSubview(firstContact_cbvoice)
        firstContact_cbvoice.isSelected = first_button_status
        firstContact_cbvoice.topAnchor.constraint(equalTo: main_view.topAnchor,constant: 5).isActive = true
        firstContact_cbvoice.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        firstContact_cbvoice.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.45).isActive = true
        firstContact_cbvoice.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.85).isActive = true

        self.main_view.addSubview(twoContacts_cbvoice)
        twoContacts_cbvoice.isSelected = second_button_status
        twoContacts_cbvoice.topAnchor.constraint(equalTo: firstContact_cbvoice.bottomAnchor).isActive = true
        twoContacts_cbvoice.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        twoContacts_cbvoice.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.45).isActive = true
        twoContacts_cbvoice.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.85).isActive = true

        firstContact_cbvoice.addTarget(self, action: #selector(radio_btn_control), for: .touchUpInside)
        twoContacts_cbvoice.addTarget(self, action: #selector(radio_btn_control), for: .touchUpInside)
    }
    
    
    func init_component_1(){
        self.remove_component()
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        // Add component
        self.main_view.addSubview(list_view)
        list_view.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        list_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor).isActive = true
        list_view.trailingAnchor.constraint(equalTo: main_view.trailingAnchor).isActive = true
        list_view.bottomAnchor.constraint(equalTo: main_view.bottomAnchor).isActive = true
        
//        self.list_view.addSubview(list_btn)
//        list_btn.topAnchor.constraint(equalTo: list_view.topAnchor,constant: 5).isActive = true
//        list_btn.leadingAnchor.constraint(equalTo: list_view.leadingAnchor,constant: 10).isActive = true
//        list_btn.trailingAnchor.constraint(equalTo: list_view.trailingAnchor).isActive = true
//        list_btn.bottomAnchor.constraint(equalTo: list_view.bottomAnchor).isActive = true
        
        // Set dropDownList
//        dropDown.anchorView = list_view // UIView or UIBarButtonItem
//        dropDown.dataSource = drop_menu_option! // UIView or UIBarButtonItem
//        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
//        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
//        dropDown.direction = .bottom
//        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//            self.list_btn.setTitle(item, for: .normal)
//        }
    }
    
    func init_component_2(){
        self.remove_component()
        // Create mainView
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        text_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        text_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
        text_view.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: text_view.bottomAnchor, constant: 5).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        // Add component
        self.main_view.addSubview(firstContact_cbvoice)
        firstContact_cbvoice.isSelected = first_button_status
        firstContact_cbvoice.topAnchor.constraint(equalTo: main_view.topAnchor,constant: 5).isActive = true
        firstContact_cbvoice.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        firstContact_cbvoice.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.45).isActive = true
        firstContact_cbvoice.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.85).isActive = true

        self.main_view.addSubview(twoContacts_cbvoice)
        twoContacts_cbvoice.isSelected = second_button_status
        twoContacts_cbvoice.topAnchor.constraint(equalTo: firstContact_cbvoice.bottomAnchor).isActive = true
        twoContacts_cbvoice.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        twoContacts_cbvoice.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.45).isActive = true
        twoContacts_cbvoice.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.85).isActive = true

        self.reload_sos_status()
        self.firstContact_cbvoice.addTarget(self, action: #selector(chat_radio_btn_control), for: .touchUpInside)
        self.twoContacts_cbvoice.addTarget(self, action: #selector(chat_radio_btn_control), for: .touchUpInside)
    }
    
    func init_component_3(){
        self.remove_component()
        // Create mainView
        self.contentView.addSubview(text_view)
        text_view.topAnchor.constraint(equalTo: contentView.topAnchor,constant: -15).isActive = true
        text_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        text_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.47).isActive = true
        text_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: text_view.bottomAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        main_view.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
        main_view.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        // Add component
        self.main_view.addSubview(text_view_content)
        text_view_content.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        text_view_content.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        text_view_content.heightAnchor.constraint(equalTo: main_view.heightAnchor).isActive = true
        text_view_content.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.92).isActive = true
    }

    func reload_sos_status(){
        do{
            sos_list = try self.context.fetch(.init(entityName: "SOS_C"))
        }catch{
            print ("failed to fetch data")
        }
    }
    
    func save_context(){
        do{
            try context.save()
        }catch{
            print("Failed to save the content")
        }
    }
    
//    @objc func drop_down_show(){
//        self.dropDown.show()
//    }
    
    @objc func radio_btn_control(){
        if(first_button_status){
            self.firstContact_cbvoice.isSelected = false
            self.twoContacts_cbvoice.isSelected = true
            self.first_button_status = false
            self.second_button_status = true
        }else if(second_button_status){
            self.firstContact_cbvoice.isSelected = true
            self.twoContacts_cbvoice.isSelected = false
            self.second_button_status = false
            self.first_button_status = true
        }
    }
    
    @objc func chat_radio_btn_control(){
        if(sos_list.count == 2){
            if(sos_list[0].status){
                print("123")
                // Update the button's selected status in CoreData
                self.sos_list[0].status = false
                self.sos_list[1].status = true
                // Update the button's selected status in UI
                self.firstContact_cbvoice.isSelected = false
                self.twoContacts_cbvoice.isSelected = true
                // Save and Reload Context in CoreData
                save_context()
                reload_sos_status()
            }else if(sos_list[1].status){
                print("here")
                // Update the button's selected status in CoreData
                self.sos_list[0].status = true
                self.sos_list[1].status = false
                // Update the button's selected status in UI
                self.firstContact_cbvoice.isSelected = true
                self.twoContacts_cbvoice.isSelected = false
                // Save and Reload Context in CoreData
                save_context()
                reload_sos_status()
            }
        }else{
            print(sos_list.count)
        }
    }
}
