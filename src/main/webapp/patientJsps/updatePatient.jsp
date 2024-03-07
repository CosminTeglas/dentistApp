<%@ page import="model.Patient, repository.PatientRepository" %>
<%@ page import="java.lang.*" %>

<%
    String idString = request.getParameter("id");
    int id = Integer.parseInt(idString);
  String name = request.getParameter("name");
  String email = request.getParameter("email");

    Patient patient = new Patient(id, name, email);


  PatientRepository repository = new PatientRepository();


  repository.updatePatient(patient);

%>

  <meta http-equiv="Refresh" content="0; url='patientCatalog.jsp" />