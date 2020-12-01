
import Foundation


//Establishes this structure as a Decodable

struct Video: Decodable {
    
    
    
    //Establishing variables for strings of information wanted
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var publishedAt = Date()
    
    //Stating the Key values used to retrieve information from Dictionaries in JSON
    
    enum CodingKeys : String, CodingKey {
        
        case items
        case snippet
        case thumbnails
        case high
        case resourceId
       
        case videoId
        case title
        case description
        case thumbnail = "url"
        case publishedAt

    }
        
        init (from decode:Decoder) throws {
            
            //opens first container
            let container = try decode.container(keyedBy: CodingKeys.self)
            
            //looks for container nested in original contianer with key snippet
            let snippetcontainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
            
            //Parse title, publishedAt, & description
            
            self.title = try snippetcontainer.decode(String.self, forKey: .title)
        
            self.description = try snippetcontainer.decode(String.self, forKey: .description)
            self.publishedAt = try snippetcontainer.decode(Date.self, forKey: .publishedAt)
            
            //opens containers to look for thumbnail at high quality
            
            let thumbnailcontainer = try snippetcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
            let highcontainer = try thumbnailcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
            
            //catches thumbnail from containaer
            self.thumbnail = try highcontainer.decode(String.self, forKey: .thumbnail)
            
            //open containers to look for videoId
            
            let resourcecontainer = try snippetcontainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
            
            self.videoId = try resourcecontainer.decode(String.self, forKey: .videoId)
            
        }
    
        
    }
    

