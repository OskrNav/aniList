//
//  ListTableViewController.swift
//  aniList
//
//  Created by Oscar Navidad on 9/27/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var listAnime : Array<Anime> = []
    var categories: [String:[Anime]] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Anime"
        self.getInformation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categories.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return Array(categories.keys)[section]
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        let key = Array(self.categories.keys)[indexPath.section]
        cell.listCategory = self.categories[key]!
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}

// MARK : Http Request
extension ListTableViewController {
    func getInformation(){
        let url = "browse/anime"
        Getdata(instasnce: self, url: url, callback: response)
    }
    
    func response(data: NSDictionary){
        let items = data["data"] as? NSArray
        for item in items!{
            listAnime.append(Anime(item as! NSDictionary))
        }
       
        // ordering array
        self.categories = listAnime.reduce([String:[Anime]]()) { (categories, show) -> [String:[Anime]] in
            var categories = categories
            for genre in show.genres!{
                categories[genre] = (categories[genre] ?? []) + [show]
            }
            return categories
        }
        self.tableView.reloadData()
    }
}
