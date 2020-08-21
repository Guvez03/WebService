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

    
    @IBOutlet weak var dataPicker: UIPickerView!
    
    var list: [Results] = []
    
    var comingKind : [String] = ["book","movie","author","album", "coached-audio", "feature-movie", "interactive- booklet", "music-video", "pdf", "podcast", "podcast-episode", "software-package", "song, tv- episode"]
    
    var kind : String = ""
    var mText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        dataPicker.delegate = self
        dataPicker.dataSource = self
        
    }
    
    @IBAction func getButton(_ sender: Any) {
        
        mText = kindOfData.text!
        
        print(kind)
        print(mText)
        self.dataPicker.isHidden = false
        getSearchData(kind: kind, artistName: mText)
    }
    
    func getData(){
        
        AF.request("https://itunes.apple.com/search?term=jack+johnson",method: .get).responseJSON{ response in
            
            if let data  = response.data {
                
                do {
                    
                    let request = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let list = request.results{
                        
                        for dataList in list {
                           
                            self.list = list
                            self.dataPicker.isHidden = true
                            
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
    func getSearchData(kind:String,artistName:String){
          
          AF.request("https://itunes.apple.com/search?term=\(artistName)&entity=\(kind)",method: .get).responseJSON{ response in
              print("https://itunes.apple.com/search?term=\(artistName)&entity=\(kind)")
              if let data  = response.data {
                  
                  do {
                      
                      let request = try JSONDecoder().decode(Response.self, from: data)
                      
                      if let list = request.results{

                          for dataList in list {
                             
                              self.list = list
                              self.dataPicker.reloadAllComponents()
        
                          }
                        self.performSegue(withIdentifier: "goToCell", sender: list)
                        
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
                            self.dataPicker.isHidden = true
                            
                            
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
            
        }
    }
}

extension ViewController :UIPickerViewDelegate,UIPickerViewDataSource {
    
   
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
        
         
        self.kind = comingKind[row]
        self.dataPicker.isHidden = true
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "goToCell" {
        
        let doList = sender as? [Results]
        
        let destinationVc = segue.destination as! CollectionViewResults
        
            destinationVc.comeCollectionList = doList!
        
        
        }

       }
}

