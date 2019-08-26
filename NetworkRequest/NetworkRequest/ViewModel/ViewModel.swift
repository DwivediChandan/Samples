
import Foundation

class ViewModel {
    
    let url = URL(string:"https://api.myjson.com/bins/19u0sf")!
    var res: Items?
    var excludedNames: [String]?
    var selectedNames: [String]?
   
    init() {
        excludedNames = [String]()
        selectedNames = [String]()
     }
    
    func getData(callback:  @escaping ()->()) {
        
        let task = URLSession.shared.dataTask(with: url) { (data,response, error) in
            
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            guard let mime = response?.mimeType, mime == "application/json" else {
                print("Wrong Mime Type")
                return
            }
            do {
                let decoder = JSONDecoder()
                self.res = try decoder.decode(Items.self, from: dataResponse)
                print(self.res!)
                self.execludeListName()
                DispatchQueue.main.async {
                   callback()
                }
            }catch {
                print("json error:\(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func getName(groupId: String, variantId: String)-> String {
        
        var GroupName:String
        var VariantName: String
        for i in 0..<(self.res?.variants.variant_groups.count)! {
            if self.res?.variants.variant_groups[i].group_id == groupId {
                GroupName = (self.res?.variants.variant_groups[i].name)!
                for j in 0..<(self.res?.variants.variant_groups[i].variations.count)! {
                    if self.res?.variants.variant_groups[i].variations[j].id == variantId {
                        VariantName = (self.res?.variants.variant_groups[i].variations[j].name)!
                        return GroupName+VariantName
                    }
                }
            }
            
        }
        return ""
    }
    
    func execludeListName(){
        for i in 0..<(self.res?.variants.exclude_list.count)! {
            var nam:String = String()
            var reverseName = String()
            for j in 0..<(self.res?.variants.exclude_list[i].count)! {
                let fetchName = getName(groupId: (self.res?.variants.exclude_list[i][j].group_id)!, variantId: (self.res?.variants.exclude_list[i][j].variation_id)!)
                nam = nam + fetchName
                reverseName = fetchName + reverseName
                
            }
            excludedNames?.append(nam)
            excludedNames?.append(reverseName)
            
        }
    }
    
    func selectedNameIsExcluded(name:String)->Bool {
        let res = self.excludedNames?.filter{$0 == name}
        if res!.count > 0 {
            return true
        }
        return false
    }
}

