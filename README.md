# Users Task Management
 j'ai développé une mini application iOS qui permet de gérer la liste des tâches des utilisateurs.
 
 ## Video illustratif du resultat

https://user-images.githubusercontent.com/29579196/165059969-97626868-382e-4f2c-afbb-3d33dbaf379b.mp4
![](https://github.com/ouazizmed/ToDoListUsers/blob/main/UserTaskManagement.gif)


 ## Fonctionnement :
Il s’agit d’une vue qui affiche une liste d’utilisateur récupérée via une API REST, en choisissant un
utilisateur je peux afficher ses tâches dans une autre vue.  
Un utilisateur est désigné par son nom (name), son nom d’utilisateur (username) et son email
(email), les autres informations seront ignorées.  
Une tâche est désignée par son titre (title) et l’état d’avancement (completed) qui indique si cette
dernière est complétée ou pas.

## API :
• Liste d’utilisateur : https://jsonplaceholder.typicode.com/users/   
• Liste des tâches par utilisateur : https://jsonplaceholder.typicode.com/todos?userId=%d

## Architecture
J'ai utilisé l'architecture MVVM avec le routage.  

 
