<%@ page import="model.Service, repository.ServiceRepository" %>



<%
  String name = request.getParameter("name");
  String priceString = request.getParameter("price");
  int price = Integer.parseInt(priceString);

  Service service = new Service(name, price);

  ServiceRepository repository = new ServiceRepository();


  repository.addService(service);

%>

  <meta http-equiv="Refresh" content="0; url='serviceCatalog.jsp" />