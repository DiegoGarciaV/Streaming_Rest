<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%> 
<%@page import="java.util.Map"%> 
    <!DOCTYPE html>
    <html lang="es" ng-app="homeApp">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>
            Administrador Pumactivate
        </title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">

        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/index/home.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <!-- Font Awesome JS -->
        <!--To consult all font awesome icons:
            https://fontawesome.com/v6/icons?m=free
        -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <script type="text/javascript" src="js/tools/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="js/tools/angular.js"></script>
        <script type="text/javascript" src="js/tools/angular-route.js"></script>
        <script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>

        
        <script type="text/javascript" src="js/home/app.js"></script>
        <script type="text/javascript" src="js/home/index.js"></script>

    </head>

    <body ng-controller="controlador">

        <nav class="navbar navbar-light">
            <div class="container-fluid">
                <em id="icono-barra" class="fa-solid fa-bars" onclick="moveSidebar(oppened)"></em>                
                
            </div>
        </nav>


        <!--Sidebar-->
        <div id="barra-lateral" class="max-vw-75">
            <div class="sidebar-header" id="barra-lateral-header">
                <h2>PUMACTIVATE</h2>
                <hr/>
            </div>            
            <div id="list-nav" class="container">

                <a href="#!perfil">
                    <div class="row p-3">
                        <div class="col-4">
                            <em class="fa-solid fa-user-pen"></em>
                        </div>
                        <div class="col-8">
                            Perfil
                        </div>
                    </div>
                </a>

                <%
                    List<Map<String,String>> menu = (List<Map<String,String>>)request.getAttribute("menu");
                    if(menu != null)
                    {
                        for(Map<String,String> opcion : menu)
                        {
                            StringBuilder opcionRender = new StringBuilder();
                            opcionRender.append("<a href='")
                            .append(opcion.get("url"))
                            .append("' >")
                            .append("\n")
                            .append("<div class='row p-3'>")
                                .append("\n")
                                .append("<div class='col-4'>")
                                    .append("<em class='fa-solid fa-")
                                    .append(opcion.get("icon"))
                                    .append("'></em>")
                                    .append("\n")
                                .append("</div>")
                                .append("<div class='col-8'>")
                                    .append("\n")
                                    .append(opcion.get("opcion"))
                                    .append("\n")
                                .append("</div>")
                                .append("\n")
                            .append("</div>");
                            out.println(opcionRender);
                        }
                    }
                        
                %>
               
                <a href="logout">
                    <div class="row p-3">
                        <div class="col-4">
                            <em class="fa-solid fa-right-from-bracket"></em>
                        </div>
                        <div class="col-8">
                            Cerrar sesión
                        </div>
                    </div>                
                </a>
            </div>
        </div>
    
        <div id="contenido-principal" class="container px-3 py-5">
            <div class="shadow py-5 px-2 rounded" id="contenido">
                <ng-view></ng-view>
            </div>
            
        </div>

        
          <div class="modal fade" id="usuario-card" tabindex="-1" aria-labelledby="credencial de usuario" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h2 class="modal-title" id="modalUsuarios"></h2>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 col-12">
                                <div id="img-container" class="">
                                    <div id="imagen" class="my-3" style="background-image: url('{{usuario.data.imagen}}');">
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7 col-12">
                                <div class="container">
                                    <div class="row pb-3">
                                        <div class="col-12">
                                            <h3>{{usuario.data.nombre + " " + usuario.data.apellidos}}</h3>
                                        </div>
                                        <div class="col-12">
                                            <h5>{{usuario.data.rol}}</h5>
                                        </div>
                                    </div>

                                    <div class="row pb-3 justify-content-start">
    
                                        <div class="col-12 py-1">
                                            {{usuario.data.nombreUsuario}}
                                        </div>


                                        <div class="col-12 py-1">
                                            {{usuario.data.email}}
                                        </div>

                                        <div class="col-md-5 col-12">
                                            Último acceso:
                                        </div>
                                        <div class="col-md-6 col-12">
                                            {{usuario.data.ultimoLogin}}
                                        </div>
                                        <div class="row pb-3"></div>
                                    </div>


                                    <div class="row pb-3">
                                        <div class="col-md-4 col-12 py-1">
                                            <button class="btn btn-success w-100">
                                                Editar
                                            </button>
                                        </div>

                                        <div class="col-md-1 d-none d-lg-block"></div>
                                        <div class="col-md-4 col-12 py-1">
                                            <button class="btn btn-danger w-100">
                                                Eliminar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button>
                </div>
              </div>
            </div>
          </div>



          <div class="modal fade" id="modal-mensaje" tabindex="-1" aria-labelledby="Mensajes de respuesta" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h2 class="modal-title" id="modalMensajes-titulo"></h2>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="modalMensajes-mensaje">
                        
                    </p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button>
                </div>
              </div>
            </div>
          </div>

    </body>

    </html>
