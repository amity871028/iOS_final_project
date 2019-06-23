//
//  SongsTableViewController.swift
//  00657125_期末專案
//
//  Created by User04 on 2019/6/19.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit
import AVKit

class SongsTableViewController: UITableViewController {
    var name: String?
    var songs = [Song]()
    var singerImage: String?
    @IBOutlet weak var singerImageView: UIImageView!
    @IBOutlet weak var singerNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let singerImage = singerImage {
            let url = LikeSinger.documentsDirectory.appendingPathComponent(singerImage).appendingPathExtension("jpg")
            
            singerImageView.image = UIImage(contentsOfFile: url.path)
        }
        if let name = name {
            singerNameLabel.text = name
            let tmp = "https://itunes.apple.com/search?term=" + name + "&media=music"
            if let urlString = tmp.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlString) {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    let decoder = JSONDecoder()
                    if let data = data, let songResults = try? decoder.decode(SongResults.self, from: data) {
                        self.songs = songResults.results
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    
                }
                task.resume()
            }
        }
        
        
    }
    
    var player: AVPlayer?
    
    @IBAction func playMusic(_ sender: UIButton) {
        
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            let song = songs[indexPath.row]
            if let url =  song.previewUrl {
                player = AVPlayer(url: url)
                player?.play()
            }
        }
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongsTableViewCell
        let song = songs[indexPath.row]
        cell.trackNameLabel.text = song.trackName
        cell.collectionNameLabel.text = song.collectionName
        
        let task = URLSession.shared.dataTask(with: song.artworkUrl100) { (data, response , error) in
            if let data = data {
                DispatchQueue.main.async {
                    cell.photoImageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
        return cell
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
    
}
