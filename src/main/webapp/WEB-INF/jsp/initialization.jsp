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
                <p>Initialize the system by giving the amount of money below</p>
            </header>
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <h3>Initialization</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-12 col-sm-12 hero-feature">
                    <form class="form-horizontal" action="<c:url value='/transaction/initialize'/>" method="POST"> 
                        <div class="form-group">
                            <label for="amount20" class="col-sm-2 control-label">$20</label>
                            <div class="col-sm-3">
                                <input type="amount20" class="form-control" id="amount20" name ="amount20" placeholder="$20 amount" type="number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="amount50" class="col-sm-2 control-label">$50</label>
                            <div class="col-sm-3">
                                <input type="amount50" class="form-control" id="amount50" name="amount50" placeholder="$50 amount" type="number">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
