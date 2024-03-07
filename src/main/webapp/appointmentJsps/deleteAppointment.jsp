<%@ page import="model.Appointment, repository.AppointmentRepository" %>
<%@ page import="java.lang.*" %>

<%

   String idString=request.getParameter("id");
   int id = Integer.parseInt(idString);


  AppointmentRepository repository = new AppointmentRepository();

  repository.deleteAppointment(id);

%>

  <meta http-equiv="Refresh" content="0; url='appointmentCatalog.jsp" />