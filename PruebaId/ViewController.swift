//
//  ViewController.swift
//  PruebaId
//
//  Created by Nacho Martin on 23/11/21.
//

import UIKit
import VideoID

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func press(_ sender: Any) {
        let endpoint = "https://etrust-sandbox.electronicid.eu/v2/videoid.request"
        let auth = "INSERT AUTH CODE FROM CURL CALL"
        let environment: VideoID.Environment = Environment(url: endpoint, autorization: auth)
        let videoViewController = VideoIDViewController(environment: environment, language: "es", docType: 62)
        videoViewController.delegate = self
        videoViewController.modalPresentationStyle = .fullScreen
        self.show(videoViewController, sender: self)
    }
    
}

extension ViewController: VideoIDDelegate { func onComplete(videoID: String) {
    let alert = UIAlertController(title: "Success", message: "VideoID: \(videoID)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alert, animated: true) }
    func onError(code: String, message: String?) {
        let alert = UIAlertController(title: "Error", message: "\(code): \(message ?? "")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
}
