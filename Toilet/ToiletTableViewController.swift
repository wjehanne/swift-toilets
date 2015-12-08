//
//  ToiletTableViewController.swift
//  Toilet
//
//  Created by William JEHANNE on 08/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import UIKit

class ToiletTableViewController: UITableViewController, DataProtocol {

    @IBOutlet var myTableView: UITableView!
    var toilets:[Toilet]! = []
    let data = ToiletSingleton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.askForDataWith(self)
    }
    
    func didRetrieveData(toilets: [Toilet]){
        print("je suis ici")
        self.toilets = toilets
        print(self.toilets)
        self.myTableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toilets!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = self.myTableView.dequeueReusableCellWithIdentifier("cellule") as UITableViewCell?
        
        if (cell == nil) {
            cell = UITableViewCell()
        }
        
        cell!.textLabel?.text = self.toilets[indexPath.row].title
        cell!.detailTextLabel?.text = "coucou petite peruche"
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}
