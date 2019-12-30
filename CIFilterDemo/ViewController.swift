//
//  ViewController.swift
//  CIFilterDemo
//
//  Created by SHIH-YING PAN on 2019/12/30.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import UIKit
import CoreImage.CIFilterBuiltins

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    func colorInvertFilter(_ input: CIImage) -> CIImage?
    {
        let filter = CIFilter.colorInvert()
        filter.inputImage = input
        return filter.outputImage
    }
    
    func edgeWorkFilter(_ input: CIImage, radius: Float) -> CIImage?
    {
        let filter = CIFilter.edgeWork()
        filter.setValue(input, forKey: kCIInputImageKey)
        filter.radius = radius
        return filter.outputImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "toy")
        
        if let ciImage = CIImage(image: image!), let edgeWorkOutput = edgeWorkFilter(ciImage, radius: 3.0), let colorInvertOutput = colorInvertFilter(edgeWorkOutput) {
            
            let filterImage = UIImage(ciImage: colorInvertOutput)
            imageView.image = filterImage
        }
    }
}




