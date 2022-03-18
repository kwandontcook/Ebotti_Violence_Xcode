//
//  Map_page_view.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 1/3/22.
//

import UIKit
import GoogleMaps
import DLRadioButton
import CoreLocation

class Map_page_view: UIViewController, GMSMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        init_component()
        // Do any additional setup after loading the view.
    }
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    let button_view :UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let zoom_view :UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let filter_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var Base_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setTitle("Base", for: .normal)
        btn.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14.0)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(set_base), for: .touchUpInside)
        btn.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        return btn
    }()
    
    var Hybride_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setTitle("Hybride", for: .normal)
        btn.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14.0)
        btn.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(set_hybride), for: .touchUpInside)
        return btn
    }()
    
    var Satellite_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setTitle("Satellite", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14.0)
        btn.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        btn.addTarget(self, action: #selector(set_satellite), for: .touchUpInside)
        return btn
    }()
    
    var Terrain_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setTitle("Terrain", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14.0)
        btn.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        btn.addTarget(self, action: #selector(set_terrain), for: .touchUpInside)
        return btn
    }()
    
    var zoomIn_btn : UIButton = {
        let zoom_in_btn = UIButton()
        zoom_in_btn.setImage(UIImage(systemName: "plus"), for: .normal)
        zoom_in_btn.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        zoom_in_btn.layer.borderWidth = 0.5
        zoom_in_btn.layer.cornerRadius = 5
        zoom_in_btn.backgroundColor = .white
        zoom_in_btn.contentMode = .scaleAspectFit
        zoom_in_btn.setTitleColor(UIColor.black, for: .normal)
        zoom_in_btn.addTarget(self, action: #selector(zoom_in_trigger), for: .touchUpInside)
        zoom_in_btn.translatesAutoresizingMaskIntoConstraints = false
        return zoom_in_btn
    }()
    
    var zoomOut_btn : UIButton = {
        let zoom_out = UIButton()
        zoom_out.setImage(UIImage(systemName: "minus"), for: .normal)
        zoom_out.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        zoom_out.layer.borderWidth = 0.5
        zoom_out.layer.cornerRadius = 5
        zoom_out.backgroundColor = .white
        zoom_out.contentMode = .scaleAspectFit
        zoom_out.setTitleColor(UIColor.black, for: .normal)
        zoom_out.translatesAutoresizingMaskIntoConstraints = false
        zoom_out.addTarget(self, action: #selector(zoom_out_trigger), for: .touchUpInside)
        return zoom_out
    }()
    
    var medical_checkbox : DLRadioButton = {
        let btn = DLRadioButton()
        btn.setTitle("Aide médico-psychologique", for: .normal);
        btn.setTitleColor(.white, for: .normal)
        btn.iconColor = .systemGray;
        btn.indicatorColor = .red;
        btn.isIconSquare = true
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        btn.isSelected = true
        btn.addTarget(self, action: #selector(q1(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var psycho_checkbox : DLRadioButton = {
        let btn = DLRadioButton()
        btn.setTitle("Centres médico-sociaux/CCAS", for: .normal);
        btn.setTitleColor(.white, for: .normal)
        btn.iconColor = .systemGray;
        btn.indicatorColor = .red;
        btn.isIconSquare = true
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        btn.isSelected = true
        btn.addTarget(self, action: #selector(q2(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var asso_checkbox : DLRadioButton = {
        let btn = DLRadioButton()
        btn.setTitle("Aide psychologique et Asso", for: .normal);
        btn.setTitleColor(.white, for: .normal)
        btn.iconColor = .systemGray;
        btn.indicatorColor = .red;
        btn.isIconSquare = true
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        btn.isSelected = true
        btn.addTarget(self, action: #selector(q3(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var force_checkbox : DLRadioButton = {
        let btn = DLRadioButton()
        btn.setTitle("Forces de l'Ordre", for: .normal);
        btn.setTitleColor(.white, for: .normal)
        btn.iconColor = .systemGray;
        btn.indicatorColor = .red;
        btn.isIconSquare = true
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 13)
        btn.isSelected = true
        btn.addTarget(self, action: #selector(q4(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var mapView : GMSMapView?
    var bool_status_1 = true , bool_status_2 = true ,bool_status_3 = true ,bool_status_4 = true
    var marker_arr = [GMSMarker]()
    var v = Map_Info_view()
    
    var zoom = 6.0
    
    
    // DataSet - for marker
    
    func init_component(){
        // Create root view for the controller
        main_view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(main_view)
        create_map_view()
        create_btn_view()
        create_zoom_view()
        create_filter_view()
        create_dataSet_header_set()
        self.title = "Centres d'accueil"
    }
    

    func create_map_view(){
        // Set MapView
        mapView = GMSMapView.map(withFrame: main_view.frame, camera: GMSCameraPosition.camera(withLatitude: -22.264035869032245, longitude: 166.45688236672396, zoom: Float(zoom)))
        mapView?.delegate = self
        mapView?.setMinZoom(4.0, maxZoom: 14.0)
        self.main_view.addSubview(mapView!)
    }
    
    func create_btn_view(){
        // Add buttonView
        self.view.addSubview(button_view)
        button_view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        button_view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        button_view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        button_view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        
        self.button_view.addSubview(Base_button)
        Base_button.topAnchor.constraint(equalTo: button_view.topAnchor).isActive = true
        Base_button.leadingAnchor.constraint(equalTo: button_view.leadingAnchor).isActive = true
        Base_button.heightAnchor.constraint(equalTo: button_view.heightAnchor).isActive = true
        Base_button.widthAnchor.constraint(equalTo: button_view.widthAnchor, multiplier: 0.2).isActive = true
        
        self.button_view.addSubview(Hybride_button)
        Hybride_button.topAnchor.constraint(equalTo: button_view.topAnchor).isActive = true
        Hybride_button.leadingAnchor.constraint(equalTo: Base_button.trailingAnchor, constant: 5).isActive = true
        Hybride_button.heightAnchor.constraint(equalTo: button_view.heightAnchor).isActive = true
        Hybride_button.widthAnchor.constraint(equalTo: button_view.widthAnchor, multiplier: 0.2).isActive = true
        
        self.button_view.addSubview(Satellite_button)
        Satellite_button.topAnchor.constraint(equalTo: button_view.topAnchor).isActive = true
        Satellite_button.leadingAnchor.constraint(equalTo: Hybride_button.trailingAnchor, constant: 5).isActive = true
        Satellite_button.heightAnchor.constraint(equalTo: button_view.heightAnchor).isActive = true
        Satellite_button.widthAnchor.constraint(equalTo: button_view.widthAnchor, multiplier: 0.2).isActive = true
        
        self.button_view.addSubview(Terrain_button)
        Terrain_button.topAnchor.constraint(equalTo: button_view.topAnchor).isActive = true
        Terrain_button.leadingAnchor.constraint(equalTo: Satellite_button.trailingAnchor, constant: 5).isActive = true
        Terrain_button.heightAnchor.constraint(equalTo: button_view.heightAnchor).isActive = true
        Terrain_button.widthAnchor.constraint(equalTo: button_view.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    func create_zoom_view(){
        self.view.addSubview(zoom_view)
        zoom_view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        zoom_view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        zoom_view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        zoom_view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
        
        self.zoom_view.addSubview(zoomIn_btn)
        zoomIn_btn.topAnchor.constraint(equalTo: zoom_view.topAnchor).isActive = true
        zoomIn_btn.leadingAnchor.constraint(equalTo: zoom_view.leadingAnchor).isActive = true
        zoomIn_btn.heightAnchor.constraint(equalTo: zoom_view.heightAnchor, multiplier: 0.5).isActive = true
        zoomIn_btn.widthAnchor.constraint(equalTo: zoom_view.widthAnchor).isActive = true
        
        self.zoom_view.addSubview(zoomOut_btn)
        zoomOut_btn.topAnchor.constraint(equalTo: zoomIn_btn.bottomAnchor).isActive = true
        zoomOut_btn.leadingAnchor.constraint(equalTo: zoom_view.leadingAnchor).isActive = true
        zoomOut_btn.heightAnchor.constraint(equalTo: zoom_view.heightAnchor, multiplier: 0.5).isActive = true
        zoomOut_btn.widthAnchor.constraint(equalTo: zoom_view.widthAnchor).isActive = true
    }
    
    func create_filter_view(){
        self.view.addSubview(filter_view)
        filter_view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        filter_view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        filter_view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        filter_view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
    
        self.filter_view.addSubview(medical_checkbox)
        medical_checkbox.topAnchor.constraint(equalTo: filter_view.topAnchor, constant: 5).isActive = true
        medical_checkbox.leadingAnchor.constraint(equalTo: filter_view.leadingAnchor).isActive = true
        medical_checkbox.heightAnchor.constraint(equalTo: filter_view.heightAnchor, multiplier: 0.2).isActive = true
        medical_checkbox.widthAnchor.constraint(equalTo: filter_view.widthAnchor, multiplier: 0.8).isActive = true

        self.filter_view.addSubview(psycho_checkbox)
        psycho_checkbox.topAnchor.constraint(equalTo: medical_checkbox.bottomAnchor, constant: 5).isActive = true
        psycho_checkbox.leadingAnchor.constraint(equalTo: filter_view.leadingAnchor, constant: -3).isActive = true
        psycho_checkbox.heightAnchor.constraint(equalTo: filter_view.heightAnchor, multiplier: 0.2).isActive = true
        psycho_checkbox.widthAnchor.constraint(equalTo: filter_view.widthAnchor, multiplier: 0.9).isActive = true
        
        self.filter_view.addSubview(asso_checkbox)
        asso_checkbox.topAnchor.constraint(equalTo: psycho_checkbox.bottomAnchor, constant: 5).isActive = true
        asso_checkbox.leadingAnchor.constraint(equalTo: filter_view.leadingAnchor).isActive = true
        asso_checkbox.heightAnchor.constraint(equalTo: filter_view.heightAnchor, multiplier: 0.2).isActive = true
        asso_checkbox.widthAnchor.constraint(equalTo: filter_view.widthAnchor, multiplier: 0.8).isActive = true
        
        self.filter_view.addSubview(force_checkbox)
        force_checkbox.topAnchor.constraint(equalTo: asso_checkbox.bottomAnchor, constant: 5).isActive = true
        force_checkbox.leadingAnchor.constraint(equalTo: filter_view.leadingAnchor).isActive = true
        force_checkbox.heightAnchor.constraint(equalTo: filter_view.heightAnchor, multiplier: 0.2).isActive = true
        force_checkbox.widthAnchor.constraint(equalTo: filter_view.widthAnchor, multiplier: 0.53).isActive = true
    }
    
    func create_dataSet_header_set(){
        let c = MapView_sub_class()
        load_data_in_view(header_location_text: c.create_dataSet_header_set_aidePyschologique(), header_description_text: c.create_dataSet_description_set_aidePyschologique(), marker_color: UIColor(red: 238/255, green: 130/255, blue: 238/255, alpha: 1.0), category: "aide")
        load_data_in_view(header_location_text: c.create_dataSet_header_set_ccas(), header_description_text: c.create_dataSet_description_set_ccas(), marker_color: UIColor.systemYellow, category: "ccas")
        load_data_in_view(header_location_text: c.create_dataSet_header_set_helpToVictims(), header_description_text: c.create_dataSet_description_set_helpToVictims(), marker_color: UIColor(red: 0, green: 127/255, blue: 1, alpha: 1), category: "victims")
        load_data_in_view(header_location_text: c.create_dataSet_header_set_medicoPyschologique(), header_description_text: c.create_dataSet_description_set_medicoPyschologique(), marker_color: UIColor.systemPink , category: "medi")
    }
    
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        // Create new View
        v = Map_Info_view()
        // Retrieve stored data
        guard let dict = marker.userData as? [String:Place_C] else{
            return UIView();
        }
        // Declare obj
        let obj = (dict["obj"] as! Place_C)
        
        if(obj.Description == ""){
            v.init_component()
        }else{
            v.init_component_with_text_block()
        }
        // Set data for header & description_block
        v.description_block.text = obj.Description
        v.header.text = marker.title
        
        return v.view
    }
    
    
    func load_data_in_view(header_location_text : [String:CLLocationCoordinate2D], header_description_text : [String:String], marker_color: UIColor, category: String){
        // iterate the map
        for (key,values) in header_location_text{
            // Create temp GMSMarker instance
            let marker_obj = GMSMarker()
            marker_obj.title = key
            marker_obj.snippet = category
            marker_obj.position = values
            // Create temp place Instance
            var place_instance: Place_C?
            // Check content whether it is null
            if(header_description_text[key] != nil){
                place_instance = Place_C(Label: key, Description: header_description_text[key]!, Position: values)
            }else{
                place_instance = Place_C(Label: key, Description: "", Position: values)
            }
            //Store object in the marker
            marker_obj.userData = ["obj": place_instance]
            // Set marker icon colour
            marker_obj.icon = GMSMarker.markerImage(with: marker_color)
            // Store the data
            self.marker_arr.append(marker_obj)
        }
        
        activiate_marker()
    }
    
    func activiate_marker(){
        for m in marker_arr{
            m.map = self.mapView
        }
    }
    
    
    @objc func zoom_in_trigger(){
        if(zoom<14.0){
            zoom = zoom+1
            self.mapView?.animate(toZoom: Float(zoom))
        }
    }
    
    @objc func zoom_out_trigger(){
        if(zoom>4.0){
            zoom = zoom-1
            self.mapView?.animate(toZoom: Float(zoom))
        }
    }
    
    func update_table_view(category:String, status: Bool){
        for m in marker_arr{
            if m.snippet == category{
                if(status){
                    m.map = self.mapView
                }else{
                    m.map = nil
                }
            }
        }
    }
    
    
    @objc func q1(_ sender: DLRadioButton){
        if(bool_status_1 == false){
            sender.indicatorColor = .red
            sender.isSelected = true
            bool_status_1 = true
            update_table_view(category: "medi", status: bool_status_1)
        }else{
            sender.indicatorColor = .clear
            sender.isSelected = false
            bool_status_1 = false
            update_table_view(category: "medi", status: bool_status_1)
        }
    }
    
    @objc func q2(_ sender: DLRadioButton){
        if(bool_status_2 == false){
            sender.indicatorColor = .red
            sender.isSelected = true
            bool_status_2 = true
            update_table_view(category: "ccas", status: bool_status_2)
        }else{
            sender.indicatorColor = .clear
            sender.isSelected = false
            bool_status_2 = false
            update_table_view(category: "ccas", status: bool_status_2)
        }
    }
    
    @objc func q3(_ sender: DLRadioButton){
        if(bool_status_3 == false){
            sender.indicatorColor = .red
            sender.isSelected = true
            bool_status_3 = true
            update_table_view(category: "aide", status: bool_status_3)
        }else{
            sender.indicatorColor = .clear
            sender.isSelected = false
            bool_status_3 = false
            update_table_view(category: "aide", status: bool_status_3)
        }
    }
    
    @objc func q4(_ sender: DLRadioButton){
        if(bool_status_4 == false){
            sender.indicatorColor = .red
            sender.isSelected = true
            bool_status_4 = true
            update_table_view(category: "victims", status: bool_status_4)
        }else{
            sender.indicatorColor = .clear
            sender.isSelected = false
            bool_status_4 = false
            update_table_view(category: "victims", status: bool_status_4)
        }
    }
    
    @objc func set_base(){
        mapView?.mapType = .normal
    }
    
    @objc func set_hybride(){
        mapView?.mapType = .hybrid
    }
    
    @objc func set_satellite(){
        mapView?.mapType = .satellite
    }
    
    @objc func set_terrain(){
        mapView?.mapType = .terrain
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
