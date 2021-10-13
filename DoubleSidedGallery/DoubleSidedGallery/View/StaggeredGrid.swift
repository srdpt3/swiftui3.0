//
//  StaggeredGrid.swift
//  DoubleSidedGallery
//
//  Created by Dustin yang on 10/12/21.
//

import SwiftUI

struct StaggeredGrid<Content: View,T: Identifiable>: View where T: Hashable {
    
    // It will return each object from collection to build View...
    var content: (T) -> Content
    
    var list: [T]
    
    // Columns...
    var columns: Int
    
    // Properties...
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int,showsIndicators: Bool = false,spacing: CGFloat = 10,list: [T],@ViewBuilder content: @escaping (T)->Content){
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    
    func setUpList()->[[T]]{
      
        
        var gridArray : [[T]] = Array(repeating: [], count: columns)
        var currentIndex : Int = 0
        
        for object in list{
            gridArray[currentIndex].append(object)
            
            //check if overbounds
            if currentIndex == (columns - 1){
                currentIndex = 0;
            }else{
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            
            HStack(alignment: .top){
                
                ForEach(setUpList(),id: \.self){columnsData in
                    
                    // For Optimized Using LazyStack...
                    LazyVStack(spacing: spacing){
                        
                        ForEach(columnsData){object in
                            content(object)
                        }
                    }
                }
            }
            // only vertical padding...
            // horizontal padding will be user's optional...
            .padding(.vertical)
        }
    }
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
