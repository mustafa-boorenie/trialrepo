
import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys : String, CodingKey {
        
        case items
        
        
    }
    
    init(from decoder: Decoder) throws{
    
        
        //opens JSON object
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //decodes items container inside initial container into Video Arrays
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
        
    
}
