//
//  MusicPlayerView.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 9/3/22.
//

import UIKit
import AVFoundation

class MusicPlayerView: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate{

    let button_view :UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.masksToBounds = true
        return v
    }()
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.masksToBounds = true
        return v
    }()
    
  
    var table_view : UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    
    var last_audio_btn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        btn.addTarget(self, action: #selector(play_last_song), for: .touchUpInside)
        return btn
    }()
    
    var play_pasue_audio_btn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.addTarget(self, action: #selector(play_pause_function), for: .touchUpInside)
        return btn
    }()
    
    var next_audio_btn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        btn.addTarget(self, action: #selector(play_next_song), for: .touchUpInside)
        return btn
    }()
    
    var height_for_row = 160
    var playing_status = true
    var currentIndex: Int?
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func set_background_layer(){
        // Set Layer background
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor,  UIColor.white.cgColor]
        gradientLayer.locations = [0.0,1.0]
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func init_component(){
        // Create root view for the controller
        self.view.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        main_view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        main_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Calculate hight
        var height_pro = CGFloat(self.audio_history.count*height_for_row)/view.frame.height + 0.1
        // Set contrainst to the height pro (It is possible that the threshold would go over 0.8)
        if(height_pro > 0.8){
            height_pro = 0.8
        }
        // Create table_view for the controller
        self.main_view.addSubview(table_view)
        table_view.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        table_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor).isActive = true
        table_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: height_pro).isActive = true
        table_view.widthAnchor.constraint(equalTo: main_view.widthAnchor).isActive = true
        
        // Create table_view for the controller
        self.main_view.addSubview(button_view)
        button_view.bottomAnchor.constraint(equalTo: main_view.bottomAnchor).isActive = true
        button_view.leadingAnchor.constraint(equalTo: main_view.leadingAnchor).isActive = true
        button_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.15).isActive = true
        button_view.widthAnchor.constraint(equalTo: main_view.widthAnchor).isActive = true
        
        self.add_component_btn_view()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetch_core_data()
        self.init_component()
        self.set_background_layer()
        self.table_view.delegate = self
        self.table_view.dataSource = self
        self.table_view.register(MusicPlayer_tab_cell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(activiate_edit_bar_btn))
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return audio_history.count
    }

    var audio_history = [AudioHistory]()
    var audio_player : AVAudioPlayer?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Declare cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicPlayer_tab_cell
        cell.backgroundColor = .clear
        cell.Rank_label.text = String(indexPath.row+1)
        cell.Name_label.text = audio_history[indexPath.row].person_name?.joined(separator: ",")
        cell.Mobile_text_view.text = audio_history[indexPath.row].mobile?.joined(separator: ",")
        cell.History_label.text = audio_history[indexPath.row].history_date_time
        cell.Message_text_view.text = audio_history[indexPath.row].message
        return cell
    }
   
    // Click event - Start Playing Music
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentIndex = indexPath.row
        self.play_function(file_name: audio_history[indexPath.row].file_name!)
    }
    
    // Fetch cached audio History for tableView display
    func fetch_core_data(){
        do{
            self.audio_history = try context.fetch(.init(entityName: "AudioHistory"))
        }catch{
             print("Failed to fetch audio history")
        }
        
        // Reload tableView
        DispatchQueue.main.async {
            self.table_view.reloadData()
        }
    }
    
    // Function to play the cached audio file -> Input is the fileName
    func play_function (file_name: String){
        do{
            // Access to the folder that stored the file
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(file_name)
            // Create AVAudio Session
            let session = AVAudioSession.sharedInstance()
            // Set Category
            try session.setCategory(AVAudioSession.Category.playback)
            try session.setActive(true)
            // Define setting for audio Player
            self.audio_player = try AVAudioPlayer(contentsOf: path)
            self.audio_player?.delegate = self
            self.audio_player?.volume = 1.0
            // Play Audio
            self.audio_player?.play()
            // Change button image and Update the status
            self.set_btn_image()
            self.playing_status = true
            // Message to identify whether the app play audio successfully
            print("playing the audio")
        }catch let error{
            print(error)
            print("failed to fetch data")
        }
    }
    
    // Function - to delete audio file in the repository
    func delete_files_in_file_mangement(name: String){
        do{
            // Get the cached files
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
            // Delete them
            try FileManager.default.removeItem(at: path)
            // Done message
            print("deleted successful")
            // Update coreData -> Refresh tableView
            self.fetch_core_data()
        }catch{
            print("error")
        }
    }
    
    // Function - to delete the cached message details
    func delete_fiels_in_core_data(name: String){
        for audio in audio_history{
            // Search the files
            if audio.file_name == name{
                // Delete the files after we find it
                self.context.delete(audio)
                print("delete data successful")
                // Save the changes
                do{
                    try self.context.save()
                    print("save data successful")
                }catch{
                    print("Failed to save data")
                }
            }
        }
    }

  
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete element in the array
            self.delete_files_in_file_mangement(name: audio_history[indexPath.row].history_date_time!)
            self.delete_fiels_in_core_data(name: audio_history[indexPath.row].history_date_time!)
            // Update the dataSet
            self.fetch_core_data()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Sub function of the init_component function - Create the View for play/pause, rollback button
    func add_component_btn_view(){
        self.button_view.addSubview(last_audio_btn)
        last_audio_btn.topAnchor.constraint(equalTo: button_view.topAnchor, constant: 10).isActive = true
        last_audio_btn.leadingAnchor.constraint(equalTo: button_view.leadingAnchor, constant: 10).isActive = true
        last_audio_btn.heightAnchor.constraint(equalTo: button_view.heightAnchor, multiplier: 0.8).isActive = true
        last_audio_btn.widthAnchor.constraint(equalTo: button_view.widthAnchor, multiplier: 0.3).isActive = true
        
        self.button_view.addSubview(play_pasue_audio_btn)
        play_pasue_audio_btn.topAnchor.constraint(equalTo: button_view.topAnchor, constant: 10).isActive = true
        play_pasue_audio_btn.leadingAnchor.constraint(equalTo: last_audio_btn.trailingAnchor, constant: 10).isActive = true
        play_pasue_audio_btn.heightAnchor.constraint(equalTo: button_view.heightAnchor, multiplier: 0.8).isActive = true
        play_pasue_audio_btn.widthAnchor.constraint(equalTo: button_view.widthAnchor, multiplier: 0.3).isActive = true
        
        self.button_view.addSubview(next_audio_btn)
        next_audio_btn.topAnchor.constraint(equalTo: button_view.topAnchor, constant: 10).isActive = true
        next_audio_btn.leadingAnchor.constraint(equalTo: play_pasue_audio_btn.trailingAnchor, constant: 10).isActive = true
        next_audio_btn.heightAnchor.constraint(equalTo: button_view.heightAnchor, multiplier: 0.8).isActive = true
        next_audio_btn.widthAnchor.constraint(equalTo: button_view.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    // Function - Set status for tableView Edit
    @objc func activiate_edit_bar_btn(){
        if (self.table_view.isEditing) {
            self.table_view.setEditing(false, animated: true)
        } else {
            self.table_view.setEditing(true, animated: true)
        }
    }
    
    // Update the play/pause btn image
    func set_btn_image(){
        if(!playing_status){
            self.play_pasue_audio_btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.playing_status = true
        }else{
            self.play_pasue_audio_btn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            self.playing_status = false
        }
    }
    
    // Function - TO play and pause the audio
    @objc func play_pause_function(){
        if(!playing_status){
            if let _ = self.audio_player?.url{
                self.audio_player?.pause()
            }
        }else{
            if let _ = self.audio_player?.url{
                self.audio_player?.play()
            }
        }
        // update btn status
        self.set_btn_image()
    }
    
    // Function - To play the previous song in the list
    @objc func play_last_song(){
        if let c = currentIndex{
            if(c-1<0){
                print("error happened : You are in the head")
            }else{
                self.currentIndex = c-1
                self.table_view.selectRow(at: IndexPath(row: c-1, section: 0), animated: true, scrollPosition: .none)
                self.play_function(file_name: audio_history[c-1].file_name!)
                self.playing_status = true
                self.set_btn_image()
            }
        }
    }
    
    // Function - To play the next song in the lists
    @objc func play_next_song(){
        if let c = currentIndex{
            if(c+1 == self.audio_history.count){
                print("error happened : You are in the tail")
            }else{
                self.currentIndex = c+1
                self.table_view.selectRow(at: IndexPath(row: c+1, section: 0), animated: true, scrollPosition: .none)
                self.play_function(file_name: audio_history[c+1].file_name!)
                self.playing_status = true
                self.set_btn_image()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(height_for_row)
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
