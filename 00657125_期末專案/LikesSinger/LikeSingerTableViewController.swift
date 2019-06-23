//
//  LikeSingerTableViewController.swift
//  00657125_期末專案
//
//  Created by User04 on 2019/6/18.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit

class LikeSingerTableViewController: UITableViewController {

    var likeSingers = [LikeSinger]()
    var photos = [String]()
    @IBAction func unwindToLoverTableView(segue: UIStoryboardSegue) {
        if let controller = segue.source as? EditLikeSingerTableViewController, let likeSinger = controller.likeSinger, let photo = controller.photo {
            
            likeSingers.insert(likeSinger, at: 0)
            LikeSinger.saveToFile(likeSingers: likeSingers)
            
            photos.insert(photo, at: 0)
            LikeSinger.saveToFile(photos: photos)
            
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let likeSingers = LikeSinger.readLikeSingersFromFile() {
            self.likeSingers = likeSingers
        }
        if let photos = LikeSinger.readPhotosFromFile(){
            self.photos = photos
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return likeSingers.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        likeSingers.remove(at: indexPath.row)
        photos.remove(at: indexPath.row)
        LikeSinger.saveToFile(likeSingers: likeSingers)
        LikeSinger.saveToFile(photos: photos)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikeSingerCell", for: indexPath) as! LikeSingerTableViewCell
        
        // Configure the cell...
        let likeSinger = likeSingers[indexPath.row]
        cell.nameLabel.text = likeSinger.name
        
        let url = LikeSinger.documentsDirectory.appendingPathComponent(likeSinger.imageName).appendingPathExtension("jpg")
        
        cell.photoImageView.image = UIImage(contentsOfFile: url.path)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.performSegue(withIdentifier: "showSong", sender: likeSingers[indexPath.row])
        
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSong" {
            let controller = segue.destination as? SongsTableViewController
            let likeSinger = sender as? LikeSinger
            controller?.name = likeSinger?.name
            controller?.singerImage = likeSinger?.imageName
        }
    }
}
