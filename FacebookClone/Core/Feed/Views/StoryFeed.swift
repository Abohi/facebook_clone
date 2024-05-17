

import SwiftUI

struct StoryFeed: View {
    private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCard(viewModel: viewModel)
                StoryCard(viewModel: viewModel)
            }
            .padding(.leading)
            .padding(.vertical,5)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StoryFeed(viewModel: FeedViewModel())
}
