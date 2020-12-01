
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
   
    //MARK: Properties
    
    var model = Model()
    var videos = [Video]()
    
    @IBOutlet weak var tableview: UITableView!
    
    
    //Loads View
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //sets itself as delegate and data source for table view
        tableview.dataSource = self
        tableview.delegate = self
        
        //sets self as delegate of model
        model.delegate = self
        
        
        model.getVideos()
    }

    //MARK: ModelDelegate Methods
    
    func videosFetched(_ videos: [Video]) {
        //set videos property within View controller to videos retrieved from function
        self.videos = videos
        
        //refreshes tableview
        tableview.reloadData()
    }
    
    
    
    
    //MARK: TableView Methods
    
    //counts number of length of Video array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //constant cell established as reusable cell identified a VIDEOCELL_ID in Constants struct
        let cell = tableview.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! TableViewCell
    
        //takes video  from self with index value of row
        let video = self.videos[indexPath.row]
        
        //configures cell
        cell.setCell(video)
        //return cell
        return cell
    }
    
    //MARK:Actions
    
    

}

