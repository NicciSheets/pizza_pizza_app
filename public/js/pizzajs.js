function valthis() {
var checkBoxes = document.getElementsByClassName( 'topping_choices' );
var isChecked = false;
    for (var i = 0; i < checkBoxes.length; i++) {
        if ( checkBoxes[i].checked ) {
            isChecked = true;
        }
    }
    if ( isChecked ) {
        
        } else {
            alert( 'Please check at least one checkbox!' );
        }   
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