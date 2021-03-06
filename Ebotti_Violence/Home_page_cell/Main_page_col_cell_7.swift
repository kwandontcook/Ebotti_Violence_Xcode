//
//  Main_page_col_cell_7.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 28/2/22.
//

import UIKit
import DropDown
import DLRadioButton
import CoreData

class Main_page_col_cell_7: UICollectionViewCell {
    // Declare array for alert message for text
    let alert_messages_array_text = ["Dignity", "Calculette", "Word","Météo","Sudoku","Covid19", "Réveil","Light Up", "Permago", "Patoune", "TravWorld","Foody","Penderie","Do Re Zik","Black & Plane","NC Photos","Yoga Zen"]
    // Declare array for alert message for icon
    let alert_messages_array_image = ["icon1", "calculette", "word",
        "meteo","sudoku",
        "covid19","reveil","lightup",
        "permago","patoune",
        "travworld", "foody",
        "penderie","dorezik",
        "blackplane","ncphoto",
        "yogazen"]
    // Declare CoreData stuff
    var app_icon = [App_Icon_C]()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // Declare the dropDown list variable
    let dropDown = DropDown()
    // UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 0.3
        // Setting for shadow
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
        label.text = "Apperance"
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
    
    let list_view : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor
        v.layer.borderWidth = 0.5
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let list_btn : UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "\t"
        configuration.image = UIImage(named: "sort_down")
        configuration.imagePadding = 100
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let btn = UIButton(configuration: configuration, primaryAction: nil)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = .left
        btn.contentVerticalAlignment = .center
        btn.semanticContentAttribute = .forceRightToLeft
        btn.setImage(UIImage(named: "sort_down"), for: .normal)
        btn.titleLabel?.textAlignment = .left
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.addTarget(self, action: #selector(drop_down_show), for: .touchUpInside)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    let list_icon : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "ic_launcher_round")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let list_indicator : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "sort_down")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let stack_middle_view : UIView = {
        let v = UIView()
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let frame_view_2 : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.layer.borderColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor
        v.layer.borderWidth = 0.5
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let frame_view_2_radio_button: DLRadioButton = {
        let btn = DLRadioButton()
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle("Cacher l Application", for: .normal);
        btn.setTitleColor(.black, for: .normal)
        btn.iconColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1);
        btn.indicatorColor = .clear;
        btn.isIconSquare = true
        btn.isSelected = false
        btn.addTarget(self, action: #selector(radio_btn_status), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left;
        return btn
    }()

    
    var bool_status = false
    
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.fetch_app_icon()
        init_component()
        // Set dropDownList
        dropDown.anchorView = list_view // UIView or UIBarButtonItem
        dropDown.dataSource = alert_messages_array_text // UIView or UIBarButtonItem
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.update_app_icon_if_needed(title: item, name: alert_messages_array_image[index])
            self.changeIcon(to: alert_messages_array_image[index])
        }
    }
    
    func changeIcon(to name: String?) {
        let app = UIApplication.shared
        if #available(iOS 10.3, *) {
            if app.supportsAlternateIcons {
                app.setAlternateIconName(name, completionHandler: { (error) in
                    if error != nil {
                        print("error => \(String(describing: error?.localizedDescription))")
                    }else {
                        print("Changed Icon Sucessfully.")
                    }
                })
            }
        }
    }
    
    
    func fetch_app_icon(){
        do{
            try self.app_icon = context.fetch(.init(entityName: "App_Icon_C"))
            // Update the appIcon
            if(self.app_icon.count>0){
                self.list_icon.image = UIImage(named: self.app_icon[0].image_name!)
                self.list_btn.setTitle(self.app_icon[0].image_title!, for: .normal)
            }else{
                self.create_app_icon_if_needed()
            }
        }catch{
            print("error")
        }
    }
    
    func create_app_icon_if_needed(){
        // If there is no cached data in default -> store the default icon1
        if(self.app_icon.count == 0){
            //Create new variable
            let app_icon_t = App_Icon_C(context: self.context)
            app_icon_t.image_name = "icon1"
            app_icon_t.image_title = "Dignity"
            // Save variable into the app_icon_t
            do{
                try self.context.save()
            }catch{
                print("failed to cache data")
            }
            self.fetch_app_icon()
        }
    }
    
    func update_app_icon_if_needed(title: String, name: String){
        // If there is cached data already -> update the data and change the background icon
        if(self.app_icon.count > 0){
            self.app_icon[0].image_title = title
            self.app_icon[0].image_name = name
            // Update variable to coreData
            do{
                try self.context.save()
            }catch{
                print("failed to cache data")
            }
            self.fetch_app_icon()
        }
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
        stack_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.8).isActive = true
        stack_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.9).isActive = true
        
        stack_view_compoent_one()

    }
    
    func stack_view_compoent_one(){
        self.stack_view.addSubview(list_view)
        list_view.topAnchor.constraint(equalTo: stack_view.topAnchor).isActive = true
        list_view.leadingAnchor.constraint(equalTo: stack_view.leadingAnchor).isActive = true
        list_view.heightAnchor.constraint(equalTo: stack_view.heightAnchor, multiplier: 0.7).isActive = true
        list_view.widthAnchor.constraint(equalTo: stack_view.widthAnchor).isActive = true
        
        self.list_view.addSubview(list_btn)
        list_btn.topAnchor.constraint(equalTo: list_view.topAnchor,constant: 10).isActive = true
        list_btn.leadingAnchor.constraint(equalTo: list_view.leadingAnchor,constant: 5).isActive = true
        list_btn.heightAnchor.constraint(equalTo: list_view.heightAnchor, multiplier: 0.75).isActive = true
        list_btn.widthAnchor.constraint(equalTo: list_view.widthAnchor, multiplier: 0.73).isActive = true
       
        self.list_view.addSubview(list_icon)
        list_icon.topAnchor.constraint(equalTo: list_view.topAnchor,constant: 20).isActive = true
        list_icon.leadingAnchor.constraint(equalTo: list_btn.trailingAnchor,constant: 10).isActive = true
        list_icon.heightAnchor.constraint(equalTo: list_view.heightAnchor, multiplier: 0.54).isActive = true
        list_icon.widthAnchor.constraint(equalTo: list_view.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    /*
     list_icon.topAnchor.constraint(equalTo: list_view.topAnchor,constant: 10).isActive = true
     list_icon.leadingAnchor.constraint(equalTo: list_btn.trailingAnchor,constant: 10).isActive = true
     list_icon.heightAnchor.constraint(equalTo: list_view.heightAnchor, multiplier: 0.7).isActive = true
     list_icon.widthAnchor.constraint(equalTo: list_view.widthAnchor, multiplier: 0.2).isActive = true
     */
    
    
    func stack_view_compoent_two(){
        self.stack_view.addSubview(frame_view_2)
        frame_view_2.topAnchor.constraint(equalTo: list_view.bottomAnchor).isActive = true
        frame_view_2.leadingAnchor.constraint(equalTo: stack_view.leadingAnchor).isActive = true
        frame_view_2.heightAnchor.constraint(equalTo: stack_view.heightAnchor, multiplier: 0.3).isActive = true
        frame_view_2.widthAnchor.constraint(equalTo: stack_view.widthAnchor).isActive = true
        
        self.frame_view_2.addSubview(frame_view_2_radio_button)
        frame_view_2_radio_button.topAnchor.constraint(equalTo: frame_view_2.topAnchor, constant: 15).isActive = true
        frame_view_2_radio_button.leadingAnchor.constraint(equalTo: frame_view_2.leadingAnchor, constant: 20).isActive = true
        frame_view_2_radio_button.heightAnchor.constraint(equalTo: frame_view_2.heightAnchor, multiplier: 0.4).isActive = true
        frame_view_2_radio_button.widthAnchor.constraint(equalTo: frame_view_2.widthAnchor, multiplier: 0.7).isActive = true
    }
    
    func load_ios_apperance(){
        
    }
    

    
    @objc func radio_btn_status(_ sender: DLRadioButton){
        if(bool_status == false){
            sender.indicatorColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1);
            sender.isSelected = true
            bool_status = true
        }else{
            sender.indicatorColor = .white
            sender.isSelected = false
            bool_status = false
        }
    }
    
    @objc func drop_down_show(){
        dropDown.show()
    }
}

