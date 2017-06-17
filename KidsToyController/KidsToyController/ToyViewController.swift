//
//  ToyViewController.swift
//  KidsToyController
//
//  Created by qamarali on 6/12/17.
//  Copyright © 2017 qamarali. All rights reserved.
//

import UIKit

class ToyViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var ToyImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    var selectedToy : ToyPhoto? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if(selectedToy != nil)
        {
            print("did selected")
        }
        else
        {
            print("Not selected")
        }
        

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var TitleTextField: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        ToyImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func CameraTapped(_ sender: Any) {
        
    }

    @IBAction func PhotoTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true,completion: nil)
    }
    
    @IBAction func AddTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let toyPhoto = ToyPhoto(context: context)
        
        toyPhoto.title = TitleTextField.text
        
        
        toyPhoto.image = UIImageJPEGRepresentation(ToyImageView.image!, 0.8) as! NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
        
        
        
    }
}
