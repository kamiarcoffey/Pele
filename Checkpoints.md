#### Checkpoint HW3

###### Included in this checkpoint:
* Scene navigation and multiple views for each stage of UI found in: StoryBoard 10:18.png
  * Storyboards did not appear to render properly in git, so there is a screenshot of it currently
  * Includes navigation and segues
  * Includes UI prototype cells for table views
  * NOTE: SwiftUI is the new preferred way to create iOS views. It was released in Summer 2019, so I am unfamiliar with how to use it. As such, I have made the storyboard from InterfaceBuilder for this checkpoint to meet my proposed schedule, but I will be converting it to be generated from SwiftUI in the next Sprint.

* UserDefaults Singleton Access Point and Model

* Base classes or Rep, Set, Exercise (found in folder Model)
* Base classes for non-rep based classes are in development but not ready for commits to master

* Base protocol for Activity that each Exercise implements

* Model for creating, editing, saving workout playlists / routines

Items from sheduled checkpoints that have been completed:

10/11: MVC outline and app set up. Includes:
1) CoreData model is functional, but final implementation will depend on structure of cardio classes too. - Yes
2) file structure, and functional app start up - Yes
3) basic segue navigation between UI pages - Yes

10/18: Building routines and playlists. Includes:
1) MVC for building routines - Model and View are done. Controller is not finished yet.
2) Front End UI View for building routines and playlists  - Yes. See storyboard
3) Controller to manage data flow - No
4)  Model to temporarily store data locally in object structure and pass as an object to the backend User Defaults MVC via API - Yes. See UserDefaultsSingleton
