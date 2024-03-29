//
//  TableViewController.swift
//  Homework3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var foodList: [food] = [food]()
    
    var foodListPath : String{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("foodList").path
    }

    func initFoodList (){
        if let foods = NSKeyedUnarchiver.unarchiveObject(withFile: foodListPath) as? [food] {
            foodList = foods
        }
        else{
            foodList.append(food(name: "cake", description: "sweet", category: "cake", foodAvatar: nil))
            foodList.append(food(name: "needle", description: "delicious", category: "needle", foodAvatar: nil))
        }
        
        //tableView.rowHeight = 120
    }

    func saveFoodFile() {
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: food.ArchiveURL.path)
        if !success {
            print("Failed")
        }
    }
    
    func loadFoodFile()-> [food]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path) as? [food] )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        initFoodList()
        
    }
    
    @IBAction func cancelToList (segue: UIStoryboardSegue){
        
    }
    
    @IBAction func saveToList (segue: UIStoryboardSegue){
        if let addFoodVC = segue.source as? descViewController{
            if let addFood = addFoodVC.foodForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    //Update an existing meal
                    foodList[(selectedIndexPath as NSIndexPath).row] = addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                } else{
                    foodList.append(addFood)
                    let newIndexPath = IndexPath(row: foodList.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
        saveFoodFile()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! foodTableViewCell

        // Configure the cell...
        //cell.textLabel?.text = foodList[indexPath.row].name
        //cell.detailTextLabel?.text = foodList[indexPath.row].descrption
        cell.avatarImage.image = foodList[indexPath.row].foodAvatar
        cell.titleText.text = foodList[indexPath.row].name
        cell.descriptionText.text = foodList[indexPath.row].descrption
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            foodList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveFoodFile()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showDetail") {
            let descriptionVC = segue.destination as! descViewController
            if let selectedCell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedFood = foodList[(indexPath as NSIndexPath).row]
                descriptionVC.foodForEdit = selectedFood
            }
            print("show detail now")
        }else {
            print("add new food")
        }
        
        
    }
    

}
