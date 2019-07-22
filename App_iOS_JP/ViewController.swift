//
//  ViewController.swift
//  App_iOS_JP
//
//  Created by Telematica on 7/12/19.
//  Copyright © 2019 ApliMovil. All rights reserved.
//

import UIKit
import CoreData

var score = [NSManagedObject]()

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBAction func addScore(_ sender: Any) {
        let alert = UIAlertController(title: "Nuevo Marcador",
                                      message: "Añade un nuevo marcador",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Guardar",
                                       style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
                                        let textField = alert.textFields!.first
                                        self.saveScore(nameScore: textField!.text!)
                                        self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextField {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    func saveScore(nameScore:String){
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let entity = NSEntityDescription.entity(forEntityName: "DBapp", in: managedContext)
        let sc = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        //3
        sc.setValue(nameScore, forKey: "score")
        
        //4
        do {
            try managedContext.save()
            //5
            score.append(sc)
        } catch let error as NSError {
            print("No ha sido posible guardar \(error), \(error.userInfo)")
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: UIColor.yellow, colorTwo: UIColor(red:0,green:0.4667,blue:0.1216,alpha:1.0))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "scoreCell")
    }
    
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return score.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell")
        //Creamos un objeto task que recuperamos del array tasks
        let scor = score[indexPath.row]
        //Con KVC obtenemos el contenido del atributo "score" de la task y lo añadimos a nuestra Cell
        cell!.textLabel!.text = scor.value(forKey: "score") as? String
        //cell!.imageView!.image = scor.value(forKey: "score") as? UIImage

        //cell!.imageView!.image = UIImage(named: score[indexPath.row])!
        cell?.setGradientBackground(colorOne: UIColor.yellow, colorTwo: UIColor(red:0,green:0.4667,blue:0.1216,alpha:1.0))
        
        NSLog("Marcador: %@", score)
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        let fetchRequest : NSFetchRequest<DBapp> = DBapp.fetchRequest()
        
        // 3
        do {
            let results = try managedContext.fetch(fetchRequest)
            score = results as [NSManagedObject]
        } catch let error as NSError {
            print("No ha sido posible cargar \(error), \(error.userInfo)")
        }
        // 4
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
