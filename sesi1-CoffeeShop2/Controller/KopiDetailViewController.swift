//
//  KopiDetailViewController.swift
//  sesi1-CoffeeShop2
//
//  Created by Dony Prastiya on 25/02/23.
//

import UIKit

class KopiDetailViewController: UIViewController {
    @IBOutlet weak var review2: UILabel!
    @IBOutlet weak var review1: UILabel!
    @IBOutlet weak var stack1: UIStackView!
    @IBOutlet weak var ketDetail: UILabel!
    @IBOutlet weak var alamatDetail: UILabel!
    @IBOutlet weak var namaDetail: UILabel!
    @IBOutlet weak var gambarDetail: UIImageView!
    
    var gambar : UIImage!
    var nama : String!
    var alamat : String!
    var ket : String!
    var review : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stack1.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
        gambarDetail.image = gambar
        namaDetail.text = nama
        alamatDetail.text = alamat
        ketDetail.text = ket
        review1.text = review
        review2.text = review
    }
//    
//    @IBAction func backButton(_ sender: Any) {
////        dismiss(animated: true)
//        navigationController?.popViewController(animated: true)
//    }
//    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
