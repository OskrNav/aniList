//
//  File.swift
//  aniList
//
//  Created by Oscar Navidad on 9/25/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import Foundation
struct Anime {
    var id : Int?
    var series_type : String?
    var title_romaji : String?
    var title_english : String?
    var title_japanese : String?
    var type : String?
    var start_date_fuzzy : Int?
    var end_date_fuzzy : Int?
    var season : Int?
    var description : String?
    var synonyms : Array<String>?
    var genres : Array<String>?
    var adult : Bool?
    var average_score : Double?
    var popularity : Int?
    var favourite : Bool?
    var image_url_sml : String?
    var image_url_med : String?
    var image_url_lge  : String?
    var image_url_banner : String?
    var updated_at : Int?
    
    init(_ data:NSDictionary){
        if let id = data["id"] as? Int {
            self.id = id
        }
        
        if let series_type = data["series_type"] as? String {
            self.series_type = series_type
        }
        
        if let title_romaji = data["title_romaji"] as? String{
            self.title_romaji = title_romaji
        }
        
        if let title_english = data["title_english"] as? String{
            self.title_english = title_english
        }
        
        if let title_japanese = data["title_japanese"] as? String{
            self.title_japanese = title_japanese
        }
        
        if let type = data["type"] as? String{
            self.type = type
        }
        
        if let start_date_fuzzy = data["start_date_fuzzy"] as? Int {
            self.start_date_fuzzy = start_date_fuzzy
        }
        
        if let end_date_fuzzy = data["end_date_fuzzy"] as? Int{
            self.end_date_fuzzy = end_date_fuzzy
        }
        
        if let season = data["season"] as? Int{
            self.season = season
        }
        
        if let description = data["description"] as? String{
            self.description = description
        }
        
        if let synonymsItems = data["synonyms"] as? NSArray{
            self.synonyms = Array()
            for item in synonymsItems{
                self.synonyms?.append(item as! String)
            }
            
        }
        
        if let genresItems = data["genres"] as? NSArray{
            self.genres = Array()
            for item in genresItems{
                self.genres?.append(item as! String)
            }
            
        }
        
        if let adult = data["adult"] as? Bool{
            self.adult = adult
        }
        
        if let average_score = data["average_score"] as? Double{
            self.average_score = average_score
        }
        
        if let popularity =  data["popularity"] as? Int{
            self.popularity = popularity
        }
        
        if let favourite = data["favourite"] as? Bool{
            self.favourite = favourite
        }
        
        if let image_url_sml = data["image_url_sml"] as? String{
            self.image_url_sml = image_url_sml
        }
        
        if let image_url_med = data["image_url_med"] as? String{
            self.image_url_med = image_url_med
        }
        
        if let image_url_lge = data["image_url_lge"] as? String{
            self.image_url_lge = image_url_lge
        }
        
        if let image_url_banner = data["image_url_banner"] as? String{
            self.image_url_banner = image_url_banner
        }
        
        if let updated_at = data["updated_at"] as? Int{
            self.updated_at = updated_at
        }
        
    }
}

