<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login ajax</title>

        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="jquery/jquery-3.6.4.js" type="text/javascript"></script>
        <script src="jquery/jquery.validate.min.js" type="text/javascript"></script>
        <style type="text/css">
            body,td,th{
                color: #000000;
            }

            body{
                background-color: #F0F0F0;
            }

            .style1
            {
                font-family: arial;
                font-size: 14px;
                padding: 12px;
                line-height: 25px;
                border-radius: 4px;
                text-decoration: none;

            }

            .style2
            {
                font-family: arial;
                font-size: 17px;
                padding: 12px;
                line-height: 25px;
                border-radius: 4px;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <table width="100%" height="100%" border="0" cellpadding="0" align="center">
                <tr>
                    <td align="center" valign="middle">
                        <table class="table-bordered" width="350" border="0" cellpadding="3"cellspacing="3" bgcolor="#FFFFFF">
                            <Form name="frm-login" id="frm-login">
                                <tr>
                                    <td height="25" colspan="2" align="left" valign="middle" bgcolor="#FF9900" class="style2">
                                        <div align="center">
                                            <strong>Login</strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                <div id="err" style="color:red">
                                </div>
                                </tr>
                                <tr>
                                    <td width="118px" align="left" valign="middle" class="style1">
                                        Username
                                    </td>
                                    <td width="118px" align="left" valign="middle" class="style1">
                                        <input type="text" class="form-control" size="10px" id="username" placeholder="Username" name="username">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="118px" align="left" valign="middle" class="style1">
                                        Password
                                    </td>
                                    <td width="118px" align="left" valign="middle" class="style1">
                                        <input type="password" class="form-control" size="10px" id="password" placeholder="Password" name="password">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" valign="middle" class="style1" align="right">
                                        <button type="button" class="btn btn-primary" onclick="login()">Sign In</button>
                                        <button type="button" class="btn btn-warning" onclick="reset()">Reset</button>
                                    </td>

                                </tr>    
                            </Form>   
                        </table>  
                    </td>   
                </tr>  
            </table> 
        </div>

        <script>
            function login() {

                var data = $("#frm-login").serialize();
                $.ajax({
                    type: 'POST',
                    url: "validade.jsp",
                    data: data,
                    dataType: 'JSON',
                    success: function (data, textStatus, jqXHR) {

                        if (data[0].msg === '1') {
                            window.location.replace("home.jsp");
                        } else {
                            $("#err").hide().html("Username or password invalid").fadeIn("slow");
                        }
                    }});
            }
        </script>    
    </body>
</html>
