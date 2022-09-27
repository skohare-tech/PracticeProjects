//
//  FBStorageVC.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 08/03/22.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import FirebaseStorage
import Firebase




class FBStorageVC: UIViewController, UIDocumentPickerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var imagePickerController = UIImagePickerController()
    var fileType = "PDF"
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var underLine1: UIView!
    @IBOutlet weak var underLine2: UIView!
    @IBOutlet weak var underLine3: UIView!
    @IBOutlet weak var underLine4: UIView!
    
    let storageRef = Storage.storage().reference()
    var imageArr: [Data] = [Data]()
    var url = [URL]()
    
       


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Firebase Storage"
        self.indicator.isHidden = true
        setUpBarButtonItem()
        imagePickerController.delegate = self
        self.getFile(fileType: "PDF")

    }
    func setUpBarButtonItem() {
        _ = UIAction(title: "") {_ in
        }
     
        let pdf = UIAction(title: "Upload PDF", image: nil) {_ in
         print("Upload PDF clicked")
            self.fileType = "pdf"
            self.filePicker()
        }
        let excel = UIAction(title: "Upload Excel", image: nil) {_ in
            print("Upload excel clicked")
            self.fileType = "xlsx"
            self.filePicker()

        }
        let img = UIAction(title: "Upload Image", image: nil) {_ in
            print("Upload image clicked")
            self.fileType = "jpg"
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated:  true, completion:  nil)

        }
        
        let doc = UIAction(title: "Upload Doc", image: nil) {_ in
            print("Upload doc clicked")
            self.fileType = "doc"
            self.filePicker()

        }
        
        let menu = UIMenu(title: "", options: .displayInline, children: [pdf, excel, img, doc])
        let fileBtn = UIBarButtonItem(image: UIImage(systemName: "plus.rectangle.fill"), menu: menu)
        fileBtn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationItem.rightBarButtonItem = fileBtn
    }
    @IBAction func btnFileTypeClicked(_ sender: UIButton) {
        self.url.removeAll()
        self.tableView.isHidden = true
        self.imageArr.removeAll()

        let tag = sender.tag
        if tag == 1 {
           // self.tableView.isHidden = true
            changeViewColor(vw: underLine1)
            self.fileType = "PDF"
            self.getFile(fileType: "PDF")
        } else if tag == 2 {
          //  self.tableView.isHidden = false
            changeViewColor(vw: underLine2)
            self.fileType = "Images"
            getImage()
        } else if tag == 3 {
           // self.tableView.isHidden = true
            changeViewColor(vw: underLine3)
            self.fileType = "Text"
            self.getFile(fileType: "Text")

        }else if tag == 4 {
           // self.tableView.isHidden = true
            changeViewColor(vw: underLine4)
            self.fileType = "Excel"
            self.getFile(fileType: "Excel")
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
        self.uploadToCloud(fileURL : url, fileType: fileType)
        }
    
    func msgAlert(msg: String, fileType: String) {
        
        // create the alert
               let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
               // add an action (button)
               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
                   print("Handle Ok logic here")
                   self.url.removeAll()
                   self.tableView.isHidden = true
                   self.imageArr.removeAll()
                   switch(fileType){
                   case "pdf":
                       self.changeViewColor(vw: self.underLine1)
                       self.fileType = "PDF"
                       self.getFile(fileType: "PDF")
                       break
                   case "jpg":
                       self.changeViewColor(vw: self.underLine2)
                       self.fileType = "Images"
                       self.getImage()
                       break
                       
                   case "doc":
                       self.changeViewColor(vw: self.underLine3)
                       self.fileType = "Text"
                       self.getFile(fileType: "Text")
                       break
                       
                   case "xlsx":
                       self.changeViewColor(vw: self.underLine4)
                       self.fileType = "Excel"
                       self.getFile(fileType: "Excel")
                       break
                       
                   default:
                       break
                   }
//                   if fileType == "pdf" {
//                       photoRef  = storageRef.child("PDF").child(UUID().uuidString + ".pdf")
//                   }
//                   else if fileType == "jpg"{
//                       photoRef  = storageRef.child("Images").child(UUID().uuidString + ".jpg")
//
//                   }else if fileType == "xlsx"{
//                       photoRef  = storageRef.child("Excel").child(UUID().uuidString + ".xlsx")
//                   }else if fileType == "doc"{
//                       photoRef  = storageRef.child("Text").child(UUID().uuidString + ".doc")

                   
                   }))
               // show the alert
               self.present(alert, animated: true, completion: nil)
    }
    
    func changeViewColor(vw: UIView) {
        self.underLine1.backgroundColor = .black
        self.underLine2.backgroundColor = .black
        self.underLine3.backgroundColor = .black
        self.underLine4.backgroundColor = .black
        vw.backgroundColor = .white
    }
    
    
    func getImage()
    {
        indicator.startAnimating()
        self.indicator.isHidden = false
        storageRef.child("Images").listAll { storeReference, error in
            for item in storeReference.items{
                let path = item.fullPath
                print(item.fullPath)
                self.storageRef.child(path).downloadURL { url, err in
                   // print(url)
                guard let url = url else {
                    return
                }
                   // print(url)
                    self.url.append(url)
                    print(self.url.count)
                    

                URLSession.shared.dataTask(with: url) { data, respo, err in
                    DispatchQueue.main.async {
                        guard let data = data else {
                            return
                        }
                        self.imageArr.append(data)
                        self.indicator.stopAnimating()
                        self.indicator.isHidden = true
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.tableView.isHidden = false

                    }

                }.resume()
            }
            }
            print(self.fileType)

           // self.tableView.reloadData()

        }
    }
    
    func getFile(fileType: String)
    {
        url.removeAll()
        indicator.startAnimating()
        self.indicator.isHidden = false

        storageRef.child(fileType).listAll { storeReference, error in
            for item in storeReference.items{
                let path = item.fullPath
                print(item.fullPath)
                self.storageRef.child(path).downloadURL { url, err in
                    print(url)
                    self.indicator.stopAnimating()
                    self.indicator.isHidden = true
                guard let url = url else {
                    return
                }
                    print(url)
                    self.url.append(url)
                    print(self.url.count)
                   
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.tableView.isHidden = false

                    }
                    
            }
            }
            print(self.fileType)
           // self.tableView.reloadData()

        }
    }
    func uploadToCloud(fileURL : URL, fileType: String) {
        self.indicator.startAnimating()
        self.indicator.isHidden = false
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
        }else if fileType == "doc"{
            photoRef  = storageRef.child("Text").child(UUID().uuidString + ".doc")

        }
        let uploadTask = photoRef.putFile(from: localFile, metadata: nil) { (metadata, err) in
            guard let metadata = metadata else {
                
                print(err?.localizedDescription as Any)
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
                return
            }
            
            self.msgAlert(msg: "File uploaded", fileType: fileType)
            self.indicator.stopAnimating()
            self.indicator.isHidden = true
        }
}
    }

extension FBStorageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(url.count)
        if fileType == "Images"
        {
        return imageArr.count
        }else
        {
            return url.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        print(fileType)
        if fileType == "Images"
        {
            cell.cellImag.image = UIImage(data: imageArr[indexPath.row])


        } else if fileType == "Excel"
        {
            cell.cellImag.image = UIImage(named: "excel_icon")


        }else if fileType == "Text"
        {
            cell.cellImag.image = UIImage(named: "word_icon")


        }else {
            cell.cellImag.image = UIImage(named: "pdf_icon")

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FileViewVC") as? FileViewVC else {return}
        vc.urlString = url[indexPath.row].absoluteString
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension FBStorageVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            print(url)
            uploadToCloud(fileURL: url, fileType: self.fileType)
        }
        self.imagePickerController.dismiss(animated: true, completion: nil)
    }
}
