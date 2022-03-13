//
//  MusicPlayer.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 9/3/22.
//

import UIKit
import AVFoundation

class MusicPlayer: UITableViewController, AVAudioPlayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.read_recording_file_name()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    func set_background_layer(){
        // Set Layer background
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.init(_colorLiteralRed: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor,  UIColor.white.cgColor]
        gradientLayer.locations = [0.0,1.0]
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return file_arr.count
    }

    private func read_recording_file_name(){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        do {
            self.file_arr = try FileManager.default.contentsOfDirectory(atPath: path)
            self.file_arr.sort()
            self.tableView.reloadData()
        } catch {
            print("Failed to fetch data from DB")
        }
    }
    
    var file_arr = [String]()
    var audio_player : AVAudioPlayer?
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = file_arr[indexPath.row]
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let file_name = file_arr[indexPath.row]
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(file_name)
        
        do{
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSession.Category.playback)
            try session.setActive(true)
            
            self.audio_player = try AVAudioPlayer(contentsOf: path)
            self.audio_player?.delegate = self
            self.audio_player?.play()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete element in the array
            self.delete_files_in_file_mangement(name: file_arr[indexPath.row])
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
