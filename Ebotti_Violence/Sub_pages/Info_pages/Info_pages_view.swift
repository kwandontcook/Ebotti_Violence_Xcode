//
//  Info_pages_view.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 1/3/22.
//

import UIKit
import PDFKit
import SafariServices

class Info_pages_view: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    var header = ["Hors ligne","En ligne"]
    // Declare section one data
    var section_one_header = ["Violentometre", "Carte violence intrafamiliale", "Carte informative enfant"]
    var section_one_icon = ["violenceicon2", "carte", "child"]
    var pdf_file_name = ["violentometre4","pdf2","pdf3"]
    var pdf_title = ["Violentomètre", "Carte violence","Carte enfant"]
    // Declare section two data
    var section_two_header = ["Harcèlement sexuel", "Les agressions sexuelles - le viol", "L’outrage sexiste", "Le mariage forcé"]
    var section_two_icon = ["harcelement3", "interdit", "badtalk2","menotte_ring"]
    var section_two_url = ["https://violences-conjugales.gouv.nc/que-dit-la-loi/harcelement-sexuel", "https://violences-conjugales.gouv.nc/que-dit-la-loi/violences-sexuelles", "https://violences-conjugales.gouv.nc/que-dit-la-loi/outrage-sexiste","https://violences-conjugales.gouv.nc/que-dit-la-loi/mariage-force"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return section_one_header.count
        }else{
            return section_two_header.count
        }
    }
    
    // Set size for each collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: self.collection_view.frame.width-10, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.collection_view.frame.width-10, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.section == 1){
            if let url = URL(string: section_two_url[indexPath.row]){
                let v = SFSafariViewController(url: url)
                self.present(v, animated: true, completion: nil)
            }
        }else{
            let v = Info_Pdf_view()
            v.file_name = pdf_file_name[indexPath.row]
            v.title_str = pdf_title[indexPath.row]
            self.navigationController?.pushViewController(v, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_1", for: indexPath) as! Info_page_col
        if(indexPath.section == 0){
            cell.header.text = section_one_header[indexPath.row]
            cell.icon.image = UIImage(named: section_one_icon[indexPath.row])
        }else{
            cell.header.text = section_two_header[indexPath.row]
            cell.icon.image = UIImage(named: section_two_icon[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header_cell", for: indexPath) as! Info_pages_header
        cell.header_label.text = header[indexPath.section]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_background_layer()
        collection_view.delegate = self
        collection_view.dataSource = self
        collection_view.register(Info_page_col.self, forCellWithReuseIdentifier: "cell_1")
        collection_view.register(Info_pages_header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header_cell")
        // Set components
        self.init_component()
        self.title = "Documentation"
    }
    
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
