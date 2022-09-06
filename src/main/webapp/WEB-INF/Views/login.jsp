<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es" ng-app="loginApp">

    <head>
        <title>Administración Pumactivate</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <!-- Font Awesome JS -->
        <!--To consult all font awesome icons:
            https://fontawesome.com/v6/icons?m=free
        -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

        <script type="text/javascript" src="js/login/index.js"></script>
        <script type="text/javascript" src="js/tools/jquery-3.6.0.js"></script>
        <script type="text/javascript" src="js/tools/angular.js"></script>
        <script type="text/javascript" src="js/login/app.js"></script>
        <script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>

        <link rel="stylesheet" type="text/css" href="css/index/login.css">
        
    </head>

    <body onload="onloadBody()" ng-controller="login" class="content-login">
        <div class="container full-container-login bg-faded">
            <div class="row bg-faded">
                <div class="card text-center card-login" style="width: 22rem;">
                    <h1 class="card-title">Login</h1>
                    <div class="card-body">
                        <form>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-user"></i></span>
                                <input type="text" class="form-control" placeholder="Usuario" aria-label="Username"
                                    aria-describedby="addon-wrapping" ng-model="username">
                            </div>
                            <div class="input-group flex-nowrap">
                                <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-key"></i></span>
                                <input type="password" class="form-control" placeholder="Contraseña" aria-label="Password"
                                    aria-describedby="addon-wrapping" ng-model="password">
                            </div> 
                            <button ng-disabled="!(username && password)" type="button" class="btn btn-primary login-button" ng-click="logUser()">Enviar</button>                    
                            
                            <!-- <a href="#" class="card-link">Registro</a> -->
                            
                        </form> 
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="errorLogin" tabindex="-1" aria-labelledby="errorLoginLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="errorLoginLabel">Datos Incorrectos</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Las credenciales proporcionadas son incorrectas, favor de verificar.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
            

        
    </body>
</html>