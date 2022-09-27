//
//  FileUploadVC.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 09/03/22.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import FirebaseStorage
import Firebase


class FileUploadVC: UIViewController, UIDocumentPickerDelegate  {

    var imagePickerController = UIImagePickerController()
    var fileType = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
       // print(UUID().uuidString)
        // Do any additional setup after loading the view.
    }

    @IBAction func btnFileUploadClicked(_ sender: UIButton) {
        
        let tag = sender.tag
        if tag == 1 {
            print(tag)
            fileType = "jpg"

            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated:  true, completion:  nil)
            
        } else if tag == 2 {
            print(tag)
            fileType = "pdf"
            filePicker()

        } else if tag == 3 {
            print(tag)
            fileType = "xlsx"
            filePicker()
        }else if tag == 4 {
            print(tag)
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FBStorageVC") as? FBStorageVC
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    func filePicker()
    {
        print(fileType)
        let types = UTType.types(tag: fileType,
                                    tagClass: UTTagClass.filenameExtension,
                                    conformingTo: nil)
           let documentPickerController = UIDocumentPickerViewController(
                   forOpeningContentTypes: types)
           documentPickerController.delegate = self
           self.present(documentPickerController, animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print(urls)
        
        guard let url = urls.first else {
            return
        }
        print(url)
        uploadToCloud(fileURL : url, fileType: fileType)
        }
    
    func msgAlert(msg: String) {
        
        // create the alert
               let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
               // show the alert
               self.present(alert, animated: true, completion: nil)
    }
}



extension FileUploadVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            print(url)
            uploadToCloud(fileURL: url, fileType: self.fileType)
        }
        self.imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func uploadToCloud(fileURL : URL, fileType: String) {
        let storage = Storage.storage()
        let data = Data()
        print(data)
        let storageRef = storage.reference()
        
        let localFile = fileURL
        print(localFile)

        var photoRef = StorageReference()
        if fileType == "pdf" {
            photoRef  = storageRef.child("PDF").child(UUID().uuidString + ".pdf")
        }
        else if fileType == "jpg"{
            photoRef  = storageRef.child("Images").child(UUID().uuidString + ".jpg")

        }else if fileType == "xlsx"{
            photoRef  = storageRef.child("Excel").child(UUID().uuidString + ".xlsx")
        }
        
        let uploadTask = photoRef.putFile(from: localFile, metadata: nil) { (metadata, err) in
            guard let metadata = metadata else {
                print(err?.localizedDescription)
                return
            }
            print(metadata)
            print("Photo Uploaded")
            self.msgAlert(msg: "File uploaded")
            
        }
        
}
    
}
