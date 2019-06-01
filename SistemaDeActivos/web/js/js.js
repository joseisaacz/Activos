jQuery.noConflict()(function ($) {
    $(document).ready(function () {
            
        $("#dependencia").change(function () {
            
            var val = $(this).val();
            
             
            if (val ===1) {
               
                $("#funcionarios").html(
                 
                        
                        "<option value='002'>Maria</option>"+
                            
                       
                        
                        "<option value='003'>Pedro</option>"+
                            
                       
                        
                        "<option value='004'>Mario</option>"+
                            
                       
                        
                        "<option value='005'>Ana</option>"
                                        
                        
                            
                    );
            } 
            
            if (val ===2) {
               
                $("#funcionarios").html(
                 
                        
                        "<option value='001'>Juan</option>"
                                        
                        
                            
                    );
            } 
            
            if (val ===3) {
               
                $("#funcionarios").html(
                      
                    );
            } 
            
        
        });
            
    });
    });
    
                
            