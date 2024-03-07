<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="repository.AppointmentRepository" %>
<%@ page import="model.Appointment" %>
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
    <title>Appointment Manager Page</title>
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

<p style="font-size:160%;"><i>This is the appointment catalog!</i></p>
    <table border="1" class="table table-striped table-hover w-50 p-3">
        <tr>
            <th>Name</th>
            <th>Service</th>
            <th>Date</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
        <%
            AppointmentRepository repository = new AppointmentRepository();

            List<Appointment> appointment = repository.getAllAppointments();

            for (Appointment appointments : appointment) {
        %>
            <tr>
                <td><%= appointments.getPatientName() %></td>
                <td><%= appointments.getServiceName() %></td>
                <td><%= appointments.getDate()%></td>
                <td><a href="deleteAppointment.jsp?id=<%=appointments.getId()%>"><button type="button"  class="btn btn-primary btn-block">Delete</button></a></td>
                <td><a href="updatePageAppointment.jsp?id=<%=appointments.getId()%>&patient=<%=appointments.getPatient_id()%>"><button type="button"  class="btn btn-primary btn-block">Update</button></a></td>

            </tr>

        <% } %>
    </table>
</body>
</html>