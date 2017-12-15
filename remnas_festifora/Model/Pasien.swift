//
//  Pasien.swift
//  remnas_festifora
//
//  Created by Raditia Madya on 18/11/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol DocumentSerializable  {
    init?(dictionary:[String:Any])
}

struct Pasien {
    var nik: String
    var nama: String
    var tanggalLahir: String
    var jenisKelamin: String
    var alamatAsal: String
    var alamatDomisili: String
    var email: String
    var telp: String
    var agama: String
    var pekerjaan: String
    var kewarganegaraan: String
    
    var dictionary: [String: Any] {
        
        return [
            "nik": nik,
            "nama": nama,
            "tanggalLahir": tanggalLahir,
            "jenisKelamin": jenisKelamin,
            "alamatAsal": alamatAsal,
            "alamatDomisili": alamatDomisili,
            "email": email,
            "telp": telp,
            "agama": agama,
            "pekerjaan": pekerjaan,
            "kewarganegaraan": kewarganegaraan
        ]
    }
}

extension Pasien: DocumentSerializable {
    init?(dictionary:[String:Any]) {
        guard
            let nik = dictionary["nik"] as? String,
            let nama = dictionary["nama"] as? String,
            let tanggalLahir = dictionary["tanggalLahir"] as? String,
            let jenisKelamin = dictionary["jenisKelamin"] as? String,
            let alamatAsal = dictionary["alamatAsal"] as? String,
            let alamatDomisili = dictionary["alamatDomisili"] as? String,
            let email = dictionary["email"] as? String,
            let telp = dictionary["telp"] as? String,
            let agama = dictionary["agama"] as? String,
            let pekerjaan = dictionary["pekerjaan"] as? String,
            let kewarganegaraan = dictionary["kewarganegaraan"] as? String else {return nil}
        
        self.init(nik: nik, nama: nama, tanggalLahir: tanggalLahir, jenisKelamin: jenisKelamin, alamatAsal: alamatAsal, alamatDomisili: alamatDomisili, email: email, telp: telp, agama: agama, pekerjaan: pekerjaan, kewarganegaraan: kewarganegaraan)
    
    }
}

struct RekamMedis {
	var nama_rs: String
	var tanggal_tindakan: Date
	var dokter: String
	var paramedis: String
	var jenis_pasien: String
	var keluhan: String
	var obat: String
	var penyakit: String
	var kondisi_terakhir: String
	var diagnosa: String
	var tindakan: String
	
	var dictionary: [String: Any] {
		return [
			"nama_rs": nama_rs,
			"tanggal_tindakan": tanggal_tindakan,
			"dokter": dokter,
			"paramedis": paramedis,
			"jenis_pasien": jenis_pasien,
			"keluhan": keluhan,
			"obat": obat,
			"penyakit": penyakit,
			"kondisi_terakhir": kondisi_terakhir,
			"diagnosa": diagnosa,
			"tindakan": tindakan
		]
	}
}

extension RekamMedis: DocumentSerializable {
	
	init?(dictionary: [String : Any]) {
		guard
			let nama_rs = dictionary["nama_rs"] as? String,
			let tanggal_tindakan = dictionary["tanggal_tindakan"] as? Date,
			let dokter = dictionary["dokter"] as? String,
			let paramedis = dictionary["paramedis"] as? String,
			let jenis_pasien = dictionary["jenis_pasien"] as? String,
			let keluhan = dictionary["keluhan"] as? String,
			let obat = dictionary["obat"] as? String,
			let penyakit = dictionary["penyakit"] as? String,
			let kondisi_terakhir = dictionary["kondisi_terakhir"] as? String,
			let diagnosa = dictionary["diagnosa"] as? String,
			let tindakan = dictionary["tindakan"] as? String
		
			else {

				return nil
		}
		
		self.init(nama_rs: nama_rs, tanggal_tindakan: tanggal_tindakan, dokter: dokter, paramedis: paramedis, jenis_pasien: jenis_pasien, keluhan: keluhan, obat: obat, penyakit: penyakit, kondisi_terakhir: kondisi_terakhir, diagnosa: diagnosa, tindakan: tindakan)
		
	}
}


