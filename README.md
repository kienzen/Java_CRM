# Java_CRM
JAVA Web MVC-pattern app


This simple Web MVC-pattern app was created to test my understanding of various elements of Spring Framework.

It was built using Maven. Spring Boot could have been used to reduce the configuration issues and simplyfiy future maintnence, but I wanted to understand/observe all the underlying details at the beginning.

The application's data is stored in MySql 8 database. Passwords are encrypted using BCRYPT. ID/Primary key generation is delegated to the database.
Content is accessed and modified using a Hibernate DAO, which could easily be replaced by Spring Data JPA, if the app were to be expanded - due to the fact that all the DAO requests are delegated through the Service proxy.

On the front-end the data can be accessed either by using a web interface or a REST API - both provide the same functionality and security. 
The web interface was built using Spring form tags, JSTL and basic HTML and CSS. 
 
For security and authentication of both web/REST interfaces, I used Spring Security. Users and their roles are hardcoded and authenticated against the database. The Spring Security filters were used to adjust the page content, to present only the content the user-role can utilize. There are three users/roles available:

Employee role can perform the following (REST endpoints in brackets):  
1. Get a list of all customers. ( GET /api/customers )
2. Get a single customer. ( GET /api/customers/{customerId} )
 
Manager:
1. Actions permitted to an Employee  
2. Add a new customer. ( POST /api/customers )
3. Update an existing customer. ( PUT /api/customers )
     
Admin: 
1. Actions permitted to a Manager  
1. Delete a customer. ( DELETE /api/customers/{customerId} )

You can log in and test the app using following credentials:

Login: Employee, password: 123
Login: Manager, password: 456
Login: Admin, password: 789
