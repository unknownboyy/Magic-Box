$(document).ready(function(){

    $('#inputPassword').keyup(function (event) {
       if (event.keyCode == 13){
           $('#login').click();
       }
    });

    $('#login').click(function(){
        var email = $('#inputEmail').val();
        var password = $('#inputPassword').val();
        $.post("/login",{email:email,password:password},function(data,status){
            console.log(data);
            if(data.status == '1'){
                window.location.href='/dashboard';
            }
            else{
                alert("Wrong E-mail or Password");
            }
        });
    });
});