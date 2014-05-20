function key_down(event){
    if (event.keyCode == 13){
        document.getElementById('search').click();
    }
    else{
        jQuery.ajax({
            data : {
                key_word : jQuery("#key_word").val()
            },
            url : '/autocomplete_mizo_english',
            success : function(def) {
                jQuery("#key_word").autocomplete({
                source: def.sugg
            });
            }            
        });
    }
}

function searchWord(){
    jQuery.ajax({
            data : {
                key_word : jQuery("#key_word").val()
            },
            url : '/search_mizo_english',
            success : function(def) {
                var defs = "";
                for(var i = 0; i < def.found.size(); i++)
                {
                    defs = defs + "<br/><h3>" + def.found[i].mizoenglish.word + "</h3> <i> ";
                    defs = defs + "<p>" + def.found[i].mizoenglish.definition;
                }
                if (defs === "")
                    defs = "<br/><center><b><i>\""+jQuery("#key_word").val() + "\"</i></b> hi JF Dictionary-ah a awm lo tlat!</center>";
                jQuery("#def_div").html(defs);
            },
            error: function() {
                alert('Something went wrong. Please report this problem.');
            }
        });
}