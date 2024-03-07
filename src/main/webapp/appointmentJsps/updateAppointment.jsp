<%@ page import="model.Appointment, repository.AppointmentRepository" %>
<%@ page import="java.time.LocalDate"%>



<%
  String appointment_id_String = request.getParameter("id");
  int appointment_id = Integer.parseInt(appointment_id_String);
  String patient_idString = request.getParameter("patient_id");
  int patient_id = Integer.parseInt(patient_idString);
  String service_idString = request.getParameter("service");
  int service_id = Integer.parseInt(service_idString);
  String dateString = request.getParameter("date");
  LocalDate date = LocalDate.parse(dateString);

   Appointment appointment = new Appointment(appointment_id, service_id, date);

  AppointmentRepository repository = new AppointmentRepository();


  repository.updateAppointment(appointment);

%>

  <meta http-equiv="Refresh" content="0; url='appointmentCatalog.jsp" />