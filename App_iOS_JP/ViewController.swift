//
//  ViewController.swift
//  App_iOS_JP
//
//  Created by Telematica on 7/12/19.
//  Copyright © 2019 ApliMovil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        cell.textLabel?.text  = teams[indexPath.row]
        cell.imageView!.image = UIImage(named: teams[indexPath.row])!
        cell.setGradientBackground(colorOne: UIColor.yellow, colorTwo: UIColor(red:0,green:0.4667,blue:0.1216,alpha:1.0))
        return cell
    }
    
    
    var teams: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teams = ["Ecuador-Japon 1-1","Chile-Uruguay 0-1","Catar-Argentina 0-2","Colombia-Paraguay 1-0","Peru-Brasil 0-5","Bolivia-Venezuela 1-3","Brasil-Paraguay 0-0", "Venezuela-Argentina 0-2", "Colombia-Chile 0-0", "Uruguay-Peru 0-0", "Brasil-Argentina 2-0", "Chile-Peru 0-3", "Argentina-Chile 2-1", "Brasil-Peru 3-1"]
    view.setGradientBackground(colorOne: UIColor.yellow, colorTwo: UIColor(red:0,green:0.4667,blue:0.1216,alpha:1.0))
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}
}
