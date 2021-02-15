//
//  BaseTableViewAdapter.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import UIKit

open class BaseTableViewAdapter: NSObject {

    open weak var tableView: UITableView!
    public private(set) var descriptors = [SectionConfiguration]()

    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()

        tableView.delegate = self
        tableView.dataSource = self
    }

    func reloadWith(descriptors: [SectionConfiguration]) {
        self.descriptors = descriptors
        tableView.reloadData()
    }
    
}

extension BaseTableViewAdapter: UITableViewDataSource {
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return descriptors.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard descriptors.count > section else {
            return 0
        }
        return descriptors[section].rows.count
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard descriptors.count > indexPath.section, descriptors[indexPath.section].rows.count > indexPath.row else {
            return UITableViewCell()
        }
        
        let descriptor = descriptors[indexPath.section].rows[indexPath.row]

        guard let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.viewType.reuseIdentifier, for: indexPath) as? ConfigurableCell else {
            return UITableViewCell()
        }

        cell.configure(descriptor)

        return cell
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard descriptors.count > indexPath.section,
            descriptors[indexPath.section].rows.count > indexPath.row,
            let clickableCell = descriptors[indexPath.section].rows[indexPath.row] as? ClickableCellConfiguration else { return }
        DispatchQueue.main.async {
            clickableCell.onClicked?()
        }
    }
    
    open func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // default implementation
        return true
    }
    
    open func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // default implementation
    }
    
}

extension BaseTableViewAdapter: UITableViewDelegate {
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard descriptors.count > indexPath.section, descriptors[indexPath.section].rows.count > indexPath.row else {
            return 0
        }
        return descriptors[indexPath.section].rows[indexPath.row].height
    }

}
