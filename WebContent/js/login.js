$(function() {
    $('#switch_qlogin').click(function() {
        $('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_bottom').animate({
            left: '0px',
            width: '70px'
        });
        $('#qlogin').css('display', 'none');
        $('#web_qr_login').css('display', 'block');
    });
    $('#switch_login').click(function() {
        $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_bottom').animate({
            left: '154px',
            width: '70px'
        });
        $('#qlogin').css('display', 'block');
        $('#web_qr_login').css('display', 'none');
    });
    if (getParam("a") == '0') {
        $('#switch_login').trigger('click');
    }
});

function logintab() {
    scrollTo(0);
    $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
    $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
    $('#switch_bottom').animate({
        left: '154px',
        width: '96px'
    });
    $('#qlogin').css('display', 'none');
    $('#web_qr_login').css('display', 'block');
}

function getParam(pname) {
    var params = location.search.substr(1);
    var ArrParam = params.split('&');
    if (ArrParam.length == 1) {
        return params.split('=')[1];
    } else {
        for (var i = 0; i < ArrParam.length; i++) {
            if (ArrParam[i].split('=')[0] == pname) {
                return ArrParam[i].split('=')[1];
            }
        }
    }
}

/*
 * 注册校验
*/
re = '';
pwdmin = 6;
$(document).ready(function() {
    $('#reg').click(function() {
        if ($('#user').val() == "") {
            $('#user').focus().css({
                border: "1px solid red",
                boxShadow: "0 0 2px red"
            });
            $('#userCue').html("<font color='red'><b>×手机号不能为空</b></font>");
            return false;
        }
        if ($('#user').val().length != 11) {
            $('#user').focus().css({
                border: "1px solid red",
                boxShadow: "0 0 2px red"
            });
            $('#userCue').html("<font color='red'><b>×手机号为11个字符</b></font>");
            return false;
        }
        if ($('#passwd').val().length < pwdmin) {
            $('#passwd').focus();
            $('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
            return false;
        }
        if ($('#passwd2').val() != $('#passwd').val()) {
            $('#passwd2').focus();
            $('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
            return false;
        }
        if ($('#username').val() == "") {
            $('#username').focus();
            $('#userCue').html("<font color='red'><b>×用户昵称不能为空！</b></font>");
            return false;
        }
        $.ajax({
      	  type: 'POST',
      	  url: "Register.do",
      	  data: "uid=" + $("#user").val() + "&upwd=" +  $('#passwd').val() + "&uname=" + $('#username').val(),
      	  dataType: 'html',
            success: function() {
                $('#user').focus().css({
                    border: "1px solid green",
                    boxShadow: "0 0 2px green"
                });
                $("#userCue").html("<font color='green'><b>注册成功，请登录！</b></font>");
            },
      	  error: function(){
                $('#user').focus().css({
                    border: "1px solid red",
                    boxShadow: "0 0 2px red"
                });
                $("#userCue").html("<font color='red'><b>x注册失败，该用户已经注册！</b></font>");
                return false;
      	  }
      	});
    });
});