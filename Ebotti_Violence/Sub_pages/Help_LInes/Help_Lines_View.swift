//
//  Help_Lines_View.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 28/2/22.
//

import UIKit

class Help_Lines_View: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label_text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Help_Line_table_cell
        
        // Load setting 2 for last cell
        if(indexPath.row == 10){
            cell.init_special_component()
            cell.header.text = label_text[indexPath.row]
            cell.phone_btn.setTitle(mobile_arr[indexPath.row], for: .normal)
            cell.phone_btn_1.setTitle("730792", for: .normal)
            cell.description_block.text = description_arr[indexPath.row]
        // Load normal setting
        }else{
            cell.init_component()
            cell.header.text = label_text[indexPath.row]
            cell.description_block.text = description_arr[indexPath.row]
            cell.phone_btn.setTitle(mobile_arr[indexPath.row], for: .normal)
        }
        
        cell.selectionStyle = .none

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        init_component()
        self.table_view.register(Help_Line_table_cell.self, forCellReuseIdentifier: "cell")
        self.table_view.dataSource = self
        self.table_view.delegate = self
        self.title = "Lignes d'aide"
    }
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.masksToBounds = true
        return v
    }()
    
    let image_view : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "together")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    let table_view : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor =  UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        v.layer.borderWidth = 0.3
        v.layer.cornerRadius = 5
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    
    var label_text = ["SOS violences","Femmes et \nviolences conjuguales", "ADAVI", "Case Juridique Kanak", "CAFED (Province Nord)", "DAV" ,"Diversités NC", "Le Relais (Province Sud)","ISG (Province Sud)","BPP","DACAS (Province des iles)"]
    var description_arr =
    ["","","Accès aux droits, aide aux victimes", "(Droit coutumier)", "Centre d’Accueil des Femmes \nen Difficulté", "Dispositif d’Accueil \ndes Victimes (Medipole)",
     "Accompagnement des \npersonnes homo/trans", "Signalement des victimes \net actions sociales", "Accueil et suivi \ndes victimes et auteurs",
     "Intervenante Social \nGendarmerie","Bureau de Prévention \net des Partenariats-", "Action Communautaire \net Sanitaire"]
    
    var mobile_arr = ["051111","262622","277608","963055","717296","208340","976264","204496","203770","295141","243424"]
    
    func init_component(){
        // Create root view for the controller
        self.view.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        main_view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        main_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // add imageView
        self.main_view.addSubview(image_view)
        image_view.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        image_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.3).isActive = true
        image_view.widthAnchor.constraint(equalTo: main_view.widthAnchor).isActive = true
        
        // add imageView
        self.main_view.addSubview(table_view)
        table_view.topAnchor.constraint(equalTo: image_view.bottomAnchor, constant: -30.0).isActive = true
        table_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10.0).isActive = true
        table_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.7).isActive = true
        table_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.95).isActive = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 10){
            return 140
        }else{
            return 100
        }
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
