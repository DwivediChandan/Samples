
import UIKit


class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var viewModel: ViewModel?
    var itemTableView: UITableView?
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
         viewModel = ViewModel()
         viewModel?.getData(){ self.initTable()}
     }

    func initTable(){
        
        itemTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        //mytableView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        itemTableView?.register(ItemCell.self, forCellReuseIdentifier: "Cell")
        itemTableView?.delegate = self
        itemTableView?.dataSource = self
        self.view.addSubview(itemTableView!)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (viewModel?.res?.variants.variant_groups.count)!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.res?.variants.variant_groups[section].variations.count)!
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 20, y: 8, width: self.view.frame.width, height: 20)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.textColor = .white
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = .lightGray
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.res?.variants.variant_groups[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ItemCell
        cell.ItemName.text = viewModel?.res?.variants.variant_groups[indexPath.section].variations[indexPath.row].name
        cell.ItemPrice.text = "\( viewModel?.res?.variants.variant_groups[indexPath.section].variations[indexPath.row].price ?? 0)"
        cell.ItemInStock.text = "\( viewModel?.res?.variants.variant_groups[indexPath.section].variations[indexPath.row].inStock ?? 0)"
        cell.selectionStyle = .none
         return cell

     }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        let GroupName = (viewModel?.res?.variants.variant_groups[indexPath.section].name)!
        let VariantName = (viewModel?.res?.variants.variant_groups[indexPath.section].variations[indexPath.row].name)!
        
        let comName = GroupName + VariantName
        
        for i in 0..<(viewModel?.selectedNames?.count)! {
            let val = viewModel?.selectedNameIsExcluded(name: comName+(viewModel?.selectedNames![i])!)
            let val2 = viewModel?.selectedNameIsExcluded(name: (viewModel?.selectedNames![i])!+comName)
            if val == true || val2 == true {
                return false
            }
        }
        return true;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        let GroupName = (viewModel?.res?.variants.variant_groups[indexPath.section].name)!
        let VariantName = (viewModel?.res?.variants.variant_groups[indexPath.section].variations[indexPath.row].name)!
        viewModel?.selectedNames?.append(GroupName+VariantName)
        
        for i in 0..<tableView.numberOfRows(inSection: indexPath.section) {
            let secCell = tableView.cellForRow(at: NSIndexPath(row: i, section: indexPath.section) as IndexPath)
            let GroupNameI = (viewModel?.res?.variants.variant_groups[indexPath.section].name)!
            let VariantNameI = (viewModel?.res?.variants.variant_groups[indexPath.section].variations[i].name)!
            if(i != indexPath.row){
                secCell?.accessoryType = .none
                let arr = viewModel?.selectedNames!.filter{$0 != (GroupNameI+VariantNameI)}
                
                viewModel?.selectedNames?.removeAll()
                viewModel?.selectedNames = [String]()
                viewModel?.selectedNames?.append(contentsOf: arr!)
            }
        }

        tableView.reloadData()
    }
    
}














