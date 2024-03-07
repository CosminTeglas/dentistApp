<%@ page import="model.Patient, repository.PatientRepository" %>
<%@ page import="java.lang.*" %>

<%

   String idString=request.getParameter("id");
   int id = Integer.parseInt(idString);


  PatientRepository repository = new PatientRepository();

  repository.deletePatient(id);

%>

  <meta http-equiv="Refresh" content="0; url='patientCatalog.jsp" />