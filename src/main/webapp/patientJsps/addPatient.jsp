<%@ page import="model.Patient, repository.PatientRepository" %>



<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");

  Patient patient = new Patient(name, email);

  PatientRepository repository = new PatientRepository();


  repository.addPatient(patient);

%>

  <meta http-equiv="Refresh" content="0; url='patientCatalog.jsp" />