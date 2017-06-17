//
//  ViewController.swift
//  KidsToyController
//
//  Created by qamarali on 6/12/17.
//  Copyright © 2017 qamarali. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var toysDis : [ToyPhoto] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            toysDis = try context.fetch(ToyPhoto.fetchRequest())
            tableView.reloadData()
        } catch {
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toysDis.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let toy = toysDis[indexPath.row]
        cell.textLabel?.text = toy.title
        cell.imageView?.image = UIImage(data: toy.image as! Data)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let toy = toysDis[indexPath.row]
     performSegue(withIdentifier: "toysegue", sender: toy)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let detailViewControl = segue.destination as! ToyViewController
        detailViewControl.selectedToy = sender as? ToyPhoto
        
        
    }

}

