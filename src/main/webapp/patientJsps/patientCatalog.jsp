<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="repository.PatientRepository" %>
<%@ page import="model.Patient" %>
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
    <title>Patient Manager Page</title>
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
<p style="font-size:160%;"><i>This is the patient catalog!</i></p>
    <div style="background-color: white;">
    <table border="1" class="table table-striped table-hover w-100 p-3">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Delete</th>
            <th>Update</th>
            <th>Appointment</th>
        </tr>
        <%
            PatientRepository repository = new PatientRepository();

            List<Patient> patient = repository.getAllPatients();
            for (Patient patients : patient) {
        %>
            <tr>
                <td><%= patients.getId() %></td>
                <td><%= patients.getName() %></td>
                <td><%= patients.getEmail() %></td>
                <td><a href="deletePatient.jsp?id=<%=patients.getId() %>"><button type="button"  class="btn btn-primary btn-block">Delete</button></a></td>
                <td><a href="updatePagePatient.jsp?id=<%=patients.getId()%>"><button type="button"  class="btn btn-primary btn-block">Update</button></a></td>
                <td><a href="../appointmentJsps/addAppointmentPage.jsp?id=<%=patients.getId()%>&name=<%=patients.getName()%>"><button type="button"  class="btn btn-primary btn-block">Appointment</button></a></td>
            </tr>

        <% } %>
    </table>
    </div>
<br/>
<br/>
<h2>Add a patient</h2>

    <form action="addPatient.jsp">
        <div class="form-outline mb-4">
            <input type="text" name="name" value="Name..." onclick="this.value=''"/><br/>
        </div>
        <div class="form-outline mb-4">
            <input type="text" name="email"  value="Email..." onclick="this.value=''"/><br/>
        </div>

    <br/>

    <input type="submit" value="Add Patient" class="btn btn-primary btn-block"/>

</body>
</html>
