//
//  Map_Info_view.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 1/3/22.
//

import UIKit

class Map_Info_view: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Declare variables - header
    let header : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.contentMode = .scaleAspectFit
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
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
    
    func remove_component(){
        self.main_view.removeFromSuperview()
        self.header.removeFromSuperview()
        self.description_block.removeFromSuperview()
    }
    
    func init_component(){
        // Delete element
        remove_component()
        // Adjust view setting
        self.view.frame = CGRect(x: 5, y: 5, width: UIScreen.main.bounds.width*0.6, height: 60)
        self.view.backgroundColor = .white
        self.view.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        self.view.layer.borderWidth = 0.5
        self.view.layer.cornerRadius = 5
        // Add header
        self.view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
    }
    
    func init_component_with_text_block(){
        // Delete element
        remove_component()
        // Adjust view setting
        self.view.frame = CGRect(x: 5, y: 5, width: UIScreen.main.bounds.width*0.8, height: 400)
        self.view.backgroundColor = .white
        self.view.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        self.view.layer.borderWidth = 0.5
        self.view.layer.cornerRadius = 5
        // Add header
        self.view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        header.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        header.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        // Add header
        self.view.addSubview(description_block)
        description_block.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5).isActive = true
        description_block.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        description_block.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        description_block.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
