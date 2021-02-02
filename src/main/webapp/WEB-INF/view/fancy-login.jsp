<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Welcome to the CRM App by Adam Trzaskowski. </title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
<h2 style="text-align: center;"><strong>Welcome to the homepage of Adam Trzaskowski</strong></h2>
<p>&nbsp;</p>
<p style="text-align: center;">I am currently employed as a Technical Support Engineer, however, I would like to become a Java Software Developer. As the very simple layout of this page can clearly demonstrate, I am more inclided towards a back-end role. My CV can be found <a href="https://www.interviewme.pl/cv/atrzaskowski" target="_blank" rel="noopener">here</a></p>
<p style="text-align: center;"><span style="color: #000000;">I am self-thought, but I was aware of pitfalls of this approach and focused on learning design patterns and good coding practices along with technical concepts. Here is a list of Udemy courses I completed until now:</span></p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;"><a href="https://www.udemy.com/java-the-complete-java-developer-course">https://www.udemy.com/java-the-complete-java-developer-course/</a></p>
<p style="text-align: center;">(the longest Java course available on the platform)</p>
<p style="text-align: center;"><a href="https://www.udemy.com/spring-hibernate-tutorial">https://www.udemy.com/spring-hibernate-tutorial</a></p>
<p style="text-align: center;">(the most extensive Spring course I found)</p>
<p style="text-align: center;"><a href="https://www.udemy.com/java-interview-questions-and-answers/">https://www.udemy.com/java-interview-questions-and-answers/</a></p>
<p style="text-align: center;"><a href="https://www.udemy.com/data-structures-and-algorithms-deep-dive-using-java">https://www.udemy.com/data-structures-and-algorithms-deep-dive-using-java</a></p>
<p style="text-align: center;"><a href="https://www.udemy.com/complete-python-bootcamp/">https://www.udemy.com/complete-python-bootcamp/</a></p>
<p>&nbsp;</p>
<p style="text-align: center;"><strong>CRM APP<br /></strong></p>
<p style="text-align: center;">This simple Web MVC-pattern app was created to test my understanding of various elements of Spring Framework and multiple design patterns.</p>
<p style="text-align: center;">The source code can be found on my GitHub <a href="https://github.com/kienzen?tab=repositories"><strong><span style="color: #3366ff;">profile</span></strong></a></p>
<p>&nbsp;</p>
<p style="text-align: center;"><strong>Technical Details:</strong></p>
<p style="text-align: center;">It was built using Maven. Spring Boot could have been used to reduce the configuration issues and simplyfiy future maintnence, but I wanted to understand/observe all the underlying details at the beginning.</p>
<p style="text-align: center;">The application's data is stored in MySql 5 database. Passwords are encrypted using BCRYPT. ID/Primary key generation is delegated to the database. Content is accessed and modified using a Hibernate DAO, which could easily be replaced by Spring Data JPA, if the app were to be expanded.</p>
<p style="text-align: center;">On the front-end the data can be accessed either by using a web interface or a REST API - both provide the same functionality and security. The web interface was built using Spring form tags, JSTL and basic HTML and CSS.</p>
<p style="text-align: center;">Error handling for the REST API is being handled by using the single ControllerAdvice. For invalid/unautorised web requests, an "access denied" page is displayed.<br /> <br />For security and authentication of both web/REST interfaces, I used Spring Security. Users and their roles are hardcoded and authenticated against the database. The Spring Security filters were used to adjust the page content, to present only the content the user-role can utilize.</p>
<p style="text-align: center;">The application was deployed online using a pre-configured Ubuntu/Tomcat setup on AWS: <a href="https://bitnami.com/stack/tomcat/cloud">https://bitnami.com/stack/tomcat/cloud</a></p>
<p style="text-align: justify;">&nbsp;</p>
<p style="text-align: center;"><strong>Using the Application:</strong></p>
<p style="text-align: center;">The CRM allows you to manage a list of customers. There are three users/roles available:</p>
<p style="text-align: center;"><em>Employee</em> role can perform the following (REST endpoints in brackets): <br />1. Get a list of all customers. ( GET /api/customers )<br />2. Get a single customer. ( GET /api/customers/{customerId} )<br /> <br /><em>Manager</em>:<br />1. Actions permitted to an Employee <br />2. Add a new customer. ( POST /api/customers )<br />3. Update an existing customer. ( PUT /api/customers )<br /> <br /><em>Admin</em>: <br />1. Actions permitted to a Manager <br />2. Delete a customer. ( DELETE /api/customers/{customerId} )</p>
<p style="text-align: center;">You can log in and test the app using following credentials:</p>
<p style="text-align: center;">Login: <span style="color: #ff0000;">employee</span>, password: <span style="color: #ff0000;">123</span><br />Login: <span style="color: #ff0000;">manager</span>, password: <span style="color: #ff0000;">456</span><br />Login: <span style="color: #ff0000;">admin</span>, password: <span style="color: #ff0000;">789</span></p>
	<div>
		
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-5 col-sm-6 col-sm-offset-3">
			
			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">Sign In</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form action="${pageContext.request.contextPath}/authenticateTheUser" 
						  method="POST" class="form-horizontal">

					    <!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>
								
									<!-- Check for login error -->
								
									<c:if test="${param.error != null}">
										
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid username and password.
										</div>
		
									</c:if>
										
									<!-- Check for logout -->

									<c:if test="${param.logout != null}">
										            
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.
										</div>
								    
									</c:if>
									
					            </div>
					        </div>
					    </div>

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							
							<input type="text" name="username" placeholder="username" class="form-control">
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
							
							<input type="password" name="password" placeholder="password" class="form-control" >
						</div>

						<!-- Login/Submit Button -->
						<div style="margin-top: 10px" class="form-group">						
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">Login</button>
							</div>
						</div>

				
					</form:form>

				</div>
				
			</div>


		</div>

	</div>

</body>
</html>