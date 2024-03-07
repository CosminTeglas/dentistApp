<%@ page import="model.Service, repository.ServiceRepository" %>
<%@ page import="java.lang.*" %>

<%

   String idString=request.getParameter("id");
   int id = Integer.parseInt(idString);


  ServiceRepository repository = new ServiceRepository();

  repository.deleteService(id);

%>

  <meta http-equiv="Refresh" content="0; url='serviceCatalog.jsp" />