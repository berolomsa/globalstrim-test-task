<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>
<body>

<div class="container">
    <h2>User Registration Form</h2>
    <form role="form">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" placeholder="Name">
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="text" class="form-control" id="phone" placeholder="Phone">
        </div>
        <div class="form-group">
            <label for="birthdate">BirthDate:</label>
            <div class='input-group date' id='datetimepicker1'>
                <input id="birthdate" type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
            </div>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" class="form-control" id="address" placeholder="Address">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
</div>
<script type="text/javascript">
    $(function() {
        $( "#birthdate" ).datepicker();
    });
//
//    $("#myform").submit(function() {
//        $(this).unbind('submit');
//        $.ajax({
//            url: '/rest/user',
//            method: 'POST',
//            data: 'id=',
//            success: function(returnData){
//                alert("bla");
//            }
//        });
//        return false;
//    });

</script>
</body>
</html>
