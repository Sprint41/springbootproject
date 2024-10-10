<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Add ToDo Item</title>

    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        /* Center the form using flexbox */
        body, html {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f8ff;
        }

        .container {
            width: 100%;
            max-width: 600px;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
          
            margin-top: 50px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            
        }

        .form-group label {
            font-weight: bold;
        }

        button {
            width: 100%;
        }
    </style>
</head>

<body>

    <div class="container bg-light">
        <h1 class="p-3"> Add a ToDo Item </h1>

        <form:form action="/saveToDoItem" method="post" modelAttribute="todo">
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3" for="title">Title</label>
                    <div class="col-md-9">
                        <form:input type="text" path="title" id="title" class="form-control" required="required" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3" for="date">Date</label>
                    <div class="col-md-9">
                        <form:input type="date" path="date" id="date" class="form-control" required="required" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3" for="status">Status</label>
                    <div class="col-md-9">
                        <form:input type="text" path="status" id="status" class="form-control" value="Incomplete" />
                    </div>
                </div>
            </div>

            <div class="row p-2">
                <div class="col-md-12">
                    <button type="submit" value="Register" class="btn btn-success btn-block">Save</button>
                </div>
            </div>
        </form:form>
    </div>

    <script th:inline="javascript">
        window.onload = function() {
            var msg = "${message}";
            console.log(msg);
            if (msg == "Save Failure") {
                Command: toastr["error"]("Something went wrong with the save.")
            }

            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        }
    </script>

</body>

</html>
