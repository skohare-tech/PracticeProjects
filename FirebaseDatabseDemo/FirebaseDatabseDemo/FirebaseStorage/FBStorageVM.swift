//
//  FBStorageVM.swift
//  FirebaseDatabseDemo
//
//  Created by Admin on 08/03/22.
//

import Foundation
class FBStorageVM
{
    var files = [FilesModel]()

    
    func getFiles(fileType: String, completion:@escaping((_ files:[FilesModel])->()))
    {
        completion(self.files)

    }
}
