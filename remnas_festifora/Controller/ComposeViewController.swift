//
//  ComposeViewController.swift
//  remnas_festifora
//
//  Created by Raditia Madya on 18/11/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ComposeViewController: UIViewController {
    
    var db: Firestore!
    var pasienArray = [Pasien]()
    
    @IBOutlet weak var textFieldNik: UITextField!
    @IBOutlet weak var textFieldNama: UITextField!
    @IBOutlet weak var textFieldTanggalLahir: UITextField!
    @IBOutlet weak var textFieldJenisKelamin: UITextField!
    @IBOutlet weak var textFieldAlamatAsal: UITextField!
    @IBOutlet weak var textFieldAlamatDomisili: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldTelp: UITextField!
    @IBOutlet weak var textFieldAgama: UITextField!
    @IBOutlet weak var textFieldPekerjaan: UITextField!
    @IBOutlet weak var textFieldKewarganegaraan: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPasien(_ sender: Any) {
        
        let newPasien = Pasien(nik:textFieldNik.text!, nama: textFieldNama.text!, tanggalLahir: textFieldTanggalLahir.text!, jenisKelamin: textFieldJenisKelamin.text!, alamatAsal: textFieldAlamatAsal.text!, alamatDomisili: textFieldAlamatDomisili.text!, email: textFieldEmail.text!, telp: textFieldTelp.text!, agama: textFieldAgama.text!, pekerjaan: textFieldPekerjaan.text!, kewarganegaraan: textFieldKewarganegaraan.text!)
        
        var ref: DocumentReference? = nil
        ref = self.db.collection("pasien").addDocument(data: newPasien.dictionary) {
            error in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print("Data berhasil masuk!")
            }
        }
        
        
//        db.collection("pasien").document(textFieldNik.text!).setData([
//            "nama": textFieldNama.text!,
//            "tanggalLahir": textFieldTanggalLahir.text!,
//            "jenisKelamin": textFieldJenisKelamin.text!,
//            "alamatAsal": textFieldAlamatAsal.text!,
//            "alamatDomisili": textFieldAlamatDomisili.text!,
//            "email": textFieldEmail.text!,
//            "telp": textFieldTelp.text!,
//            "agama": textFieldTelp.text!,
//            "pekerjaan": textFieldPekerjaan.text!,
//            "kewarganegaraan": textFieldKewarganegaraan.text!
//
//        ]) { (error: Error?) in
//            if let error = error {
//                print("\(error.localizedDescription)")
//            }
//            else {
//
//                print("Data berhasil masuk")
//            }
//        }
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

