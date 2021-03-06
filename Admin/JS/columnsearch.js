﻿<script type="text/javascript" charset="utf-8">
    var asInitVals = new Array();
     
    $(document).ready(function() {
 
        /*
         * Support functions to provide a little bit of 'user friendlyness' to the textboxes in
         * the footer
         */
        $("tfoot input").each( function (i) {
            asInitVals[i] = this.value;
        } );
        $("tfoot input").focus( function () {
            if ( this.className == "search_init" )
            {
                this.className = "";
                this.value = "";
            }
        } );
        $("tfoot input").blur( function (i) {
            if ( this.value == "" )
            {
                this.className = "search_init";
                this.value = asInitVals[$("tfoot input").index(this)];
            }
        } );
 
        var oTable = $('#example').dataTable( {
            "oLanguage": {
                "sSearch": "Search all columns:"
            },
            "bStateSave": true,
            "fnInitComplete": function() {
                var oSettings = $('#example').dataTable().fnSettings();
                for ( var i=0 ; i<oSettings.aoPreSearchCols.length ; i++ ){
                    if(oSettings.aoPreSearchCols[i].sSearch.length>0){
                        $("tfoot input")[i].value = oSettings.aoPreSearchCols[i].sSearch;
                        $("tfoot input")[i].className = "";
                    }
                }
            }
        } );
         
        $("tfoot input").keyup( function () {
            /* Filter on the column (the index) of this element */
            oTable.fnFilter( this.value, $("tfoot input").index(this) );
        } );
         
    } );
</script>
