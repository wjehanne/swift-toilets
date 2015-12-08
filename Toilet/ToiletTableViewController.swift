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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Sample Data for candyArray
        if(ToiletSingleton.instance.toilet.count>0){
            print("je suis ici coucou petite peruche \(ToiletSingleton.instance.toilet.count)")
            self.toilets = ToiletSingleton.instance.toilet
        }
        
        // Reload the table
        self.myTableView.reloadData()
    }
    
    func didRetrieveData(toilets: [Toilet]){
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toilets!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = self.myTableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        
        if (cell == nil) {
            cell = UITableViewCell()
        }
        
        cell!.textLabel?.text = self.toilets[indexPath.row].title
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}
