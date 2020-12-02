//
//  TableViewCell.swift
//  trialvideoapp
//
//  Created by Mustafa Boorenie on 29/11/2020.
//

import UIKit

 class TableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var thumbnail_imageView: UIImageView!
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var publishedAt_label: UILabel!
    
    //establishes var video as type Video
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell (_ v:Video) {
       
        self.video = v
        
        guard self.video != nil else {
            
            //video value is nill
            
            return
        }
        
        //checks whether the video is cache
        if let cacheddata = CacheManager.getVideoCache(self.video!.thumbnail) {
            
        //takes data from cacheddata
            self.thumbnail_imageView.image = UIImage(data: cacheddata)
            return
        }
        
        
        
        //sets title_label to video title
        self.title_label.text  = video?.title
        
        //sets date formatter object to dateformatter constant, then chooses format of  MM/dd/yyyy for date; uses date set in video array
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM.dd.yyyy"
        self.publishedAt_label.text = dateformatter.string(from: video!.publishedAt)
        
        guard self.video?.thumbnail != "" else {
            return
        }
        //downloads URL from video array, opesn URL session and catches data as var data
        let thumbnail_url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        let thumbnail_dataTask = session.dataTask(with: thumbnail_url!) { (data, response, error) in
        
            //checks if error is nil and data is present
            if error == nil || data != nil {
                
                
                //downloads thumbnail onto cache
                CacheManager.setVideoCache(self.video!.thumbnail, data)
                
                if thumbnail_url!.absoluteString != self.video!.thumbnail {
                    //Video cell is no longer equal to video intented to be displayed
                    
                    return
                }
                
                
                //stores UIImage found in Data as image
                let image = UIImage(data: data!)
                
                //sets thumbnail_imageView as an image and as var image
                DispatchQueue.main.async {
                    self.thumbnail_imageView.image = image
                }
                
                
                
            }
            
        }
        
        //Starts Data Task
        thumbnail_dataTask.resume()
    }
    
 }
