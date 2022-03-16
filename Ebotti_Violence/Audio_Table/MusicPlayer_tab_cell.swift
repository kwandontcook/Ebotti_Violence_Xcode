//
//  MusicPlayer_tab_cell.swift
//  Ebotti_Violence
//
//  Created by kwok chung  kwan on 15/3/2022.
//

import UIKit

class MusicPlayer_tab_cell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.init_component()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false

        return v
    }()
    
    let Rank_label : UILabel = {
        let label = UILabel()
        label.text = ""
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Rank_icon : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "rank")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let Name_label : UILabel = {
        let label = UILabel()
        label.text = "123"
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Name_icon : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "person_grey")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let History_label : UILabel = {
        let label = UILabel()
        label.text = "123"
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let History_icon : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "history_grey")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let Message_text_view : UILabel = {
        let label = UILabel()
        label.text = "123"
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Message_icon : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "msg2")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let Mobile_text_view : UILabel = {
        let label = UILabel()
        label.text = "123"
        label.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let Mobile_icon : UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "smartphone")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    func init_component(){
        // Add component - Main View
        self.contentView.addSubview(main_view)
        main_view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        main_view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        main_view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        main_view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        // Add component Image
        self.main_view.addSubview(Rank_icon)
        Rank_icon.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        Rank_icon.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        Rank_icon.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        Rank_icon.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.18).isActive = true
        
        self.main_view.addSubview(Rank_label)
        Rank_label.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        Rank_label.leadingAnchor.constraint(equalTo: Rank_icon.trailingAnchor, constant: 10).isActive = true
        Rank_label.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.2).isActive = true
        Rank_label.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Add component Image
        self.main_view.addSubview(History_icon)
        History_icon.topAnchor.constraint(equalTo: Rank_icon.bottomAnchor, constant: 3).isActive = true
        History_icon.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        History_icon.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        History_icon.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.18).isActive = true
        
        self.main_view.addSubview(History_label)
        History_label.topAnchor.constraint(equalTo: Rank_label.bottomAnchor, constant: 3).isActive = true
        History_label.leadingAnchor.constraint(equalTo: History_icon.trailingAnchor, constant: 10).isActive = true
        History_label.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        History_label.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Add component Image
        self.main_view.addSubview(Message_icon)
        Message_icon.topAnchor.constraint(equalTo: History_icon.bottomAnchor, constant: 3).isActive = true
        Message_icon.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        Message_icon.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        Message_icon.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.18).isActive = true
        
        self.main_view.addSubview(Message_text_view)
        Message_text_view.topAnchor.constraint(equalTo: History_label.bottomAnchor, constant: 3).isActive = true
        Message_text_view.leadingAnchor.constraint(equalTo: Message_icon.trailingAnchor, constant: 10).isActive = true
        Message_text_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        Message_text_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Add component Image
        self.main_view.addSubview(Name_icon)
        Name_icon.topAnchor.constraint(equalTo: Message_icon.bottomAnchor, constant: 3).isActive = true
        Name_icon.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        Name_icon.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        Name_icon.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.18).isActive = true
        
        self.main_view.addSubview(Name_label)
        Name_label.topAnchor.constraint(equalTo: Message_text_view.bottomAnchor, constant: 3).isActive = true
        Name_label.leadingAnchor.constraint(equalTo: Name_icon.trailingAnchor, constant: 10).isActive = true
        Name_label.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        Name_label.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Add component Image
        self.main_view.addSubview(Mobile_icon)
        Mobile_icon.topAnchor.constraint(equalTo: Name_icon.bottomAnchor, constant: 3).isActive = true
        Mobile_icon.leadingAnchor.constraint(equalTo: main_view.leadingAnchor, constant: 10).isActive = true
        Mobile_icon.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        Mobile_icon.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.18).isActive = true
        
        self.main_view.addSubview(Mobile_text_view)
        Mobile_text_view.topAnchor.constraint(equalTo: Name_label.bottomAnchor, constant: 3).isActive = true
        Mobile_text_view.leadingAnchor.constraint(equalTo: Mobile_icon.trailingAnchor, constant: 10).isActive = true
        Mobile_text_view.heightAnchor.constraint(equalTo: main_view.heightAnchor, multiplier: 0.18).isActive = true
        Mobile_text_view.widthAnchor.constraint(equalTo: main_view.widthAnchor, multiplier: 0.8).isActive = true
    }
}
