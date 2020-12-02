//
//  VideoViewController.swift
//  trialvideoapp
//
//  Created by Mustafa Boorenie on 02/12/2020.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    
    
    //MARK: Properties
    
    @IBOutlet weak var video_WebView: WKWebView!
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var description_label: UILabel!
    
    var video:Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clears all fields
        title_label.text = ""
        description_label.text = ""
        
        // Checks if theres a video
        guard self.video != nil else {
            return
        }
        
        //creates the embeded URL
        let video_url = Constants.EMBED_URL + self.video!.videoId
        let embedUrl = URL(string: video_url)
        
        //checks embedUrl value is not nil, then places URLRequest for embedUrl
        guard embedUrl != nil else {
            return
        }
        let embedUrlRequest = URLRequest(url: embedUrl!)
        
        //Loads video into web view
        video_WebView.load(embedUrlRequest)

        //sets the title
        title_label.text = self.video?.title
        
        //sets the description
        description_label.text = self.video?.description
        
    }
}
