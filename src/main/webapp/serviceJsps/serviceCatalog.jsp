<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="repository.ServiceRepository" %>
<%@ page import="model.Service"%>
<html>
<head>
<style>
#menu{
    float: left;
    background: darkblue;
    width: 100%;
    height: 45px;
    margin-top: 10px;
}
ul{
list-style: none;
}
ul li a{
float: left;
color: white;
padding: 0px 40px;
}
</style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Service Manager Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.4/dist/bootstrap-table.min.css">
  </head>
<body style="background-color:powderblue;">
<div id="menu">
    <ul>
    <li><a href="/dentistApp">Back</a></li>
    </ul>

</div>
<p style="font-size:160%;"><i>This is the service catalog!</i></p>

 <table border="1" class="table table-striped table-hover w-50 p-3">
         <tr>
             <th>ID</th>
             <th>Name</th>
             <th>Price</th>
             <th>Delete</th>
             <th>Update</th>
         </tr>
         <%
             ServiceRepository repository = new ServiceRepository();

             List<Service> service = repository.getAllServices();
             for (Service services : service) {
         %>
             <tr>
                 <td><%= services.getId() %></td>
                 <td><%= services.getName() %></td>
                 <td><%= services.getPrice() %></td>
                 <td><a href="deleteService.jsp?id=<%=services.getId() %>"><button type="button"  class="btn btn-primary btn-block">Delete</button></a></td>
                 <td><a href="updatePageService.jsp?id=<%=services.getId()%>"><button type="button"  class="btn btn-primary btn-block">Update</button></a></td>
             </tr>

         <% } %>
     </table>
     <form action="addService.jsp">
            Service name: <br>
             <div class="form-outline mb-4">
                 <input type="text" name="name" value="Name..." onclick="this.value=''"/><br/>
             </div>
             Service price: <br>
             <div class="form-outline mb-4">
                 <input type="number" name="price"  value="Price..." onclick="this.value=''"/><br/>
             </div>

         <br/>

         <input type="submit" value="Add Service" class="btn btn-primary btn-block"/>
</body>
</html>