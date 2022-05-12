//
//  Alert_message_col_view.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 24/3/2022.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class Alert_message_col_view: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var sos_list = [SOS_C]()
    var section_header = ["Lors du lancement d’une alerte, en plus de l’appel téléphonique, un message sera automatiquement envoyé à votre (ou vos) contact(s) de référence.", "Localisation GPS"]

    var section_one_dict_header = ["","Vous pouvez choisir si vous voulez envoyer ce message uniquement à votre premier contact de référence, ou aux deux :", "Choisissez le nombre de pressions nécessaires sur le bouton d’allumage du téléphone pour lancer une alerte" , "Sélectionnez le message qui sera automatiquement envoyé à votre (ou vos) contact(s) de référence :","Dans tous les cas, un SMS supplémentaire sera envoyé à l’association « SOS Ecoute », de sorte à les prévenir de la situation de danger et d’en avoir une traçabilité. En voici le contenu :" ]
    
    var section_one_dict = [
        "":[""],
        "Vous pouvez choisir si vous voulez envoyer ce message uniquement à votre premier contact de référence, ou aux deux :": ["Premier contact uniquement", "Aux deux contacts (deux SMS)"],
        "Choisissez le nombre de pressions nécessaires sur le bouton d’allumage du téléphone pour lancer une alerte": ["5","6","7"],
        "Sélectionnez le message qui sera automatiquement envoyé à votre (ou vos) contact(s) de référence :":
            ["Alerte, je suis en danger et je vous ai choisi comme contact référent pour me venir en aide. N'essayez pas de m'appeler en première intention, il se peut que je ne sois pas en mesure de vous répondre.","Alerte, je suis dans une situation de danger. Appelez les secours si vous n’avez pas de nouvelles dans les 10 minutes. N’essayez pas de m’appeler directement."],
        "Dans tous les cas, un SMS supplémentaire sera envoyé à l’association « SOS Ecoute », de sorte à les prévenir de la situation de danger et d’en avoir une traçabilité. En voici le contenu :" : ["Ceci est un message préenregistré provenant de l’application Dignity. Il signale une demande d’aide de la part d’une personne en difficulté. Une alerte a également été lancé à un de ses contacts."]
    ]
   
    var section_two_contents = "Lors de l’envoi de chaque SMS, votre position GPS sera donnée à votre contact. Cette fonction ne sera cependant réalisable que si l’option de localisation de votre téléphone (dans les paramètres de votre téléphone) est activée."
    var footer_contents = "Remarques: \n- Chaque SMS envoyé sera facturé au tarif en vigueur selon votre abonnement.\n- Les SMS ne pourront être acheminés que si les numéros de téléphone renseignés sont des numéros de téléphones portables."
    
    var collection_view : UICollectionView = {
        let cv = UICollectionViewFlowLayout()
        cv.scrollDirection = .vertical
        let collection_adv_view = UICollectionView(frame: .zero, collectionViewLayout: cv)
        collection_adv_view.translatesAutoresizingMaskIntoConstraints = false
        collection_adv_view.backgroundColor = .clear
        collection_adv_view.alwaysBounceVertical = false
        collection_adv_view.isScrollEnabled = true
        collection_adv_view.alwaysBounceHorizontal = false
        collection_adv_view.clipsToBounds = true
        collection_adv_view.showsHorizontalScrollIndicator = false
        collection_adv_view.showsVerticalScrollIndicator = false
        collection_adv_view.alwaysBounceHorizontal = false
        collection_adv_view.alwaysBounceVertical = false
        collection_adv_view.scrollIndicatorInsets = .zero
        return collection_adv_view
    }()
    
    func set_background_layer(){
        // Set Layer background
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor,  UIColor.white.cgColor]
        gradientLayer.locations = [0.0,1.0]
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func init_component(){
        self.view.addSubview(collection_view)
        collection_view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collection_view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection_view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection_view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        collection_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.set_background_layer()
        self.collection_view.delegate = self
        self.collection_view.dataSource = self
        self.collection_view.register(Alert_message_view_cell_1.self, forCellWithReuseIdentifier: "cell_1")
        self.collection_view.register(Alert_message_view_cell_2.self, forCellWithReuseIdentifier: "cell_2")
        // Set components
        self.init_component()
        self.reload_sos_status()
        self.title = "Appels d'urgence"
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if(section == 0){
            return 5
        }else{
            return 2
        }
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if (indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_1", for: indexPath) as! Alert_message_view_cell_1
            if(indexPath.row == 0){
                return self.cell_one_header_setting(cell: cell, indexPath: indexPath)
            }else if(indexPath.row == 1){
                return self.cell_one_setting(cell: cell, indexPath: indexPath)
            }else if(indexPath.row == 2){
                return self.cell_two_setting(cell: cell, indexPath: indexPath)
            }else if(indexPath.row == 3){
                return self.cell_three_setting(cell: cell, indexPath: indexPath)
            }else{
                return self.cell_four_setting(cell: cell, indexPath: indexPath)
            }
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_2", for: indexPath) as! Alert_message_view_cell_2
            
            if(indexPath.row == 0){
                return self.cell_one_s2_setting(cell: cell, indexPath: indexPath)
            }else{
                return self.cell_two_s2_setting(cell: cell, indexPath: indexPath)
            }
        }
    }
    
    
    func cell_one_header_setting(cell: Alert_message_view_cell_1, indexPath: IndexPath) -> Alert_message_view_cell_1{
        cell.init_component_header()
        cell.text_view.text = section_header[indexPath.section]
        cell.text_view.font = .boldSystemFont(ofSize: 14.0)
        cell.text_view.textAlignment = .center
        return cell
    }
    
    
    func cell_one_setting(cell: Alert_message_view_cell_1, indexPath: IndexPath) -> Alert_message_view_cell_1{
        cell.first_button_status = false
        cell.second_button_status = true
        cell.init_component()
        cell.text_view.text = section_one_dict_header[indexPath.row]
        
        if let dict_array = section_one_dict[section_one_dict_header[indexPath.row]] as? [String] {
            cell.firstContact_cbvoice.setTitle(dict_array[0], for: .normal)
            cell.twoContacts_cbvoice.setTitle(dict_array[1], for: .normal)
        }
        
        return cell
    }
    
    func cell_two_setting(cell: Alert_message_view_cell_1, indexPath: IndexPath) -> Alert_message_view_cell_1{

        if let dict_array = section_one_dict[section_one_dict_header[indexPath.row]] as? [String] {
            cell.drop_menu_option = dict_array
            cell.list_btn.setTitle("7", for: .normal)
            cell.init_component_1()
            cell.text_view.text = ""
        }
        
        return cell
    }
    
    func cell_three_setting(cell: Alert_message_view_cell_1, indexPath: IndexPath) -> Alert_message_view_cell_1{
        cell.init_component_2()
        cell.text_view.text = section_one_dict_header[indexPath.row]
        
        if let dict_array = section_one_dict[section_one_dict_header[indexPath.row]] as? [String] {
            cell.firstContact_cbvoice.setTitle(dict_array[0], for: .normal)
            cell.firstContact_cbvoice.titleLabel?.font = .systemFont(ofSize: 13.5)
            cell.twoContacts_cbvoice.setTitle(dict_array[1], for: .normal)
            cell.twoContacts_cbvoice.titleLabel?.font = .systemFont(ofSize: 13.5)
            
            if sos_list.count == 2{
                cell.firstContact_cbvoice.isSelected = self.sos_list[0].status
                cell.twoContacts_cbvoice.isSelected = self.sos_list[1].status
            }else if sos_list.count < 2{
                cell.firstContact_cbvoice.isSelected = true
                cell.twoContacts_cbvoice.isSelected = false
            }
        }
        
        
        
        return cell
    }
    
    func cell_four_setting(cell: Alert_message_view_cell_1, indexPath: IndexPath) -> Alert_message_view_cell_1{
        cell.init_component_3()
        cell.text_view.text = section_one_dict_header[indexPath.row]
        if let dict_array = section_one_dict[section_one_dict_header[indexPath.row]] as? [String] {
            cell.text_view_content.text = dict_array[0]
        }
        
        return cell
    }
    
    func cell_one_s2_setting(cell: Alert_message_view_cell_2, indexPath:IndexPath) -> Alert_message_view_cell_2{
        cell.init_component()
        cell.text_view.text = section_header[indexPath.section]
        cell.text_view.font = .boldSystemFont(ofSize: 14.0)
        cell.text_view_content.text = section_two_contents
        return cell
    }
    
    func cell_two_s2_setting(cell: Alert_message_view_cell_2, indexPath:IndexPath) -> Alert_message_view_cell_2{
        cell.init_component_footer()
        cell.text_view.text = footer_contents
        cell.text_view.font = .italicSystemFont(ofSize: 12.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if(indexPath.section == 1){
            return CGSize(width: self.collection_view.frame.width-10, height: 180)
        }else{
            if(indexPath.row == 0){
                return CGSize(width: self.collection_view.frame.width-10, height: 70)
            }else if(indexPath.row == 1){
                return CGSize(width: self.collection_view.frame.width-10, height: 180)
            }
            else if(indexPath.row == 2){
                return CGSize(width: self.collection_view.frame.width-10, height: 70)
            }else if(indexPath.row == 3){
                return CGSize(width: self.collection_view.frame.width-10, height: 250)
            }else{
                return CGSize(width: self.collection_view.frame.width-10, height: 180)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
    }
    
    func reload_sos_status(){
        do{
            sos_list = try self.context.fetch(.init(entityName: "SOS_C"))
        }catch{
            print ("failed to fetch data")
        }
    }
    
    
    
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
