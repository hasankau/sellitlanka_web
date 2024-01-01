
var b;
var vfb= true, emb, pwb ;
var err = '<div class="ui-state-error ui-corner-all"><p style="text-align: left"><span class="ui-icon ui-icon-alert" style="float: left; margin: auto; margin-right: .3em;"></span><span >';
var errcol = '#fddfdf';
var errdiv = $(".err");

function validateEmail() {
    var y = document.forms["form2"]["email"].value;
    var atpos = y.indexOf("@");
    var dotpos = y.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= y.length || y === null || y === "") {
        
        document.getElementById('email').style.backgroundColor = errcol;
        document.getElementById('errmsg').innerHTML = err+'Please enter a valid email <strong>eg:- user@example.com</strong></span></p></div>';
        errdiv.css('display', 'block');
        emb = false;
    } else {
        emb = true;
        
    }
    return emb;
}

function checkPword(x) {
    var pw1 = document.getElementById('password').value;
    if (pw1 === x) {
        document.getElementById('confirmpassword').style.color = 'green';
        document.getElementById('password').style.color = 'green';
        document.getElementById('confirmpassword').style.backgroundColor = '#f0f0f0';

    } else {
        document.getElementById('confirmpassword').style.color = 'red';
        document.getElementById('password').style.color = 'red';
    }
}

function paswordMatch() {
    var pw1 = document.getElementById('password').value;
    var pw2 = document.getElementById('confirm').value;
    if (pw1 !== pw2) {
        pwb = false;
        document.getElementById('errmsg').innerHTML = err+"Password Miss-Matched</span></p></div>";
        document.getElementById('confirm').style.backgroundColor = errcol;
        errdiv.css('display', 'block');
    }else{
        pwb = true;
    }
    return pwb;
    
}

function checkForm(){
    var inputs = document.getElementsByClassName('textField');
    for (var i=0; i<inputs.length; i++){
        if(inputs[i].value===null||inputs[i].value===''){
            inputs[i].style.backgroundColor = errcol;
            document.getElementById('errmsg').innerHTML = err+'Please fill in all the fields</span></p></div>';
            errdiv.css('display', 'block');
            vfb = false;
        }
    }
    return vfb;
}

function checkAll(){
    if(vfb&&emb&&pwb){
        b = true;
    }else{
        b = false;
    }
    return b;
}

function setEmailBackground(){
    var em = document.getElementById('email2');
    if(em.value!==null|em.value!==""){
        em.style.backgroundColor='white';
    }else if(em.value===""){
        em.style.backgroundColor='grey';
    }
    
}
function setPassBackground(){
    var pas = document.getElementById('password2');
    if(pas.value!==null|pas.value!==""){
        pas.style.backgroundColor='white';
    }else{
        pas.style.backgroundColor="grey";
    }
}
