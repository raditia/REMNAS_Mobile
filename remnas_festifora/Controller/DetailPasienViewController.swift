//
//  DetailPasienViewController.swift
//  remnas_festifora
//
//  Created by Raditia Madya on 18/11/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import UIKit
import FirebaseFirestore

class DetailPasienViewController: UIViewController {
    var db: Firestore!
    var pasienArray = [Pasien]()
    
    @IBOutlet weak var namaPasien: UILabel!
    @IBOutlet weak var idPasien: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        loadData()
        
//        let nama = pasienArray[pasienIndex]
//        print(nama)
//        namaPasien.text = "\(nama.nama)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    func loadData() {
        
        let docRef = db.collection("pasien").document("MAhTWaAJn0xxs2nQOAFh")
        
        docRef.getDocument { (document, error) in
            if let pasien = document.flatMap({ Pasien(dictionary: $0.data()) }) {
                print("Pasien: \(pasien.nama)")
                self.namaPasien.text = "\(pasien.nama)"
                self.idPasien.text = "\(pasien.nik)"
            } else {
                print("Document does not exist")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
