//
//  FirestoreViewModel.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 04/03/22.
//

import Foundation
import FirebaseFirestore

class FirestoreViewModel {
    let databse = Firestore.firestore()
    var users = [UserModel]()
    


    func  getData(completion:@escaping((_ users:[UserModel])->())) {

       let ref = self.databse.collection("Firestore")
       ref.getDocuments() { snapshot, error in
           
           for document in snapshot!.documents {                      //print("\(document.documentID) => \(document.data())")
               let data = document.data()
            //   print(data)
               let name =  data["Name"] as? String
               let org = data["Organization"] as? String
               let user = UserModel(name: name, organization: org)
               self.users.append(user)
               DispatchQueue.main.async {
                completion(self.users)
                    }
           }
          // print(self.users)
    }
}
}
