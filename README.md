# iOS Journal App

A beautiful and intuitive journaling app built with SwiftUI and SwiftData, designed to help you capture your thoughts, memories, and experiences with photos.

## Features

- 📝 **Create Journal Entries**: Write and save your daily thoughts and experiences
- 📸 **Photo Integration**: Add up to 6 photos per entry using the Photos picker
- 🗂️ **Organized List View**: Browse all your entries in chronological order (newest first)
- 🔍 **Entry Details**: View full entries with photos in a dedicated detail screen
- 💾 **Persistent Storage**: All data is saved locally using SwiftData
- 🎨 **Modern UI**: Clean, native iOS design with SwiftUI

## Demo

![iOS Journal App Demo](demo.gif)

The app features three main screens:
- **Journal List**: Overview of all your entries with thumbnails and previews
- **Entry Composer**: Create new entries with title, body text, and photos
- **Entry Detail**: View complete entries with full-size photos



## Requirements

- **iOS**: 18.2 or later
- **Xcode**: 16.0 or later
- **Swift**: 6.0 or later

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/IOSJournalApp.git
   cd IOSJournalApp
   ```

2. Open the project in Xcode:
   ```bash
   open IOSJournalApp.xcodeproj
   ```

3. Build and run the project (⌘+R)

## Usage

### Creating a New Entry
1. Tap the "+" button in the top-right corner of the main screen
2. Enter a title for your entry
3. Optionally add photos by tapping "Pick Photos" (up to 6 images)
4. Write your journal entry in the text editor
5. Tap "Save" to create the entry

### Viewing Entries
- All entries are displayed on the main screen in reverse chronological order
- Tap any entry to view it in full detail
- Each entry shows a thumbnail, title preview, body preview, and creation date

### Managing Entries
- Entries are automatically saved and persist between app launches
- Photos are stored locally on the device
- The app handles cleanup of associated images when entries are deleted




## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

Created by Paulo Henrique Torres

## Acknowledgments

- Built with Apple's latest SwiftUI and SwiftData frameworks
- Uses native iOS Photos picker for seamless image selection
- Follows Apple's Human Interface Guidelines for optimal user experience
