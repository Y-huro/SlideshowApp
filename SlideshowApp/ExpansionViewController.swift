//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by y i on 2022/01/05.
//

import UIKit

class ExpansionViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var expansionImage = UIImage(named: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = expansionImage
        
        // Do any additional setup after loading the view.
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
