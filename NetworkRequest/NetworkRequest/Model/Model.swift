
import Foundation


struct Group:Decodable {
    let group_id: String
    let name: String
    let variations:[Variations]
}
struct Variations: Decodable{
    let name:String
    let price: Int
    let `default`: Int
    let id: String
    let inStock: Int
    let isVeg: Int?
    
}
struct Exclude: Decodable {
    let group_id: String
    let variation_id: String
}
struct VariantData: Decodable {
    let variant_groups: [Group]
    let exclude_list: [[Exclude]]
}
struct Items : Decodable {
    
    let variants:VariantData
}

