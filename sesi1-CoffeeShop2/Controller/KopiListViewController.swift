//
//  KopiListViewController.swift
//  sesi1-CoffeeShop2
//
//  Created by Dony Prastiya on 25/02/23.
//

import UIKit

class KopiListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var kopis: [Kopi] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        loadDataCoffee()
        
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadDataCoffee(){
        kopis = KopiProvider.all()
    }
    
    func deleteKopi(at index: Int){
        
        let kopi = kopis[index]
        
        let alert = UIAlertController(title: "DELETE", message: "Yakin sob hapus ini \(kopi.name)?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ga", style: UIAlertAction.Style.cancel))
        alert.addAction(UIAlertAction(title: "Ya", style: UIAlertAction.Style.default, handler: { _ in
            self.kopis.remove(at: index)
            self.tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.none)
        }))
        present(alert, animated: true)
    }
    
    
}
    
    extension KopiListViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return kopis.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_ID", for: indexPath) as! KopiViewCell
            
            let value = kopis[indexPath.row]
            cell.gambar.image = UIImage(named: value.image)
            cell.nama.text = value.name
            cell.alamat.text = value.location
            cell.ket.text = "Coffee Shop / Cafe"
            return cell
        }
}

extension KopiListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let kopi = kopis[indexPath.row]
//        let alert = UIAlertController(title: kopi.name, message: kopi.location, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "OKE", style: UIAlertAction.Style.default))
//        present(alert, animated: true)
        
        let storyboard = UIStoryboard(name: "KopiListView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "KopiDetail") as! KopiDetailViewController
        viewController.gambar = UIImage(named: kopi.image)
        viewController.nama = kopi.name
        viewController.alamat = kopi.location
        viewController.ket = "Coffee Shop / Cafe"
        viewController.review = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
//        let backItem = UIBarButtonItem()
//            backItem.title = kopi.name
//        viewController.backBarButtonItem = backItem
        self.navigationController?.pushViewController(viewController, animated: true)
        
        let backButton = UIBarButtonItem()
        backButton.title = kopi.name
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        viewController.modalPresentationStyle = .fullScreen
        

        
        
//        present(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: UIContextualAction.Style.destructive, title: "DELETE") { _, _, completion in
            self.deleteKopi(at: indexPath.row)
            completion(true)
        }
        
        if #available(iOS 13.0, *) {
            action.image = UIImage(systemName: "trash.fill")
        } else {
            // Fallback on earlier versions
        }
        action.backgroundColor = UIColor.black
        
        let config = UISwipeActionsConfiguration(actions: [action])
        return config
    }
}
