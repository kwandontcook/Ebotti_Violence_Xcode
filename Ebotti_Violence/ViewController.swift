//
//  ViewController.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 27/2/22.
//

import UIKit
import AVFoundation
import CoreData
import MessageUI

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AVAudioPlayerDelegate, AVAudioRecorderDelegate, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
            case MessageComposeResult.cancelled:
                print("User canceled to send email ")
            case MessageComposeResult.failed:
                print("Error : Message cant deliever to the recipients")
            case MessageComposeResult.sent:
                print("Message sent successfully")
                dismiss(animated: true, completion: {
                    self.audio_record_permission()
                })
            default:
                return
        }
        dismiss(animated: true, completion: nil)
    }
    
    // Set section for collectionview
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    // Set row number for section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    // Set cell for each section
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_1", for: indexPath) as! Main_page_col_cell_1
            return cell
        }else if(indexPath.section == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_2", for: indexPath) as! Main_page_col_cell_2
            cell.navigationController = self.navigationController
            return cell
        }else if(indexPath.section == 2){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_3", for: indexPath) as! Main_page_col_cell_3
            cell.navigationController = self.navigationController
            return cell
        }else if(indexPath.section == 3){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_4", for: indexPath) as! Main_page_col_cell_4
            cell.navigationController = self.navigationController
            return cell
        }else if(indexPath.section == 4){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_5", for: indexPath) as! Main_page_col_cell_5
            cell.navigationController = self.navigationController
            return cell
        }else if(indexPath.section == 5){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_6", for: indexPath) as! Main_page_col_cell_6
            return cell
        }else if(indexPath.section == 6) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_7", for: indexPath) as! Main_page_col_cell_7
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main_page_cell_8", for: indexPath) as! Main_page_col_cell_8
            cell.navigationController = self.navigationController
            return cell
        }
  
    }
    // Set size for each collection view cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
      {
          if(indexPath.section == 0){
              return CGSize(width: self.collection_view.frame.width-10, height: 150.0)
          }else if(indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 7){
              return CGSize(width: self.collection_view.frame.width-10, height: 280.0)
          }else if(indexPath.section == 6){
              return CGSize(width: self.collection_view.frame.width-10, height: 220.0)
          }else{
              return CGSize(width: self.collection_view.frame.width-10, height: 140.0)
          }


      }
    // set spacing between each section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 5.0, bottom: 10.0, right: 5.0)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set title
        self.title = ""
        self.init_loading()
        // register colllection view
        self.collection_view.register(Main_page_col_cell_1.self, forCellWithReuseIdentifier: "main_page_cell_1")
        self.collection_view.register(Main_page_col_cell_2.self, forCellWithReuseIdentifier: "main_page_cell_2")
        self.collection_view.register(Main_page_col_cell_3.self, forCellWithReuseIdentifier: "main_page_cell_3")
        self.collection_view.register(Main_page_col_cell_4.self, forCellWithReuseIdentifier: "main_page_cell_4")
        self.collection_view.register(Main_page_col_cell_5.self, forCellWithReuseIdentifier: "main_page_cell_5")
        self.collection_view.register(Main_page_col_cell_6.self, forCellWithReuseIdentifier: "main_page_cell_6")
        self.collection_view.register(Main_page_col_cell_7.self, forCellWithReuseIdentifier: "main_page_cell_7")
        self.collection_view.register(Main_page_col_cell_8.self, forCellWithReuseIdentifier: "main_page_cell_8")
        // delegate and dataSource
        self.collection_view.delegate = self
        self.collection_view.dataSource = self
    }
    

    func generate_background_image() -> UIImageView {
        let v_view = UIImageView()
        v_view.image = UIImage(named: "nc4")
        v_view.contentMode = .scaleToFill
        v_view.translatesAutoresizingMaskIntoConstraints = false
        return v_view
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
    
    var menu_area: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        return v
    }()
    
    var date_picker : DateFormatter = {
        let d = DateFormatter()
        d.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return d
    }()
    
    var stack_view : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var history_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(link_to_play_audio_page), for: .touchUpInside)
        btn.setImage(UIImage(named: "history_white"), for: .normal)
        return btn
    }()
    
    var manual_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "guide_icon_white"), for: .normal)
        return btn
    }()
    
    
    var mainAlert_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.backgroundColor = UIColor.init(_colorLiteralRed: 204/255.0, green: 0, blue: 0, alpha: 1)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)  
        btn.setTitle("ALERTER", for: .normal)
        btn.addTarget(self, action: #selector(record_audio), for: .touchUpInside)
        return btn
    }()
    
    
    var share_button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "share_icon_white"), for: .normal)
        btn.addTarget(self, action: #selector(link_to_app_store), for: .touchUpInside)
        return btn
    }()
    
    var audioRecord: AVAudioRecorder?
    var recordingSession: AVAudioSession?
    var recording_stand_by = true
    var messageVC = MFMessageComposeViewController()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var last_stored_file = ""
    
    func init_loading(){
        // Load background image
        self.collection_view.backgroundView = generate_background_image()
        // Set constraint for collection_adv_view
        self.view.addSubview(collection_view)
        collection_view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection_view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection_view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection_view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.90).isActive = true
        collection_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        // Add menu area
        self.view.addSubview(menu_area)
        menu_area.topAnchor.constraint(equalTo: collection_view.bottomAnchor).isActive = true
        menu_area.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menu_area.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menu_area.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        menu_area.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        // adding button to stack view
        self.adding_button_for_stack_view()
        self.color_setting()
    }

    // Function - Setting up nav bar color and bar button color
    func color_setting(){
        if #available(iOS 15.0, *) {
            let barAppearance = UINavigationBarAppearance()
            barAppearance.backgroundColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
            barAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            navigationController?.navigationBar.standardAppearance = barAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        }
    }
    
    // Function - Setting up tabBar in view
    func adding_button_for_stack_view(){
        self.menu_area.addSubview(stack_view)
        stack_view.topAnchor.constraint(equalTo: menu_area.topAnchor).isActive = true
        stack_view.leftAnchor.constraint(equalTo: menu_area.leftAnchor).isActive = true
        stack_view.rightAnchor.constraint(equalTo: menu_area.rightAnchor).isActive = true
        stack_view.bottomAnchor.constraint(equalTo: menu_area.bottomAnchor).isActive = true
        
        // Add button - history_button
        stack_view.addSubview(history_button)
        history_button.topAnchor.constraint(equalTo: menu_area.topAnchor, constant: 11).isActive = true
        history_button.leftAnchor.constraint(equalTo: menu_area.leftAnchor, constant: 7).isActive = true
        history_button.heightAnchor.constraint(equalTo: menu_area.widthAnchor, multiplier: 0.1).isActive = true
        history_button.widthAnchor.constraint(equalTo: menu_area.widthAnchor, multiplier: 0.1).isActive = true
 
        // Bind action
        manual_button.addTarget(self, action: #selector(guide_view), for: .touchUpInside)
        // Add button - manual_button
        stack_view.addSubview(manual_button)
        manual_button.topAnchor.constraint(equalTo: menu_area.topAnchor, constant: 11).isActive = true
        manual_button.leadingAnchor.constraint(equalTo: history_button.trailingAnchor, constant: 15).isActive = true
        manual_button.heightAnchor.constraint(equalTo: menu_area.widthAnchor, multiplier: 0.1).isActive = true
        manual_button.widthAnchor.constraint(equalTo: menu_area.widthAnchor, multiplier: 0.1).isActive = true
        
        // Add button - manual_button
        stack_view.addSubview(mainAlert_button)
        mainAlert_button.topAnchor.constraint(equalTo: menu_area.topAnchor, constant: 10).isActive = true
        mainAlert_button.leadingAnchor.constraint(equalTo: manual_button.trailingAnchor, constant: 20).isActive = true
        mainAlert_button.heightAnchor.constraint(equalTo: menu_area.heightAnchor, multiplier: 0.52).isActive = true
        mainAlert_button.widthAnchor.constraint(equalTo: menu_area.widthAnchor, multiplier: 0.45).isActive = true
        
        // Add button - share_button
        stack_view.addSubview(share_button)
        share_button.topAnchor.constraint(equalTo: menu_area.topAnchor, constant: 11).isActive = true
        share_button.leadingAnchor.constraint(equalTo: mainAlert_button.trailingAnchor, constant: 25).isActive = true
        share_button.heightAnchor.constraint(equalTo: menu_area.widthAnchor, multiplier: 0.1).isActive = true
        share_button.widthAnchor.constraint(equalTo: menu_area.widthAnchor, multiplier: 0.1).isActive = true
    }
    
    // Function - Open the file
    @objc func guide_view(){
        let v = Info_Pdf_view()
        v.file_name = "guide3"
        self.navigationController?.pushViewController(v, animated: true)
    }
    
    // Function - Share the app to others
    @objc func link_to_app_store(){
        let url = URL(string:"https://play.google.com/store/apps/details?id=nc.dignity")!
        let activity_c = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        activity_c.title = "Application Android Dignity";
        self.present(activity_c, animated: true)
    }
    
    // Function - nav to audio list page
    @objc func link_to_play_audio_page(){
        let v = MusicPlayerView()
        self.navigationController?.pushViewController(v, animated: true)
    }
    
    // Function - record audio
    @objc func record_audio(){
        if(recording_stand_by){
            // self.audio_record_permission()
            self.send_sms()
        }else{
            // Stop the audio
            self.audioRecord?.stop()
            self.recording_stand_by = true
            print("Finished Recording")
            // Save the audio into the coreData
            self.create_audio_instance()
        }
    }
    
    // Function - Fetch the cached person name by their mobile
    func retrieve_person_name(mobiles:[String]) -> [String]{
        var person_list = [String]()
        var cached_friend_list = [Emergency_C]()
        
        do{
            cached_friend_list = try self.context.fetch(.init(entityName: "Emergency_C"))
        }catch{
            print ("failed to fetch data")
        }
        
        for friend in cached_friend_list{
            for m in mobiles{
                if (m == friend.mobile){
                    person_list.append(friend.name!)
                }
            }
        }
        
        return person_list
    }
    
    // Store the audio data into cache
    func create_audio_instance(){
        let obj = AudioHistory(context: self.context)
        obj.message = messageVC.body ?? ""
        obj.file_name = self.last_stored_file
        obj.history_date_time = date_picker.string(from: Date())
        obj.mobile = messageVC.recipients ?? [String]()
        
        if let c = messageVC.recipients{
            obj.person_name = self.retrieve_person_name(mobiles: c)
        }else{
            obj.person_name = [String]()
        }
    
        do{
            try self.context.save()
            print("Saved Successfully")
        }catch{
            print("Error to Save Data")
        }
    }
    

    func audio_record_permission(){
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession!.setCategory(.playAndRecord, mode: .default)
            try recordingSession!.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            try recordingSession!.setActive(true)
                    
            recordingSession!.requestRecordPermission() { [unowned self] allowed in
                    self.recording_stand_by = false
                    self.audio_record()
            }
        } catch {
            print("Failed to grant recording accession")
        }
    }
    
    
    
    func send_sms(){
        var cached_friend_list = [Emergency_C]()
        var phone_list = [String]()

        // retrieve friend list
        do{
            cached_friend_list = try self.context.fetch(.init(entityName: "Emergency_C"))
        }catch{
            print ("failed to fetch data")
        }
        
        // Handle error - If no friend added in the contact
        if(cached_friend_list.count == 0){
            // Pop up error alerter
            let error_alerter = UIAlertController(title: "ERROR", message: "Please add at least one person to contact", preferredStyle: .alert)
            error_alerter.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(error_alerter, animated: true, completion: nil)
        }else{
            for i in 0..<cached_friend_list.count{
                phone_list.append(cached_friend_list[i].mobile!)
            }
            // present sms controller
            sms_controller_present(mobile: phone_list)
        }
    }
    
    
    func sms_controller_present(mobile: [String]){
        // Check whether we can open this viewController
        guard MFMessageComposeViewController.canSendText() else { return }
        // Create new Controller
        messageVC = MFMessageComposeViewController()
        messageVC.body = "Sending SMS to the registered audiencess";
        messageVC.recipients = mobile
        messageVC.messageComposeDelegate = self;
        messageVC.isEditing = false
        messageVC.disableUserAttachments()
        self.present(messageVC, animated: true, completion: nil)
    }
    
    
    func audio_record(){
        let current_dateTime = date_picker.string(from: Date()).replacingOccurrences(of: " ", with: "_").replacingOccurrences(of: "-", with: "_").replacingOccurrences(of: ":", with: "_")
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(current_dateTime)
 
        // If url is not null
        let setting =  [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
            
        do{
            try self.audioRecord = AVAudioRecorder(url: url, settings:  setting)
            self.audioRecord!.delegate = self
            self.audioRecord!.prepareToRecord()
            self.audioRecord!.record()
            self.last_stored_file = url.lastPathComponent
            print("recording")
        }catch{
            print("error")
        }
    }
    

}

