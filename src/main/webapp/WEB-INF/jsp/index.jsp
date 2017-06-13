<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ATM Simulation</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" />
    </head>
    <body>
        <div class="container">
            <header class="jumbotron hero-spacer">
                <h1>ATM Simulation</h1>
            </header>
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <h3>Actions</h3>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <div class="caption">
                        <h3>Initialize the system</h3>
                        <p>Add money to the ATM</p>
                        <div class="text-right">
                            <a href="transaction/initialization" class="btn btn-primary">Start</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <div class="caption">
                        <h3>Withdraw money</h3>
                        <p>Enter an amount and withdraw money from the ATM</p>
                        <div class="text-right">
                            <a href="transaction/withdrawal" class="btn btn-primary">Start</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
