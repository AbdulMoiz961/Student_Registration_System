function admin()
{
    var roll=document.getElementById("roll").value;
    var pass=document.getElementById("pass").value;

    if(roll == 'admin' && pass == 'admin123')
    {
        window.open("./index.html");;
        
    }

    else if (roll != 'admin' || pass != 'admin123')
    {
        alert("You are not authorized");
    }

}
