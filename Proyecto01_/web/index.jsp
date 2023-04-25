<%-- 
    Document   : index
    Created on : 25 abr. 2023, 10:17:56
    Author     : Instructor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Proyecto 1</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="">Inicio</a>
                        </li>
                </div>
            </div>
        </nav>
        <%
            double promedio = 0;
            //pension $/
            double pension = 0;
            double descuento = 0;
            double nueva_pension = 0;
            double descuento_total = 0;

            if (request.getParameter("promedio") == null) {
                descuento = 0;
                promedio = 0;
            } else {
                promedio = Double.parseDouble(request.getParameter("promedio"));
                pension = Double.parseDouble(request.getParameter("pension"));
            }

            if (promedio < 14) {
                descuento = 0;
            } else if ((promedio >= 14) && (promedio < 16)) {
                descuento = 0.10;
            } else if ((promedio >= 16) && (promedio < 18)) {
                descuento = 0.12;
            } else if ((promedio >= 18) && (promedio <= 20)) {
                descuento = 0.15;
            }
            descuento_total = pension * descuento;
            nueva_pension = pension - descuento_total;
        %>
        <div class="container">
            <div class="row">                    
                <h1>Proyecto 1</h1>

                <div class="col-6">
                    <h5>Datos</h5>
                    <form method="POST">
                        <div class="mb-3">
                            <label class="form-label">Categoria</label>
                            <select name="pension" class="form-control select_2">
                                <option value="550">A (S/550)</option>
                                <option value="500">B (S/500)</option>
                                <option value="460">C (S/460)</option>
                                <option value="400">D (S/400)</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Promedio</label>
                            <input type="text" class="form-control" name="promedio">
                        </div>

                        <button type="submit" class="btn btn-dark"> <i class="fa-sharp fa-solid fa-circle-check" style="color:green;"></i> Calcular</button>
                    </form>
                </div>
                <div class="col-6">
                    <h5>Resultados</h5>
                    <form>
                        <div class="row">
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Pension Actual</label>
                                    <input type="text" class="form-control" value="<%=pension%>">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Descuento</label>
                                    <input type="text" class="form-control" value="<%=descuento * 100%>%">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label"> Nueva Pension</label>
                                    <input type="text" class="form-control" value="<%=nueva_pension%>">
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>   
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $('.select_2').select2();
            });
        </script>
    </body>
</html>
