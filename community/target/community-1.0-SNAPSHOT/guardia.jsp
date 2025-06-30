<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
     <<link rel="stylesheet" href="Styles/admin.css">
        <meta charset="UTF-8">
    <title>Panel Guardia</title>
    <style>
        body {
            background-color: #fff3cd;
            font-family: Arial, sans-serif;
            padding: 2rem;
        }
        h1 {
            color: #856404;
        }
        .contenedor {
            background: white;  
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
        }
    </style>
</head>
<body>
    
    <%@include file="common/sidebarGuardia.jsp" %>
    <%@include file="common/header.jsp" %>
     <div class="main-content">
     <div class="content"> 
    <div class="contenedor">
        <h1>Bienvenido Guardia</h1>
        <p>Aquí puedes registrar visitantes, verificar vehículos y reportar incidentes.</p>
    </div>
    </div>
      </div>
</body>
</html>
  