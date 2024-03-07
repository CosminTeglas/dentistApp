<%@ page import="model.dto.CreateAppointmentDto, repository.AppointmentRepository" %>
<%@ page import="java.time.LocalDate"%>



<%
  String patient_idString = request.getParameter("id");
  int patient_id = Integer.parseInt(patient_idString);
  String service_idString = request.getParameter("service");
  int service_id = Integer.parseInt(service_idString);
  String dateString = request.getParameter("date");
  LocalDate date = LocalDate.parse(dateString);

   CreateAppointmentDto appointment = new CreateAppointmentDto(patient_id, service_id, date);

  AppointmentRepository repository = new AppointmentRepository();


  repository.addAppointment(appointment);

%>

  <meta http-equiv="Refresh" content="0; url='appointmentCatalog.jsp" />