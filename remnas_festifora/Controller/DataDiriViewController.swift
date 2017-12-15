//
//  DataDiriViewController.swift
//  remnas_festifora
//
//  Created by Raditia Madya on 19/11/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import UIKit
import FirebaseFirestore

class DataDiriViewController: UIViewController{
    var db: Firestore!
    var pasienArray = [Pasien]()
    
    @IBOutlet weak var namaPasien: UILabel!
    @IBOutlet weak var idPasien: UILabel!
    @IBOutlet weak var tanggalLahir: UILabel!
    @IBOutlet weak var jenisKelamin: UILabel!
    @IBOutlet weak var alamatAsal: UILabel!
    @IBOutlet weak var alamatDomisili: UILabel!
    @IBOutlet weak var pekerjaan: UILabel!
    @IBOutlet weak var agama: UILabel!
    @IBOutlet weak var noTelp: UILabel!
    

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
                self.idPasien.text = "\(pasien.nik)"
                self.tanggalLahir.text = "\(pasien.tanggalLahir)"
                self.jenisKelamin.text = "\(pasien.jenisKelamin)"
                self.alamatAsal.text = "\(pasien.alamatAsal)"
                self.alamatDomisili.text = "\(pasien.alamatDomisili)"
                self.pekerjaan.text = "\(pasien.pekerjaan)"
                self.agama.text = "\(pasien.agama)"
                self.noTelp.text = "\(pasien.telp)"
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
