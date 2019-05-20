$(document).ready(function(){

    $('#inputPassword').keyup(function (event) {
        if (event.keyCode == 13){
            $('#signup').click();
        }
    });

    $('#signup').click(function(){
        var email = $('#email').val();
        var password = $('#inputPassword').val();
        var branch = $('#branch').val();
        var course = $('#course').val();
        var year = $('#year').val();
        var phone = $('#phone').val();
        var name = $('#name').val();
        $.post("/signup",{email:email,password:password,phone:phone,year:year,course:course,branch:branch,name:name},function(data,status){
            console.log(data);

            if(data.status == '1'){
                alert("Successfully Signed Up !!\nRedirecting You to Login Page...");
                setTimeout(function(){
                    window.location.href = '/login';
                },1500);
            }
            else{
                alert("Error While Signup");
            }
        });
    });
});