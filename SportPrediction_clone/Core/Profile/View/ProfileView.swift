import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @StateObject private var userListModel = UserListViewModel()
    

    var body: some View {
        ZStack {
            Color.themeColor(1).ignoresSafeArea()
                .overlay {
                    VStack {
                        HStack(content: {
                            Text("Profile")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            
                        })
                        .padding(.horizontal)

                        HStack {
                            AsyncImage(url: URL(string: "https://myprofilepicture-leoyang.s3.us-east-2.amazonaws.com/profileImage")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .padding()

                        VStack {
                            if viewModel.isEditingName {
                                TextField("Enter Name", text: $viewModel.newName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.horizontal)
                                    .foregroundColor(.black)
                            } else {
//                                Text(viewModel.newName)
                                Text("Leo Yang")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }

                            HStack {
                                Button(action: {
                                    viewModel.isEditingName.toggle()
                                }) {
                                    Text(viewModel.isEditingName ? "Cancel" : "Edit Name")
                                        .padding(.horizontal)
                                       .padding(.vertical, 8)
                                       .background(.blue)
                                       .foregroundColor(.white)
                                       .cornerRadius(8)
                                }

                                if viewModel.isEditingName {
                                    Button(action: {
                                        viewModel.saveButtonTapped = true
                                        viewModel.saveUser()
                                        viewModel.isEditingName = false
                                    }) {
                                        Text("Save")
                                            .padding(.horizontal)
                                           .padding(.vertical, 8)
                                           .background(Color.green)
                                           .foregroundColor(.white)
                                           .cornerRadius(8)
                                    }
                                    .disabled(viewModel.newName.isEmpty)
                                }
                            }
                            .padding(.vertical)
                            .alert(isPresented: $viewModel.saveButtonTapped) {
                                Alert(
                                    title: Text("API Response"),
                                    message: Text(viewModel.errorMessage ?? "User saved successfully!"),
                                    dismissButton: .default(Text("OK")) {
                                        viewModel.saveButtonTapped = false
                                        viewModel.errorMessage = nil
                                    }
                                )
                            }
                            Spacer()
                        }
                        .onChange(of: viewModel.newName) { _ in
                            viewModel.errorMessage = nil // Clear error message when name changes
                        }

                        Spacer()
                    }
                    .padding()
                    
                    
                }
        }
        .foregroundColor(.white)
        .onAppear{
            userListModel.fetchUserList()
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
