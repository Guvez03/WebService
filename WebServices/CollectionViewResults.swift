//
//  CollectionViewResults.swift
//  WebServices
//
//  Created by ahmet on 20.08.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewResults: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var comeCollectionList : [Results] = []
    
    var listone = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
}

extension CollectionViewResults: UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return comeCollectionList.count
           
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
        let selected = comeCollectionList[indexPath.row]
                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
           
        let url = URL(string: "\(selected.artworkUrl100!)")
        cell.imageUrl.kf.setImage(with: url)
        print(url)
        cell.label1.text = selected.artistName
        cell.label2.text = selected.kind
        cell.label3.text = selected.wrapperType
           
        return cell
       }
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
           let selectedItem = comeCollectionList[indexPath.row]
           print(selectedItem)
           
           performSegue(withIdentifier: "goToDetails", sender: selectedItem)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
          let selected = sender as? Results
                             
           let destinationVC = segue.destination as! DataDetails
                             
           destinationVC.comingData = selected

               }
    }
    
    
}
