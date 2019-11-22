#### Checkpoint HW5

###### Included in this checkpoint:
 * Updated UI

 * Switch to Combine Framework for updating routines

 * History fetching implemented


###### Major Architecture Changes
 * Using 'home-made' shapes to construct graph rather than CocoaPods Charts

 * Using Combine now

###### Items from scheduled checkpoints that have been completed:

11/22 Charts display. Includes:

1) Setting up dependencies viaCocoPods -> Done but depricated in favor or using a different method

2) Creating UI visuals for charts: Mostly done - still need to configure UI labels for different color coding for legend.

#### Checkpoint HW4

###### Included in this checkpoint:
 * Entirely new UI using SwiftUI

 * CoreData model built - note! I will be changing this to a Transformable model that can accept NSCoder/Decoder protocol objects
 rather than 'stringly typed' primitives

 * this will add a layer of abstraction that will decouple the CoreData implementation further from the UI

 * CoreData stack is set up

 * CoreData ViewModel is set up

 * New protocols added

 * Builder design pattern for constructing events

 * UserDefaults re-architected for type safety via an extension to UserDefaults class


###### Major Architecture Changes
 * SwiftUI (rather than UIKit and/or IB)
  * SwiftUI was released from Beta this summer (Aug 2019). As a result I have decided to entirely re-do the front end with SwiftUI
  * allows declarative, programatic construction of UI rather than InterfaceBuilder

 * Switched to MVVM rather than MVC
  * with SwiftUI, there are new bindings and state patterns that make MVVM preferred to MVC
  * this change will not affect the back end models or high-level protocols.

###### Items from scheduled checkpoints that have been completed:

10/25: Building main event logging screen. Includes:
 1) MVC for logging events - Yes
 2) Front End UI for logging Events and workouts - Yes
 3) Controller to manage data flow and pass objects to Core Data - Yes

11/1: Persistent storage for User Defaults. Includes
 1) User Defaults MVC - Done
 2) User-based key/value dictionary storage - Done


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

###### Items from sheduled checkpoints that have been completed:

10/11: MVC outline and app set up. Includes:
1) CoreData model is functional, but final implementation will depend on structure of cardio classes too. - Yes
2) file structure, and functional app start up - Yes
3) basic segue navigation between UI pages - Yes

10/18: Building routines and playlists. Includes:
1) MVC for building routines - Model and View are done. Controller is not finished yet.
2) Front End UI View for building routines and playlists  - Yes. See storyboard
3) Controller to manage data flow - No
4)  Model to temporarily store data locally in object structure and pass as an object to the backend User Defaults MVC via API - Yes. See UserDefaultsSingleton
