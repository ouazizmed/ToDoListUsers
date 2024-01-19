# Users Task Management
I developed a mini iOS application that allows managing the task list of users.

## Illustrative Video of the Result

<img src="https://github.com/ouazizmed/ToDoListUsers/blob/main/UserTaskManagement.gif" width="250" height="537"/>


## Functioning:
This is a view that displays a list of users retrieved via a REST API. By selecting a user, I can display their tasks in another view.  
A user is identified by their name (name), username (username), and email (email). Other information will be ignored.  
A task is identified by its title (title) and the progress state (completed) indicating whether it is completed or not.

## API:
• User list: https://jsonplaceholder.typicode.com/users/   
• List of tasks per user: https://jsonplaceholder.typicode.com/todos?userId=%d

## Architecture
• I used the MVVM architecture with routing.  
• Core Data to download data from WebService in offline mode.  
• URLSession in Networking side.

## Must To Have (Mandatory):
• Good memory management  
• Cache management, I can use the application in offline mode if I have already downloaded the data from the WebService  
• Correct display on all types of iPhone/iPad devices without forgetting the portrait/landscape orientation.
