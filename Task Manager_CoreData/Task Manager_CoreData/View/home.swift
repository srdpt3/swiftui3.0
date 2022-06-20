//
//  home.swift
//  Task Manager_CoreData
//
//  Created by Dustin yang on 5/28/22.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel: TaskViewModel = .init()

    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome Back Dustin")
                        .font(.callout)
                    Text("Today's Update")
                        .font(.title2.bold())
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.vertical)
                
                CustomSegmentedBar()
                    .padding(.top,5)
                
                // MARK: Task View
                TaskView()
            }
            .padding()
        }
    }
    
    
    // MARK: TaskView
    @ViewBuilder
    func TaskView()->some View{
        LazyVStack(spacing: 20){
            // MARK: Custom Filtered Request View
            // See My Dynamic Filter Video
            // Link in Description
//            DynamicFilteredView(currentTab: taskModel.currentTab) { (task: Task) in
//                TaskRowView(task: task)
//            }
        }
        .padding(.top,20)
    }
    
    // MARK: Custom Segmented Bar
    @ViewBuilder
    func CustomSegmentedBar()->some View{
        // In Case if we Missed the Task
        let tabs = ["Today","Upcoming","Task Done","Failed"]
        HStack(spacing: 0){
            ForEach(tabs,id: \.self){tab in
                Text(tab)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .scaleEffect(0.9)
                    .foregroundColor(taskModel.currentTab == tab ? .white : .black)
                    .padding(.vertical,6)
                    .frame(maxWidth: .infinity)
                    .background{
                        if taskModel.currentTab == tab{
                            Capsule()
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{taskModel.currentTab = tab}
                    }
            }
        }
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
