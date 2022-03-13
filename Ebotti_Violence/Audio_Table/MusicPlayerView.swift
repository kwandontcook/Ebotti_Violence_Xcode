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
    
    var playing_status = true
    var currentIndex: Int?
    
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
        var height_pro = CGFloat(self.file_arr.count*40)/view.frame.height + 0.1
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
        self.read_recording_file_name()
        self.init_component()
        self.set_background_layer()
        self.table_view.delegate = self
        self.table_view.dataSource = self
        self.table_view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(activiate_edit_bar_btn))
    }
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return file_arr.count
    }

    private func read_recording_file_name(){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        do {
            self.file_arr = try FileManager.default.contentsOfDirectory(atPath: path)
            self.file_arr.sort()
            self.table_view.reloadData()
        } catch {
            print("Failed to fetch data from DB")
        }
    }
    
    var file_arr = [String]()
    var audio_player : AVAudioPlayer?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = file_arr[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let file_name = file_arr[indexPath.row]
        self.currentIndex = indexPath.row
        self.play_function(file_name: file_name)
    }
    
    func play_function (file_name: String){
        do{
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(file_name)
            
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSession.Category.playback)
            try session.setActive(true)
            
            self.audio_player = try AVAudioPlayer(contentsOf: path)
            self.audio_player?.delegate = self
            self.audio_player?.play()
            self.playing_status = true
            self.set_btn_image()
            self.audio_player?.volume = 1.0
            print("playing the audio")
        }catch let error{
            print(error)
            print("failed to fetch data")
        }
    }
    
    func delete_files_in_file_mangement(name: String){
        do{
            // Get the cached files
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(name)
            // Delete them
            try FileManager.default.removeItem(at: path)
            // Done message
            print("deleted successful")
            self.read_recording_file_name()
        }catch{
            print("error")
        }
    }

  
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete element in the array
            self.delete_files_in_file_mangement(name: file_arr[indexPath.row])
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
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
    
    @objc func activiate_edit_bar_btn(){
        if (self.table_view.isEditing) {
            self.table_view.setEditing(false, animated: true)
        } else {
            self.table_view.setEditing(true, animated: true)
        }
    }
    
    
    func set_btn_image(){
        if(!playing_status){
            self.play_pasue_audio_btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
            self.playing_status = true
        }else{
            self.play_pasue_audio_btn.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            self.playing_status = false
        }
    }
    
    
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
    
    @objc func play_last_song(){
        
        if let c = currentIndex{
            if(c-1<0){
                print("error happened : You are in the head")
            }else{
                self.currentIndex = c-1
                self.table_view.selectRow(at: IndexPath(row: c-1, section: 0), animated: true, scrollPosition: .none)
                self.play_function(file_name: file_arr[c-1])
                self.playing_status = true
                self.set_btn_image()
            }
        }
    }
    
    @objc func play_next_song(){
  
        if let c = currentIndex{
            if(c+1 == self.file_arr.count){
                print("error happened : You are in the tail")
            }else{
                self.currentIndex = c+1
                self.table_view.selectRow(at: IndexPath(row: c+1, section: 0), animated: true, scrollPosition: .none)
                self.play_function(file_name: file_arr[c+1])
                self.playing_status = true
                self.set_btn_image()
            }
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
