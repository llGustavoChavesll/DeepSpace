//
//  MenuOptionsActionsExtension.swift
//  DeepSpace
//
//  Created by João Pedro Aragão on 22/11/18.
//  Copyright © 2018 Adriel Freire. All rights reserved.
//

import Foundation
import UIKit

extension LibraryViewController {
    func solarSystemCell(cell: PlanetCollectionViewCell?,
                                       indexPath: IndexPath) {
        let imageName = allPlanets[indexPath.item].rawValue.replacingOccurrences(of: "/", with: "")
        cell?.planetImage.image = UIImage(named: "\(imageName).jpg")
        cell?.planetImage.contentMode = .scaleAspectFit
        cell?.planetImage.backgroundColor = UIColor.black
        cell?.planetNameLabel.text = imageName
    }
    
    func apodCell(cell: PlanetCollectionViewCell?,
                                indexPath: IndexPath) {
        let apod = self.apods[indexPath.item]
        cell?.planetImage.image = apod.image
        cell?.planetImage.contentMode = .scaleAspectFill
        
        var apodDateString: String = ""
        
        if let apodDate = apod.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let date = dateFormatter.date(from: apodDate)
            dateFormatter.dateFormat = "MM/dd/yyyy"
            apodDateString += "\n"
            apodDateString += dateFormatter.string(from: date!)
        }
        
        cell?.planetNameLabel.text = "\(apod.title ?? "")\(apodDateString)"
    }
    
    func exoplanetCell(cell: PlanetCollectionViewCell?,
                                      indexPath: IndexPath) {
        cell?.planetImage.image = UIImage(named: "picture.png")
        cell?.planetImage.contentMode = .scaleAspectFit
        cell?.planetImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        cell?.planetNameLabel.text = exoplanets[indexPath.item].name
    }
    
    func minorPlanetCell(cell: PlanetCollectionViewCell?,
                       indexPath: IndexPath) {
        cell?.planetImage.image = UIImage(named: "picture.png")
        cell?.planetImage.contentMode = .scaleAspectFit
        cell?.planetImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        cell?.planetNameLabel.text = minorPlanets[indexPath.item].name
    }
    
    func dragonCell(cell: PlanetCollectionViewCell?,
                    indexPath: IndexPath) {
        cell?.planetNameLabel.text = dragons[indexPath.item].name
        cell?.planetImage.image = dragons[indexPath.item].image
        cell?.planetImage.contentMode = .scaleAspectFill
    }
    
    func rocketCell(cell: PlanetCollectionViewCell?,
                    indexPath: IndexPath) {
        cell?.planetNameLabel.text = "\(rockets[indexPath.item].id!)"
        cell?.planetImage.image = rockets[indexPath.item].image
        cell?.planetImage.contentMode = .scaleAspectFill
    }
    
    func roadsterCell(cell: PlanetCollectionViewCell?) {
        cell?.planetNameLabel.text = roadster?.name
        cell?.planetImage.image = roadster?.image
        cell?.planetImage.contentMode = .scaleAspectFill
    }
    
    func buildCollectionViewContent(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planetThumb", for: indexPath) as? PlanetCollectionViewCell
        if cell == nil { cell = PlanetCollectionViewCell() }
        
        cell?.layer.cornerRadius = 13
        cell?.planetImage.backgroundColor = UIColor.black
        
        let shadowOffset = CGSize(width: 0, height: 5)
        cell?.applyShadow(radius: 13,
                          borderWidth: 1,
                          offset: shadowOffset,
                          blur: 0,
                          alpha: 1,
                          layerFrame: cell!.bounds)
        
        switch selectedMenuOption {
        case 0:
            self.solarSystemCell(cell: cell,
                                 indexPath: indexPath)
        case 1:
            self.apodCell(cell: cell,
                          indexPath: indexPath)
        case 2:
            self.exoplanetCell(cell: cell,
                               indexPath: indexPath)
        case 3:
            self.minorPlanetCell(cell: cell,
                                 indexPath: indexPath)
        case 4:
            self.dragonCell(cell: cell,
                            indexPath: indexPath)
        case 5:
            self.rocketCell(cell: cell,
                            indexPath: indexPath)
        case 6:
            self.roadsterCell(cell: cell)
        default:
            break
        }
        
        if cell?.planetImage.image == nil {
            cell?.planetImage.image = UIImage(named: "picture.png")
            cell?.planetImage.contentMode = .scaleAspectFit
            cell?.planetImage.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
        
        return cell!
    }
    
}
