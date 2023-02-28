//
//  KopiViewCell.swift
//  sesi1-CoffeeShop2
//
//  Created by Dony Prastiya on 25/02/23.
//

import UIKit

class KopiViewCell: UITableViewCell {
    @IBOutlet weak var ket: UILabel!
    @IBOutlet weak var alamat: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var gambar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gambar.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
