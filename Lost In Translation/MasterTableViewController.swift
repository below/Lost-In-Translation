 //
//  MasterTableViewController.swift
//  Lost In Translation
//
//  Created by Alexander v. Below on 27.10.15.
//  Copyright © 2015 Alexander von Below. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    let localeUtilities = LocaleUtitlies()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!

        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfo", for: indexPath)
            cell.textLabel!.text = "Bar"
            switch indexPath.row {
            case 0:
                let identifier = localeUtilities.locale.identifier
                cell.detailTextLabel?.text = identifier
                let text : String!
                if let displayname = localeUtilities.locale.localizedString(forIdentifier: identifier) {
                    text = displayname;
                }
                else {
                    text = identifier
                }

                cell.textLabel!.text = text
            default: break

            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "DisclosureCell", for: indexPath)
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = Bundle.main.preferredLocalizations.first!
                cell.detailTextLabel?.text = "preferredLocalization"
            case 1:
                cell.textLabel?.text = NSLocale.preferredLanguages.first!
                cell.detailTextLabel?.text = "preferredLanguage"
            case 2:
                cell.textLabel?.text = Bundle.main.localizations.first!
                cell.detailTextLabel!.text = "localization"
            default:
                break
            }
        default: break
        }


        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showObjects" {
            let controller = (segue.destination as! UINavigationController).topViewController as! ArrayTableViewController
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                if indexPath.section == 1 {
                    switch (indexPath.row) {
                    case 0:
                        controller.objects = Bundle.main.preferredLocalizations
                        controller.title = NSLocalizedString("NSBundle Preferred Localizations", comment: "### Do not localize")
                    case 1:
                        controller.objects = NSLocale.preferredLanguages
                        controller.title = NSLocalizedString("NSLocale Languages", comment: "### Do not localize")
                    case 2:
                        controller.objects = Bundle.main.localizations
                        controller.title = NSLocalizedString("NSBundle Localizations", comment: "### Do not localize")

                    default:
                        break
                    }
                }
            }
        }
    }

}
