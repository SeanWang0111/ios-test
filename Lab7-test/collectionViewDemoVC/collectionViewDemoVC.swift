//
//  collectionViewDemoVC.swift
//  Lab7-test
//
//  Created by Sean Wang on 2021/2/7.
//

import UIKit

class collectionViewDemoVC: UIViewController
{
    @IBOutlet var collectionView: UICollectionView!
    var fruitNameArr : [String]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionViewInit()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let userDefault = UserDefaults.standard
        fruitNameArr = userDefault.value(forKey: "fruitName") as? [String]
    }
    
    func collectionViewInit()
    {
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: "headerView")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuseCell")
        let cellNib = UINib(nibName: "myCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "myCollectionViewCell")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension collectionViewDemoVC: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int
    {
        if(section == 0)
        {
            return fruitNameArr?.count ?? 0
        }
        else
        {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if(indexPath.section == 0)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
            cell.setCell(imgName: fruitNameArr?[indexPath.row] ?? "", title: fruitNameArr?[indexPath.row] ?? "")
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath)
            cell.backgroundColor = UIColor(red: 10*CGFloat(indexPath.row)/255, green: 20*CGFloat(indexPath.row)/255, blue: 30*CGFloat(indexPath.row)/255, alpha: 1)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height))
            label.textAlignment = .center
            label.text = String(format: "%d", indexPath.row)
            label.textColor = UIColor.red
            for subview in cell.contentView.subviews
            {
                subview.removeFromSuperview()
            }
            cell.contentView.addSubview(label)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        if(kind == UICollectionView.elementKindSectionHeader)
        {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: headerView.bounds.size.width, height: headerView.bounds.size.height))
            label.textAlignment = .center
            if(indexPath.section == 0)
            {
                label.text = "客製化 Collection View Cell"
            }
            else
            {
                label.text = "原生 Collection View Cell"
            }
            for subview in headerView.subviews
            {
                subview.removeFromSuperview()
            }
            headerView.addSubview(label)
            return headerView
        }
        return UICollectionReusableView()
    }
}

extension collectionViewDemoVC: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath)
    {
        print(indexPath.section,"-",indexPath.row)
    }
}

extension collectionViewDemoVC: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if(indexPath.section == 0)
        {
            let width = Int((collectionView.bounds.size.width-20)/3)
            let height = Int(CGFloat(width)*1.5)
            return CGSize(width: width, height: height)
        }
        else
        {
            let width = Int((collectionView.bounds.size.width-40)/5)
            return CGSize(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    func collectionView(_ collectView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        let width = collectionView.bounds.size.width
        return CGSize(width: width, height: 50)
    }
}
