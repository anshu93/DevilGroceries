$(document).ready(function(){
    $(".nl-field ul").change(function(){
        alert("hcada");
        var id_value_string = $(".nl-dd-checked").val();
        if (id_value_string == "") { 
                // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
                $("select#order_dorm_id option").remove();
                var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                $(row).appendTo("select#order_dorm_id");
            }
        else {
                // Send the request and update sub category dropdown 
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/dorm/for_dormid/' + id_value_string,
                timeout: 2000,
                type: 'GET',
                error: function(XMLHttpRequest, errorTextStatus, error){
                    alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                },
                success: function(data){                    
                        // Clear all options from sub category select 
                        $("select#order_dorm_id option").remove();
                        //put in a empty default line
                        var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                        $(row).appendTo("select#order_dorm_id");                        
                        // Fill sub category select 
                        $.each(data, function(i, j){
                            row = "<option value=\"" + j.id + "\">" + j.dorm_name + "</option>";   
                            $(row).appendTo("select#order_dorm_id");                     
                        });            
                    }
                });
            };
        });
});