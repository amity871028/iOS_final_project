//
//  PhotoCollectionViewController.swift
//  00657125_期末專案
//
//  Created by User04 on 2019/6/18.
//  Copyright © 2019 ntou. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotoCollectionViewController: UICollectionViewController {

    var photos: [String]?
    
    @IBOutlet weak var photosCollectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var photosCollectionViewControl: UICollectionView!

    let fullScreenSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photos = LikeSinger.readPhotosFromFile(){
            self.photos = photos
        }
        
        /*let width = (UIScreen.main.bounds.width - 2 * 1) / 4
        photosCollectionLayout?.itemSize = CGSize(width: width, height: width)
        
        photosCollectionLayout?.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)*/
        photosCollectionLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        photosCollectionLayout.itemSize = CGSize(width: fullScreenSize.width/2-10, height: 100)
        photosCollectionLayout.minimumLineSpacing = 5
        photosCollectionLayout.scrollDirection = .vertical
        photosCollectionLayout.headerReferenceSize = CGSize( width: fullScreenSize.width, height: 40)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        let photo = photos![indexPath.row]
        let url = LikeSinger.documentsDirectory.appendingPathComponent(photo).appendingPathExtension("jpg")
        cell.photoImageView.image = UIImage(contentsOfFile: url.path)
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
