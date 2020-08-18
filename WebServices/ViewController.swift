//
//  ViewController.swift
//  WebServices
//
//  Created by ahmet on 17.08.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController   {

    @IBOutlet weak var kindOfData: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var dataPicker: UIPickerView!
    
    var list: [Results] = []
    var comingKind : [String] = ["song","video"]
    
    var type : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataPicker.delegate = self
        dataPicker.dataSource = self
        
    }
    func textFieldControl (){
        
        
    }
    func dataControl() {
        
        if type == "video" {
            print("sdfsdf")
              getDataMovie()
            }else if "song".isEqual(type) {
                print("sdfsdf")
            getData()
        }

    }
       
    func getData(){
        
        AF.request("https://itunes.apple.com/search?term=jack+johnson",method: .get).responseJSON{ response in
            
            if let data  = response.data {
                
                do {
                    
                    let request = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let list = request.results{
                        
                        for dataList in list {
                           
                            self.list = list
                            self.collectionView.reloadData()
                            self.dataPicker.isHidden = false

                            
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    func getSearchData(type:String){
          
          AF.request("https://itunes.apple.com/search?term=\(type)",method: .get).responseJSON{ response in
              
              if let data  = response.data {
                  
                  do {
                      
                      let request = try JSONDecoder().decode(Response.self, from: data)
                      
                      if let list = request.results{
                          
                          for dataList in list {
                             
                              self.list = list
                              self.collectionView.reloadData()
                              self.dataPicker.isHidden = false

                              
                          }
                      }
                  }catch{
                      print(error.localizedDescription)
                  }
                  
              }
              
          }
      }
     
    func getDataMovie(){
        
        AF.request("https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo",method: .get).responseJSON{ response in
            
            if let data  = response.data {
                
                do {
                    
                    let request = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let list = request.results{
                        
                        for dataList in list {
                           
                            self.list = list
                            self.collectionView.reloadData()
                            self.dataPicker.isHidden = false

                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
}

extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return list.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let datas = list[indexPath.row]
        
        let cell = 	collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        let url = URL(string: "\(datas.artworkUrl100!)")
        cell.imageUrl.kf.setImage(with: url)
        
        cell.label1.text = datas.artistName!
        cell.label2.text = datas.wrapperType!
        cell.label3.text = datas.kind!
        
        return cell
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return comingKind.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return comingKind[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        kindOfData.text = comingKind[row]
        self.type = kindOfData.text!
        kindOfData.text = ""
        getSearchData(type: type)
        self.dataPicker.isHidden = true
    }

}

