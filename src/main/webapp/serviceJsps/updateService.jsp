<%@ page import="model.Service, repository.ServiceRepository" %>
<%@ page import="java.lang.*" %>

<%
    String idString = request.getParameter("id");
    int id = Integer.parseInt(idString);
  String name = request.getParameter("name");
  String priceString = request.getParameter("price");
  int price = Integer.parseInt(priceString);

    Service service = new Service(id, name, price);


  ServiceRepository repository = new ServiceRepository();


  repository.updateService(service);

%>

  <meta http-equiv="Refresh" content="0; url='serviceCatalog.jsp" />