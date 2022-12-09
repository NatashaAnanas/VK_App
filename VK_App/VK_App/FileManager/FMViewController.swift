//
//  FMViewController.swift
//  VK_App
//
//  Created by Анастасия Козлова on 09.12.2022.
//

import UIKit

/// FMViewController
class FMViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = FileManager.default
        
        let cashesDir = fileManager.urls(for: .cachesDirectory,
                                         in: .userDomainMask).first
        
        let docsDir = fileManager.urls(for: .documentDirectory,
                                       in: .userDomainMask).first
        
        let tmpDir = fileManager.temporaryDirectory
        
        print(fileManager)
        print(docsDir)
        print(tmpDir)
        
        let textFileUrl = tmpDir.appendingPathComponent("AnanasTestFile.txt")
        var isFileExist = fileManager.fileExists(atPath: textFileUrl.path)
        
        if isFileExist {
            do {
                let text = try String(contentsOf: textFileUrl)
                print(text)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            let data = "Hello, Natasha".data(using: .utf8)
            fileManager.createFile(atPath: textFileUrl.path,
                                   contents: data)
        }
        
        do {
            try fileManager.removeItem(atPath: textFileUrl.path)
        } catch {
            print(error.localizedDescription)
        }
    }
}
