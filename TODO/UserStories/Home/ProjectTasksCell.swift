//
//  ProjectTasksCell.swift
//  TODO
//
//  Created by Simon Kostenko on 1/16/18.
//  Copyright © 2018 ANODA. All rights reserved.
//

import UIKit
import ANODA_Alister

class ProjectTasksViewModel: NSObject {
    
    var name: String
    var icon: UIImage?
    var background: UIImage?
    var numberOfTasks: Int
    var progress: Double
    
    init(project: Project) {
        name = project.name
        icon = project.icon
        background = project.background
        numberOfTasks = 0
        progress = project.progress
        super.init()
    }

}

class ProjectTasksCell: ANCollectionViewCell {
    
    let projectView = ProjectView()
    
    override func update(withModel model: Any!) {
        guard let viewModel = model as? ProjectTasksViewModel else {
            assert(false, "❌ viewModel for cell is incorrect")
            return
        }
        projectView.update(viewModel)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(projectView)
        projectView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}