<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="repository.PatientRepository" %>
<%@ page import="model.Patient" %>
<%@ page import="java.lang.*" %>
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
    <!-- This will make the table look nicer -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Update patient page</title>
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
<%
    String idString = request.getParameter("id");
    int id = Integer.parseInt(idString);
    String nameString = request.getParameter("name");
    String emailString = request.getParameter("email");
    %>

     <table border="1" class="table table-striped table-hover w-50 p-3">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                </tr>
            <%
                PatientRepository repository = new PatientRepository();

                List<Patient> patient = repository.selectPatient(id);
                for (Patient patients : patient) {
            %>
                <tr>
                    <td><%= patients.getId()%></td>
                    <td><%= patients.getName() %></td>
                    <td><%= patients.getEmail() %></td>

                </tr>


        </table>
        <form method="post" action="updatePatient.jsp">
        <input type="hidden" name="id" value="<%=patients.getId() %>">
        <br>
        Name:<br>
        <input type="text" name="name" value="">
        <br>
        Email Id:<br>
        <input type="email" name="email" value="">
        <br><br>
        <input type="submit" value="submit">
        </form>
        <% } %>

</body>
</html>