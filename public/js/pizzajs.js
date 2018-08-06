function val(){
var chks = document.getElementsByName('toppings[]');
var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
    alert("Please select at least one topping.");
    return false;
}
return true;
}


function info(x) {
    if (x==0)
        document.getElementById('delivery').style.display='block';
    else
        document.getElementById('delivery').style.display='none';
    return;
    }

function infoToo(x) {
    if (x==0)
        document.getElementById('location').style.display='block';
    else
        document.getElementById('location').style.display='none';
    return;
}