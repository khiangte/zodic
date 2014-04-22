function key_down(event){
    if (event.keyCode == 13){
        document.getElementById('search').click();
    }
    else{
        jQuery.ajax({
            data : {
                key_word : jQuery("#key_word").val()
            },
            url : '/autocomplete',
            success : function(def) {
                jQuery("#key_word").autocomplete({
                source: def.sugg
            });
            }            
        });
    }
}

function help(){
    var helps = "<br/><br/><h3><center>Play the following audio clips for pronunciation help.</center></h3><br/>";
    helps = helps + "<table width=400 align = center ><tr><td width = 100><h4><i>sáng</i></h4></td><td>";
    helps = helps + "<audio controls><source src='Undiscovered.mp3' type='audio/mpeg'> ";
    helps = helps + "Your browser does not support this audio format.";
    helps = helps + "</audio></td></tr>"

    helps = helps + "<tr><td width = 100><h4><i>säng</i></h4></td><td>";
    helps = helps + "<audio controls><source src='Undiscovered.mp3' type='audio/mpeg'> ";
    helps = helps + "Your browser does not support this audio format.";
    helps = helps + "</audio></td></tr>"

    helps = helps + "<tr><td width = 100><h4><i>sàng</i></h4></td><td>";
    helps = helps + "<audio controls><source src='Undiscovered.mp3' type='audio/mpeg'> ";
    helps = helps + "Your browser does not support this audio format.";
    helps = helps + "</audio></td></tr>"

    helps = helps + "<tr><td width = 100><h4><i>sâng</i></h4></td><td>";
    helps = helps + "<audio controls><source src='Undiscovered.mp3' type='audio/mpeg'> ";
    helps = helps + "Your browser does not support this audio format.";
    helps = helps + "</audio></td></tr>"

    helps = helps + "<tr><td width = 100><h4><i>sang</i></h4></td><td>";
    helps = helps + "<audio controls><source src='Undiscovered.mp3' type='audio/mpeg'> ";
    helps = helps + "Your browser does not support this audio format.";
    helps = helps + "</audio></td></tr>"

    helps = helps + "</table>"
    jQuery("#def_div").html(helps);
}

function searchWord(){
    jQuery.ajax({
            data : {
                key_word : jQuery("#key_word").val()
            },
            url : '/search',
            success : function(def) {
                var defs = "";
                for(var i = 0; i < def.found.size(); i++)
                {
                    defs = defs + "<br/><h3>" + def.found[i].word.thumal + "</h3> <i> " + def.found[i].word.pos + "</i>";
                    defs = defs + "<p>" + def.found[i].word.meaning;
                    defs = defs + "<p>Ex: " + def.found[i].word.example;
                    defs = defs + "<br/>";
                }
                if (defs === "")
                    defs = "<br/><center>Word not found, <a href = '#' onclick = 'request()'>request definition</a></center>";
                jQuery("#def_div").html(defs);
            },
            error: function() {
                alert('Something went wrong. Please report this problem.');
            }
        });
}

function request(){
    jQuery.ajax({
        data : {
            key_word : jQuery("#key_word").val()
        },
        url: '/request',
        success : function(result){
            if(result.success){
                jQuery("#def_div").html("<center>" + jQuery("#key_word").val() + " has been requested.</center>");        
            }else{
                jQuery("#def_div").html("<center>" + jQuery("#key_word").val() + " has already been requested.</center>"); 
            }
        },
        error : function() {
             alert('Something went wrong. Please report this problem.');
        }
    });
    
}