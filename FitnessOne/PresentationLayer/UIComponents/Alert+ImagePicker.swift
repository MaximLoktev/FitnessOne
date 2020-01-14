//
//  Alert+ImagePicker.swift
//  FitnessOne
//
//  Created by Максим Локтев on 07/01/2020.
//  Copyright © 2020 Максим Локтев. All rights reserved.
//

import UIKit

class UIImagePickerContr: UIImagePickerController, UIImagePickerControllerDelegate  {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any], imageView: UIImageView) {
        imageView.image = info[.editedImage] as? UIImage
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
    func alertPhoto() {
        let alertController = UIAlertController(title: "Источник фотографии", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Камера", style: .default, handler: { (action) in
            self.chooseImagePickerAction(source: .camera)
        })
        let photoLibAction = UIAlertAction(title: "Фото", style: .default, handler: { (action) in
            self.chooseImagePickerAction(source: .photoLibrary)
        })
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}
