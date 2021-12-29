//
//  SearchTabView.swift
//  Corinews
//
//  Created by Dustin yang on 12/28/21.
//


import SwiftUI

struct SearchTabView: View {
    
    @StateObject var searchVM = ArticleSearchViewModel.shared
    
    var body: some View {
        NavigationView {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .navigationTitle("뉴스검색")
        }
        .searchable(text: $searchVM.searchQuery) { suggestionsView }
        .onChange(of: searchVM.searchQuery) { newValue in
            if newValue.isEmpty {
                searchVM.phase = .empty
            }
        }
        .onSubmit(of: .search, search)
    }
    
    private var articles: [Article] {
        if case .success(let articles) = searchVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch searchVM.phase {
        case .empty:
            if !searchVM.searchQuery.isEmpty {
                ProgressView()
            } else if !searchVM.history.isEmpty {
                SearchHistoryListView(searchVM: searchVM) { newValue in
                    // Need to be handled manually as it doesn't trigger default onSubmit modifier
                    searchVM.searchQuery = newValue
                    search()
                }
            } else {
                EmptyPlaceholderView(text: "검색할 단어를 입력해주세요", image: Image(systemName: "magnifyingglass"))
            }
            
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "검색 결과가 없습니다", image: Image(systemName: "magnifyingglass"))
            
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: search)
            
        default: EmptyView()
            
        }
    }
    
    @ViewBuilder
    private var suggestionsView: some View {
        ForEach(["BTC", "Crypto", "코인"], id: \.self) { text in
            Button {
                searchVM.searchQuery = text
            } label: {
                Text(text)
            }
        }
    }
    
    private func search() {
        let searchQuery = searchVM.searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        if !searchQuery.isEmpty {
            searchVM.addHistory(searchQuery)
        }
        
        Task {
            await searchVM.searchArticle()
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    
    @StateObject static var bookmarkVM = ArticleBookmarkViewModel.shared
    
    static var previews: some View {
        SearchTabView()
            .environmentObject(bookmarkVM)
    }
}
