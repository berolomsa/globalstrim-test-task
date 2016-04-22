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
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="main.css">
</head>
<body>

<div class="col-sm-offset-3 col-sm-6 container registration">
    <h2 id="header" >User Registration Form</h2>
        <form id="form" action="" novalidate="novalidate" role="form">
            <div class="form-group">
                <label for="name">Name:</label>
                <input  type="text" class="name form-control" name="name" id="name" placeholder="Name">
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" class="phone form-control" name="phone" id="phone" placeholder="Phone">
            </div>
            <div class="form-group">
                <label for="birthdate">BirthDate:</label>
                <div class='date' id='datetimepicker1'>
                    <input id="birthdate" type='text' name="birthdate" class="birthdate form-control" />
                </div>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="address form-control" name="address" id="address" placeholder="Address">
            </div>
            <button id="submit" type="submit" class="btn btn-default">Submit</button>

        </form>
</div>

<div class="profile container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >


            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">User Profile</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3 col-lg-3 " align="center">
                            <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> </div>
                        <div class=" col-md-9 col-lg-9 ">
                            <form id="editForm" action="" class="table table-user-information">

                                <input type="text" class="form-control" name="idEdit" id="idEdit" style="display: none;">
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="nameEdit" id="nameEdit" placeholder="Name">
                                        </div></td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="phoneEdit" id="phoneEdit" placeholder="Phone">
                                        </div></td>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="birthdateEdit" id="birthdateEdit" placeholder="BirthDate">
                                        </div></td>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="addressEdit" id="addressEdit" placeholder="Phone">
                                        </div></td>
                                </tr>

                                <button id="edit" type="submit" class="btn btn-default">Edit</button>
                            </form>

                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        $( "#birthdate" ).datepicker();
    });
    $(function() {
        $( "#birthdateEdit" ).datepicker();
    });
    $(document).ready(function() {

        $(function() {
            // Setup form validation on the #register-form element
            $("#form").validate({

                // Specify the validation rules
                rules: {
                    name: "required",
                    phone: "required",
                    address: "required",
                    birthdate: "required"
                },

                // Specify the validation error messages
                messages: {
                    name: "Field is required",
                    phone: "Field is required",
                    address: "Field is required",
                    birthdate: "Field is required"
                },

                submitHandler: function(form) {
                    $(this).unbind('submit');
                    if($('#form').valid() == true){
                        $.ajax({
                            type: 'POST',
                            headers: {
                                'Accept': 'application/json',
                                'Content-Type': 'application/json'
                            },
                            contentType: 'application/json',
                            url: "/rest/user",
                            dataType: "json",
                            data: formToJSON(true),
                            success: function(data, textStatus, jqXHR){
                                $('.registration').css({"display" : "none"});
                                $('.profile').css({"display" : "initial"});
                                $('#idEdit').val(data.id);
                                $('#nameEdit').val(data.name);
                                $('#birthdateEdit').val(data.birthDate);
                                $('#addressEdit').val(data.address);
                                $('#phoneEdit').val(data.phoneNumber);

                            },
                            error: function(jqXHR, textStatus, errorThrown){
                                alert('Error During Registration ' + textStatus);
                            }
                        });

                    }
                    $('#form').validate().resetForm();
                    return false;
                }
            });

            $("#editForm").validate({

                // Specify the validation rules
                rules: {
                    nameEdit: "required",
                    phoneEdit: "required",
                    addressEdit: "required",
                    birthdateEdit: "required"
                },

                // Specify the validation error messages
                messages: {
                    nameEdit: "Field is required",
                    phoneEdit: "Field is required",
                    addressEdit: "Field is required",
                    birthdateEdit: "Field is required"
                },

                submitHandler: function(form) {
                    $(this).unbind('edit');
                    if($('#editForm').valid() == true){
                        $.ajax({
                            type: 'POST',
                            headers: {
                                'Accept': 'application/json',
                                'Content-Type': 'application/json'
                            },
                            contentType: 'application/json',
                            url: "/rest/user/update",
                            dataType: "json",
                            data: formToJSON(false),
                            success: function(data, textStatus, jqXHR){
                                $('#nameEdit').val(data.name);
                                $('#idEdit').val(data.id);
                                $('#birthdateEdit').val(data.birthDate);
                                $('#addressEdit').val(data.address);
                                $('#phoneEdit').val(data.phoneNumber);

                            },
                            error: function(jqXHR, textStatus, errorThrown){
                                alert('Error During Update ' + textStatus);
                            }
                        });

                    }
                    $('#editForm').validate().resetForm();
                    return false;
                }
            });

        });
    });

    function formToJSON(isCreate) {
        if (isCreate) {
            return JSON.stringify({
                "name": $('#name').val(),
                "address": $('#address').val(),
                "birthDate": $('#birthdate').val(),
                "phoneNumber": $('#phone').val()
            });
        } else {
            return JSON.stringify({
                "id": $('#idEdit').val(),
                "name": $('#nameEdit').val(),
                "address": $('#addressEdit').val(),
                "birthDate": $('#birthdateEdit').val(),
                "phoneNumber": $('#phoneEdit').val()
            });
        }
    }

</script>
</body>
</html>
