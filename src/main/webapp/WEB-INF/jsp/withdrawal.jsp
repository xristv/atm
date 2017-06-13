<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                <p>Withdraw a desired amount of money</p>
            </header>
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <h3>Withdrawal</h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-md-12 col-sm-12 hero-feature">
                    <form class="form-horizontal" action="<c:url value='/transaction/withdraw'/>"> 
                        <div class="form-group">
                            <label for="amount" class="col-sm-2 control-label">Amount</label>
                            <div class="col-sm-3">
                                <input type="amount" class="form-control" id="amount" name="amount" placeholder="Amount" type="number">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                    <c:if test="${not empty error}" >
                        <p class="bg-danger text-left error">${error}</p>
                    </c:if>
                    <c:if test="${not empty money && fn:length(money)>0}" >
                        <div class="bg-success text-left error">Transaction successful! Here is your money: </p>
                            <ul>
                                <c:forEach var="m" items="${money}">
                                    <li>${m.value}x$${m.key}</li>
                                    </c:forEach>
                            </ul>
                            <hr>
                            <p>Available money: </p>
                            <ul>
                                <c:forEach var="m" items="${availableMoney}">
                                    <li>${m.amount}x$${m.value}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
