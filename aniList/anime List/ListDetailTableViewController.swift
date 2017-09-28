//
//  ListDetailTableViewController.swift
//  aniList
//
//  Created by Oscar Navidad on 9/27/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import UIKit

class ListDetailTableViewController: UITableViewController {

    var anime : Anime?
    @IBOutlet weak var imageAnime: UIImageView!
    @IBOutlet weak var titleAmine: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var sesionLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var romajiLabel: UILabel!
    @IBOutlet weak var nativeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Anime"
        self.fillData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fillData(){
        imageAnime.af_setImage(withURL: URL(string: (anime?.image_url_lge)!)!)
        imageAnime.contentMode = .scaleAspectFill
        titleAmine.text = anime?.title_romaji
        typeLabel.text = anime?.series_type
        nativeLabel.text = anime?.title_japanese
        romajiLabel.text = anime?.title_romaji
        genresLabel.text = anime?.genres?.joined()
        popularityLabel.text = String(describing: anime!.popularity!)
        avgLabel.text = String(describing: anime!.average_score!)
        sesionLabel.text = String(describing: anime?.season ?? 0)
        endLabel.text =  (anime?.end_date_fuzzy == nil) ? "No ended " : String(describing: anime?.end_date_fuzzy! ?? 0)
        startLabel.text = String(describing: anime!.start_date_fuzzy!)
        statusLabel.text = anime?.airing_status
        episodesLabel.text = String(describing: anime!.total_episodes!)
        
    }
    
}
