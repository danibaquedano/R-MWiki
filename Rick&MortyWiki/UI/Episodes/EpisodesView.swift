import SwiftUI

struct EpisodesView: View {
    
    @StateObject private var viewModel: EpisodesViewModel
    @StateObject  private var nameFiltered: DebouncedState<String> = DebouncedState(initialValue: "")
    init(viewModel: EpisodesViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    
                    ForEach(viewModel.episodes) { episode in
                        EpisodeRowView(episode: episode).onAppear {
                            if viewModel.episodes.suffix(5).contains(where: {episode.id == $0.id}) {
                                viewModel.getMoreEpisodes(name: nameFiltered.debouncedValue)
                            }
                        }
                    }.searchable(text: $nameFiltered.currentValue)
                        .onChange(of: nameFiltered.debouncedValue) { newValue in
                            viewModel.getEpisodes(name: newValue)
                        }
                }.padding(.horizontal)
                    .onAppear {
                        if viewModel.episodes.count == 0 {
                            viewModel.getEpisodes(name: "")
                        }
                    }
            }.navigationTitle("episodesView_title".localized())
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView(viewModel: EpisodesViewModel(episodesRemoteAPI: EpisodesRemoteAPILive(networkClient: URLSessionNetworkClient())))
    }
}
