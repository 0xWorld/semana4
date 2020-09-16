<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="base_crud/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>     
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 30px">      
        <%
      		//Dylan Ramirez Aburto
      		//1630614
        	//base de datos
        	Connection con;
	        String url = "jdbc:mysql://127.0.0.1:3306/prueba";
	        String Driver = "com.mysql.jdbc.Driver";
	        String user = "root";
	        String clave = "";
	        Class.forName(Driver);
	        con = DriverManager.getConnection(url, user, clave);
	        PreparedStatement ps;
	        //Emnpezamos Listando los Datos de la Tabla Usuario
	        Statement smt;
	        ResultSet rs;
	        smt = con.createStatement();
	        rs = smt.executeQuery("select * from persona");       
        %>      
        
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal"> Agregar Nuevo</button>
             </div>  
              
        <br>
        <div class="container">               
                  
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th>Nombres</th>
                            <th class="text-center">DNI</th>
                            <th class="text-center">Telf</th>
                            <th class="text-center">Dirección</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                       <%
                       while(rs.next()){
                    	   
                       %>
                        <tr>
                            <td class="text-center"><%=rs.getInt("id") %></td>
                            <td><%=rs.getString("nombre") %></td>
                            <td class="text-center"><%=rs.getString("dni") %></td>
                            <td class="text-center"><%=rs.getString("telf") %></td>
                            <td class="text-center"><%=rs.getString("dir") %></td>
                            <td class="text-center">
                                <a href="Editar.html" class="btn btn-primary">Editar</a>
                                <a href="Delete.html" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%} %>
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registro</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>Nombres:</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>
                                <label>DNI:</label> 
                                <input type="text" name="txtDNI" class="form-control"/>                                      
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
           
        </div>        
        <script src="base_crud/js/jquery.js" type="text/javascript"></script>             
        <script src="base_crud/js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>
