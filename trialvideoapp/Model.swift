//
//  Model.swift
//  trialvideoapp
//
//  Created by Mustafa Boorenie on 28/11/2020.
//

import Foundation


class Model {
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
                
                //stores decoder response try to decode data (! = may or may not exist) from dataTask, stores type as response.
            
            let response = try decoder.decode(Response.self, from: data!)
            
                dump(response)
            }
            
            
            
            
            catch {
                
            //catches error here
                
            }
            
        }
     
        //MARK: ACTIONS
       
        datatask.resume()
        
        
        
    }
    
    
}
