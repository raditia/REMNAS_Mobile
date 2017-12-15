//
//  PasienTableViewController.swift
//  remnas_festifora
//
//  Created by Raditia Madya on 18/11/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import UIKit
import FirebaseFirestore

class PasienTableViewController: UITableViewController {
    var db: Firestore!
    var pasienArray = [Pasien]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        loadData()
        checkForUpdate()
        
//        tableView.delegate = self
//        tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    func loadData() {
                db.collection("pasien").getDocuments() {
                    querySnapshot, error in
                    if let error = error {
                        print("\(error)")
                    }else{
                        self.pasienArray = querySnapshot!.documents.flatMap({Pasien(dictionary: $0.data())})
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
//        db.collection("pasien").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//
//            }
//        }
    }
    
    func checkForUpdate() {
        db.collection("pasien").addSnapshotListener {
            querySnapshot, error in
            
            guard let snapshot = querySnapshot else {return}
            
            snapshot.documentChanges.forEach {
                diff in
                
                if diff.type == .added {
                    self.pasienArray.append(Pasien(dictionary: diff.document.data())!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
        }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pasienArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let pasien = pasienArray[indexPath.row]
        cell.textLabel?.text = "\(pasien.nama)"
        cell.detailTextLabel?.text = "\(pasien.nik)"
//        let data = dummyData[indexPath.row]
//        cell?.textLabel?.text = "\(data)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pasienIndex = pasienArray[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
//    @IBAction func addPasien(_ sender: Any) {
//
//        db.collection("pasien").document("3404062012960002").setData([
//            "nama": "Raditia Madya",
//            "tanggalLahir": "20 Desember 1996",
//            "jenisKelamin": "Laki-laki",
//            "alamatAsal": "Pekalongan",
//            "alamatDomisili": "Yogyakarta",
//            "email": "gustiraditia@gmail.com",
//            "telp": "081294063512",
//            "agama": "Islam",
//            "pekerjaan": "Mahasiswa",
//            "kewarganegaraan": "Indonesia"
//        ]) { (error: Error?) in
//            if let error = error {
//                print("\(error.localizedDescription)")
//            }
//            else {
//                print("Document was succesfully created!")
//            }
//        }
//
//    }
    
    

    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
