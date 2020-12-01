//
//  Model.swift
//  trialvideoapp
//
//  Created by Mustafa Boorenie on 28/11/2020.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])

}



class Model {
    
    //establishes delegate variable and setting type as ModelDelegate
    var delegate:ModelDelegate?
    
    
    func getVideos() {
        
        
        //establish URL
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //get URLSession Object
        let session = URLSession.shared
        
        //initiate data task
        let datatask = session.dataTask(with: url!) { (data, response, error) in

            //check if there are any errors

            if error != nil || data == nil {
                print("Error in initiating Data Task")
                return
            }
            
            do {
                
                //captures JSONDecoder object as constant decoder
            let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                //stores decoder response try to decode data (! = may or may not exist) from dataTask, stores type as response.
            let response = try decoder.decode(Response.self, from: data!)
            
                //checks if response is not nil
                if response.items != nil {
                    
                    //dispatches function back to view controller
                   DispatchQueue.main.async {
                    
                        //calls the videosFetched method of delegate
                    self.delegate?.videosFetched(response.items!)
                        
                        
                    }
                }
            }
            
            
            
            
            catch {
                
            //catches error here
                
            }
            
        }
     
        //MARK: ACTIONS
       
        datatask.resume()
        
        
        
    }
    
    
}
