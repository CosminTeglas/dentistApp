<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="repository.AppointmentRepository" %>
<%@ page import="model.Appointment" %>
<%@ page import="repository.ServiceRepository" %>
<%@ page import="model.Service" %>
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
    <title>Appointment Update Page</title>
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
    String patientIdString = request.getParameter("patient");
        int patient_id = Integer.parseInt(patientIdString);
    %>

     <table border="1" class="table table-striped table-hover w-50 p-3">
            <tr>
                <th>Patient name</th>
                <th>Service name</th>
                <th>Date</th>
                </tr>
            <%
                AppointmentRepository repository = new AppointmentRepository();

                List<Appointment> appointment = repository.selectAppointment(id);
                for (Appointment appointments : appointment) {
            %>
                <tr>
                    <td><%= appointments.getPatientName()%></td>
                    <td><%= appointments.getServiceName() %></td>
                    <td><%= appointments.getDate() %></td>

                </tr>
               <%}%>
        </table>

        <form method="post" action="updateAppointment.jsp">
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="hidden" name="patient_id" value="<%=patient_id%>">
                    Update appoinment service:<br>
                <div class="form-outline mb-4">

                    <select id="service" name="service">
                        <%
                                    ServiceRepository repository2 = new ServiceRepository();

                                    List<Service> service = repository2.getAllServices();
                                    for (Service services : service) {
                        %>

                            <option value ="<%=services.getId()%>"><%=services.getName()%></option>
                        <%}%>
                    </select>
                </div>
                Update appointment date: <br>
                <div class="form-outline mb-4">
                    <input type="date" name="date"><br/>
                </div>

            <br/>

            <input type="submit" value="Update Appointment" class="btn btn-primary btn-block"/>
            </form>