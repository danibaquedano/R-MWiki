import SwiftUI

//Listado de localizaciones
struct LocationsView: View {
    
    @StateObject private var viewModel: LocationsViewModel
    @StateObject  private var nameFiltered: DebouncedState<String> = DebouncedState(initialValue: "")
    
    init(viewModel: LocationsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    ForEach(viewModel.locations) { location in
                        LocationRowView(location: location)
                            .padding(.horizontal)
                            .onAppear {
                                if viewModel.locations.suffix(5).contains(where: {location.id == $0.id}) {
                                    viewModel.getMoreLocations(name: nameFiltered.debouncedValue)
                                }
                            }
                    }
                }.searchable(text: $nameFiltered.currentValue)
                    .onChange(of: nameFiltered.debouncedValue) { newValue in
                        viewModel.getLocations(name: newValue)
                    }
                    .onAppear {
                        viewModel.getLocations(name: "")
                    }
            }.navigationTitle("locationsView_title".localized())
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: LocationsViewModel(locationsRemoteAPI: LocationsRemoteAPILive(networkClient: URLSessionNetworkClient())))
    }
}
