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
#quote{
background-color: rgba(255, 0, 0, 0.4);
font-size: 180%;
text-align: center;
font-family: courier;
}

body {
  background-image: url('Die-Praxis1.jpg');
  height: 100%;
  background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home Page</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
</head>
<body>
<div id="menu">
    <ul>
    <li><a href="patientJsps/patientCatalog.jsp">Patient Catalog</a></li>
    <li><a href="serviceJsps/serviceCatalog.jsp">Service Catalog</a></li>
    <li><a href="appointmentJsps/appointmentCatalog.jsp">Appointment Catalog</a></li>
</div>

<p style=" display: flex; justify-content: center; align-items: center; height: 200px; border: 3px solid red;" id="quote"><i><b> The most beautiful moments in our life are accompanied by a smile. Each of us needs the support of a specialist to preserve the natural beauty of our smile.</b></i></p>
</body>
</html>


