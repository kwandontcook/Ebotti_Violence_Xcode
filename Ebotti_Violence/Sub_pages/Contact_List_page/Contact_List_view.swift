//
//  Contact_List_view.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 6/3/22.
//

import UIKit
import Contacts
import ContactsUI
import CoreData

class Contact_List_view: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CNContactPickerDelegate {

    // Declare Emergency person data
    var emergency_list = [Emergency_C]()
    // Declare section cell data
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var section_one_btn_loc = 0
    var section_header = ["Personnes à prévenir", "", "", "ENREGISTREMENTS", ""]
    var section_one_content = ["Nom:","Téléphone:"]
    var section_two_content = ["Dans le cas du lancement de l’alerte directement depuis l’application en appuyant sur le bouton ALERTER, il est possible d’autoriser le lancement automatiquement d’un appel vers vos contacts (en plus des SMS). Ainsi, voici vos options :"]
    var section_three_content = ["Lancer un appel vers le premier contact de référence uniquement","En cas de non réponse de mon premier contact, lancer automatiquement un deuxième appel vers mon deuxième contact de référence"]
    var section_four_content = ["Dans tous les cas, un enregistrement audio de 3 minutes de votre environnement sera automatiquement effectué par l'application à chaque lancement d'alerte.\nVous les trouverez dans l'application dans l'onglet 'historique' (l'icône en bas à gauche lorsque vous êtes dans le menu principal), et dans les dossiers internes de votre téléphone. " ]
    var section_five_content = ["Remarque: Chaque appel sera facturé au tarif en vigueur selon votre abonnement."]
    
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
        set_background_layer()
        fetchData_From_CoreData()
        collection_view.delegate = self
        collection_view.dataSource = self
        collection_view.register(Contact_List_cell_1.self, forCellWithReuseIdentifier: "cell")
        collection_view.register(Contact_List_cell_2.self, forCellWithReuseIdentifier: "cell_2")
        collection_view.register(Contact_List_cell_3.self, forCellWithReuseIdentifier: "cell_3")
        collection_view.register(Contact_List_cell_4.self, forCellWithReuseIdentifier: "cell_4")
        collection_view.register(Contact_List_cell_5.self, forCellWithReuseIdentifier: "cell_5")
        collection_view.register(Contact_Lists_header.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: "header_cell")

        
        // Set components
        self.init_component()
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
        return 5
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return 2
        }else{
            return 1
        }

    }
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Contact_List_cell_1
            // Set Data
            cell.Name_label.text = section_one_content[0]
            cell.Telephone_label.text = section_one_content[1]
            cell.Add_user_img_view.titleLabel?.text = String(indexPath.row)
            cell.Delete_img_view.titleLabel?.text = String(indexPath.row)
            
            if(emergency_list.count > indexPath.row){
                cell.Name_text_view.text = emergency_list[indexPath.row].name
                cell.Telephone_text_view.text = emergency_list[indexPath.row].mobile
            }else{
                cell.Name_text_view.text = ""
                cell.Telephone_text_view.text = ""
            }
            
            // Bind action
            cell.Add_user_img_view.addTarget(self, action: #selector(retrieve_contact), for: .touchUpInside)
            cell.Delete_img_view.addTarget(self, action: #selector(deleteData_func), for: .touchUpInside)
            return cell
        } else if(indexPath.section == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_2", for: indexPath) as! Contact_List_cell_2
            cell.text_view.text = section_two_content[indexPath.row]
            return cell
        }else if(indexPath.section == 2){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_3", for: indexPath) as! Contact_List_cell_3
            cell.firstContact_cbvoice.setTitle(section_three_content[0], for: .normal)
            cell.twoContacts_cbvoice.setTitle(section_three_content[1], for: .normal)
            
            return cell
        }else if(indexPath.section == 3){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_4", for: indexPath) as! Contact_List_cell_4
            cell.text_view.text = section_four_content[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_5", for: indexPath) as! Contact_List_cell_5
            cell.text_view.text = section_five_content[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header_cell", for: indexPath) as! Contact_Lists_header

        if(section_header[indexPath.section] != ""){
            cell.header_label.textAlignment = .center
            cell.header_label.text = section_header[indexPath.section]
            cell.header_label.font = UIFont.boldSystemFont(ofSize: 14.0)
        }
        return cell
    }
    
    // Set size for each collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.collection_view.frame.width-10, height: 85)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section_header[section] == ""){
            return CGSize(width: self.collection_view.frame.width-10, height: 2)
        }else{
            return CGSize(width: self.collection_view.frame.width-10, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    @objc func retrieve_contact(_ sender: UIButton){
        // Store the location
        if let c = Int((sender.titleLabel?.text)!){
            self.section_one_btn_loc = c
        }
        // Open the viewController
        let v = CNContactPickerViewController()
        v.delegate = self
        self.present(v, animated: true, completion: nil)
    }
    

    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        // Retrieve their name and phone
        let contact_name = contact.givenName + " " + contact.familyName
        var contact_number = ""
        
        if contact.phoneNumbers.count == 1 {
            contact_number = contact.phoneNumbers[0].value.stringValue
        }else{
            for c in contact.phoneNumbers{
                if(c.label == CNLabelPhoneNumberMain){
                    contact_number = c.value.stringValue
                    break
                }else if(c.label == CNLabelPhoneNumberMobile){
                    contact_number = c.value.stringValue
                    break
                }else if (c.label == CNLabelWork){
                    contact_number = c.value.stringValue
                    break
                }
            }
        }
        
        if let cell = self.collection_view.cellForItem(at: IndexPath(row: self.section_one_btn_loc, section: 0)) as? Contact_List_cell_1{
            // ERROR DATA COME OUT
            if(contact_number == "" || contact_name == "" ){
                // pop up alertController
                let vc = UIAlertController(title: "ERROR", message: "We cant import the selected contacts", preferredStyle: .alert)
                vc.addAction(UIAlertAction(title: "close", style: .cancel, handler: nil))
                self.dismiss(animated: true) {
                    self.present(vc, animated: true, completion: nil)
                }
            }else{
                handleData_func(contact_name: contact_name, contact_number: contact_number, cell: cell, row: self.section_one_btn_loc)
            }
        }
    }
    
    @objc func deleteData_func(_ sender: UIButton){
        // Store the location
        if let c = Int((sender.titleLabel?.text)!){
            self.section_one_btn_loc = c
        }
        
        if let cell = self.collection_view.cellForItem(at: IndexPath(row: self.section_one_btn_loc, section: 0)) as? Contact_List_cell_1{
            
            if(cell.Name_text_view.text != ""){
                // Remove Product in Products Array
                self.context.delete(emergency_list[self.section_one_btn_loc])
                // Save the context
                do{
                    try self.context.save()
                    self.fetchData_From_CoreData()
                    print("Deleted Item :  \(self.emergency_list.count)")
                }catch{
                    print ("Failed to save data")
                }
            }
        }
    }
    
    func handleData_func(contact_name: String, contact_number: String, cell: Contact_List_cell_1, row: Int){
        
        if(cell.Name_text_view.text == "")
        {
            // Add data directly
            let e = Emergency_C(context: self.context)
            e.name = contact_name
            e.mobile = contact_number
            e.sos_status = true
            // save data
            do{
                try self.context.save()
                self.fetchData_From_CoreData()
                print("Added List :  \(self.emergency_list.count)")
            }catch{
                print("Fail to save data")
            }
        }else{
            if(row<2){
                let d = emergency_list[row]
                d.name = contact_name
                d.mobile = contact_number
                // save data
                do{
                    try self.context.save()
                    self.fetchData_From_CoreData()
                    print("Updated List :  \(self.emergency_list.count)")
                }catch{
                    print("Fail to save data")
                }
            }
        }
    }
    
    
    func fetchData_From_CoreData(){
        do{
            try self.emergency_list = context.fetch(.init(entityName: "Emergency_C"))
        }catch{
            print("error")
        }
        
        DispatchQueue.main.async {
            self.collection_view.reloadData()
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
