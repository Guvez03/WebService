//
//  ViewController.swift
//  WebServices
//
//  Created by ahmet on 17.08.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController   {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var list: [Results]?
    
    var aaa : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        

         getData()
        
    }
    func getData(){
        
        AF.request("https://itunes.apple.com/search?term=jack+johnson",method: .get).responseJSON{ response in
            
            if let data  = response.data {
                
                do {
                    
                    let request = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let list = request.results{
                        
                        for dataList in list {
                           
                            print(dataList.artistName!)
                            print(dataList.kind!)
                            print(dataList.wrapperType!)
                            print(dataList.collectionViewUrl!)
                            
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }

}

extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return list!.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let datas = list![indexPath.row]
        
        let cell = 	collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.imageView.image = UIImage(named: datas.collectionViewUrl!)
        cell.label1.text = datas.artistName!
        cell.label2.text = datas.wrapperType!
        cell.label3.text = datas.kind!
        
        return cell
    }
    
    
    
    
}

