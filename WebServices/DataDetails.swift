//
//  DataDetails.swift
//  WebServices
//
//  Created by ahmet on 19.08.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import UIKit
import Kingfisher

class DataDetails: UIViewController {
        
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var kindDetail: UILabel!
    
    @IBOutlet weak var nameDetail: UILabel!
    
    @IBOutlet weak var wrapperTypeDetail: UILabel!
    
    @IBOutlet weak var directorDetail: UILabel!
    
    
    @IBOutlet weak var countryDetail: UILabel!
    @IBOutlet weak var movieDetail: UILabel!
    
    var comingData : Results? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let url = URL(string: "\(comingData!.artworkUrl100!)")
        imageDetail.kf.setImage(with: url)
       
        if let comeText = comingData?.kind {
            kindDetail.text = "Tip : \( comingData!.kind!)"
        }else{
            kindDetail.isHidden = true
        }
        if let comeText = comingData?.trackName {
            nameDetail.text = "İsim : \( comingData!.trackName!)"
        }else{
            nameDetail.isHidden = true
        }
        if let comeText = comingData?.wrapperType {
            wrapperTypeDetail.text = "Sarıcı Tipi : \( comingData!.wrapperType!)"
        }else{
            wrapperTypeDetail.isHidden = true
        }
        if let comeText = comingData?.artistName {
            directorDetail.text = "Yönetici İsim : \( comingData!.artistName!)"
        }else{
            directorDetail.isHidden = true
        }
        if let comeText = comingData?.country {
            countryDetail.text = "Ülke : \( comingData!.country!)"
        }else{
            countryDetail.isHidden = true
        }
        if let comeText = comingData?.primaryGenreName {
            movieDetail.text = "Türü : \( comingData!.primaryGenreName!)"
        }else{
            movieDetail.isHidden = true
        }
    }
    

    
    

}
