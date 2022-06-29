//
//  Developer_page_view.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 8/3/22.
//

import UIKit
import SafariServices

class Developer_page_view: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Developer_thx_cell_1
        
        if(indexPath.row == 0){
            cell.init_component_cell_1()
            cell.description_header.text = section_content[indexPath.row]
            cell.contact_btn.titleLabel!.text = section_email[indexPath.row]
            cell.backgroundColor = UIColor.white
        }else if(indexPath.row == 1){
            cell.init_component_cell_2()
            cell.description_header.text = section_content[indexPath.row]
            cell.backgroundColor = UIColor.white
        }else if(indexPath.row == 2){
            cell.init_component_cell_3()
            cell.description_header.text = section_content[indexPath.row]
            cell.contact_btn.titleLabel!.text = section_email[indexPath.row]
            cell.backgroundColor = UIColor.white
        }else if(indexPath.row == 3){
            cell.init_component_cell_4()
            cell.gouv_button.addTarget(self, action: #selector(nav_web_1), for: .touchUpInside)
            cell.sln_button.addTarget(self, action: #selector(nav_web_2), for: .touchUpInside)
            cell.backgroundColor = UIColor.white
        }else{
            cell.init_component_cell_5()
            cell.description_block.text = section_content[indexPath.row]
            cell.contact_btn.titleLabel!.text = section_email[indexPath.row]
            cell.backgroundColor = UIColor.white
        }
        
        cell.header.text = section_header[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    var section_header = ["Conception : ", "Dév: ", "Bienfaiteurs: ", "Contributeurs: ", "Association Dignity"]
    var section_content = ["Steve Corroyer, Daphné Bailly", "Jean-Luc Descombes et Nicolas Foata \nKwok Chung Kwan",
     "Angélique Renucci", "", "Association à but non lucratif luttant contre tous les types de violences et à l’origine de cette application. \nPour la soutenir, vous pouvez faire un don en \nles contactant à :\ndignity.asso@gmail.com \n\nVous pouvez également soumettre vos idées et améliorations afin de faire évoluer l'application continuellement."
    ]
    var section_email = [0 : "dignity.asso@gmail.com", 2: "mimotheshop@gmail.com", 4: "dignity.asso@gmail.com"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.init_component()
        self.table_view_setting()
        self.title = "Remerciements"
    }
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.clear
        v.translatesAutoresizingMaskIntoConstraints = false
        // Setting for shadow
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize.zero
        v.layer.shadowRadius = 5
        v.layer.masksToBounds = false
        return v
    }()
    
    let image_view : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "happy")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleToFill
        return v
    }()
    
    let table_view : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor =  UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        v.layer.borderWidth = 0.3
        v.layer.cornerRadius = 5
        v.backgroundColor = UIColor.white
        return v
    }()
    
    func init_component(){
        
        self.view.addSubview(image_view)
        image_view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        image_view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image_view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        image_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.view.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        main_view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        main_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.main_view.addSubview(table_view)
        table_view.topAnchor.constraint(equalTo: main_view.topAnchor, constant: 30.0).isActive = true
        table_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10.0).isActive = true
        table_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.9).isActive = true
        table_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.95).isActive = true
    }

    func table_view_setting(){
        self.table_view.dataSource = self
        self.table_view.delegate = self
        self.table_view.separatorStyle = .none
        self.table_view.register(Developer_thx_cell_1.self, forCellReuseIdentifier: "cell")
        self.table_view.backgroundColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(indexPath.row == 3){
            return 180
        }else if(indexPath.row == 4){
            return 250
        }else{
            return 80
        }

    }
    

    @objc func nav_web_1(){
            if let url = URL(string: "https://gouv.nc/"){
                let v = SFSafariViewController(url: url)
                self.present(v, animated: true, completion: nil)
        }
    }
    
    @objc func nav_web_2(){
            if let url = URL(string: "https://sln.eramet.com/"){
                let v = SFSafariViewController(url: url)
                self.present(v, animated: true, completion: nil)
        }
    }
    
    
}
