# Users Task Management
 j'ai développé une mini application iOS qui permet de gérer la liste des tâches des utilisateurs.
 
 ## Video illustratif du résultat

<img src="https://github.com/ouazizmed/ToDoListUsers/blob/main/UserTaskManagement.gif" width="250" height="537"/>



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
• J'ai utilisé l'architecture MVVM avec le routage.    
• Core Data pour télécharger data depuis WebService en mode offline.  
• URLSession dans coté Networking.

## Must To Have (Obligatoire):
• Bonne gestion de mémoire  
• Gestion du cache, je peux utiliser l’application en mode offline si j’ai déjà téléchargé les
data depuis le WebService  
• Affichage correcte sur tout type de device iPhone/iPad sans oublier l’orientation
portrait/landscape.
 
