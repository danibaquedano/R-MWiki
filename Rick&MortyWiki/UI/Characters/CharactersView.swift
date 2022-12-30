import SwiftUI

//Lista de personajes.
struct CharactersView: View {
    
    enum SheetNavigation: Identifiable {
        var id: String { "SheetNavigation" }
        case characterDetail(CharacterDTO)
        case filters
    }
    
    @StateObject private var viewModel: CharactersViewModel
    @State private var showCharacterSheet: CharacterDTO?
    @State private var sheetNavigation: SheetNavigation?
    @State var refreshList: Bool = false
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(viewModel: CharactersViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isFiltered {
                    AppliedFiltersView(name: $viewModel.filterName, gender: $viewModel.filterGender, status: $viewModel.filterStatus, refreshList: $refreshList)
                }
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.characters) { character in
                        CharacterRowView(character: character).onTapGesture {
                            showCharacterSheet = character
                            sheetNavigation = .characterDetail(character)
                        }.onAppear {
                            if viewModel.characters.suffix(5).contains(where: {character.id == $0.id}) {
                                viewModel.getMoreCharacters()
                            }
                        }
                    }
                }
            }.navigationTitle("characterView_title".localized())
                .navigationBarTitleDisplayMode(.inline)
                .sheet(item: $sheetNavigation, onDismiss: {
                    showCharacterSheet = nil
                }) { newSheet in
                    switch newSheet {
                    case let .characterDetail(showCharacterSheet) :  CharacterDetailsView(character: showCharacterSheet)
                    case .filters:
                        CharacterFilterView(name: viewModel.filterName,
                                            status: viewModel.filterStatus,
                                            gender: viewModel.filterGender) { name, status, gender in
                            viewModel.filterName = name
                            viewModel.filterStatus = status
                            viewModel.filterGender = gender
                            viewModel.getCharacters()
                        }
                    }
                }
                .onAppear {
                    if viewModel.characters.count == 0 {
                        viewModel.getCharacters()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            sheetNavigation = .filters
                        } label: {
                            ZStack {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .foregroundColor(viewModel.isFiltered ? Color(UIColor.white) : Color(UIColor.label))
                                    .background(Circle().fill(viewModel.isFiltered ? Color(UIColor.black) : Color(UIColor.systemBackground)))
                                
                                if viewModel.isFiltered {
                                    Text(String(viewModel.numResults))
                                        .font(.footnote)
                                        .padding(5)
                                        .foregroundColor(Color.white)
                                        .background(Circle().fill(.red ))
                                        .overlay(Circle().stroke(.white, lineWidth: 1))
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                    }
                }
                .onChange(of: refreshList) { newValue in
                    viewModel.getCharacters()
                    refreshList = false
                }
                .errorAlert(error: $viewModel.getCharactersError)
                .padding(.horizontal)
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(viewModel: CharactersViewModel(charactersRemoteAPI: CharactersRemoteAPILive(networkClient: URLSessionNetworkClient())))
    }
}
