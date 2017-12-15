//
//  RiwayatViewController.swift
//  remnas_festifora
//
//  Created by Raditia Madya on 19/11/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import UIKit
import FirebaseFirestore

class RiwayatViewController: UIViewController {
    var db: Firestore!
    var pasienArray = [Pasien]()
	var rekamMedisArray = [RekamMedis]()
    
    @IBOutlet weak var namaPasien: UILabel!
    @IBOutlet weak var tanggalLahir: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        loadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        
        let docRef = db.collection("pasien").document("MAhTWaAJn0xxs2nQOAFh")
        
        docRef.getDocument { (document, error) in
            if let pasien = document.flatMap({ Pasien(dictionary: $0.data()) }) {
                print("Pasien: \(pasien.nama)")
                self.namaPasien.text = "\(pasien.nama)"
                self.tanggalLahir.text = "\(pasien.tanggalLahir)"
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
