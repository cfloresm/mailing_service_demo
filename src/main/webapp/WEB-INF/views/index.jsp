<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Spring Attack</title>

<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.2.1/pure-min.css">
<link rel="stylesheet" href="css/application.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript" src="js/ajaxRequest.js"></script>
<script type="text/javascript" src="js/polling.js"></script>
<body>
  <div class="pure-g-r">
    <div class="pure-u-1-6">
    </div>

    <div class="pure-u-2-3">
      <div class="header">
        <h1>Spring Attack!</h1>
        <h4>Receive pictures of Spring in your email.</h4>
      </div>

      <div class="content">
        <form:form class="pure-form-stacked signup" method="post" action="/mailing" modelAttribute="signup">
          <form:input path="email" id="email" type="email" placeholder="Email" />

          <button type="submit" class="pure-button pure-button-primary">Submit</button>
        </form:form>
      </div>
    </div>
  </div>
</body>
</html>
