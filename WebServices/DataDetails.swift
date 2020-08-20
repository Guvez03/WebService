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
       
        if comingData?.kind?.isEmpty == false {
            kindDetail.text = "Tip : \( comingData!.kind!)"

        }
        if comingData?.trackName?.isEmpty == false {
            nameDetail.text = "Track İsim : \(comingData!.trackName!)"

        }
        if comingData?.wrapperType?.isEmpty == false {
            wrapperTypeDetail.text = "Sarıcı Türü : \(comingData!.wrapperType!)"

        }
        if comingData?.artistName?.isEmpty == false {
            directorDetail.text = "Yönetmen Adı : \(comingData!.artistName!)"

        }
        if comingData?.country?.isEmpty == false {
            countryDetail.text = "Ülke : \(comingData!.country!)"

        }
        if comingData?.primaryGenreName?.isEmpty == false {
            movieDetail.text = "Tür : \(comingData!.primaryGenreName!)"

        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
