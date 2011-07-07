<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
        <gui:resources components="['dataTable','datePicker']"/>
    		<g:javascript library="application"/>
        <g:javascript library="yui" />
         <r:require module="yui-calendar,yui-datatable"/>
<!--Include YUI Loader: -->
<script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yuiloader/yuiloader-min.js"></script>

<!--Use YUI Loader to bring in your other dependencies: -->
<script type="text/javascript">
// Instantiate and configure YUI Loader:
(function() {
    var loader = new YAHOO.util.YUILoader({
        base: "",
        require: ["fonts","yuiloader"],
        loadOptional: false,
        combine: true,
        filter: "MIN",
        allowRollup: true,
        onSuccess: function() {
            //you can make use of all requested YUI modules
            //here.
        }
    });

// Load the files using the insert() method.
loader.insert();
})();
</script>

    <script>

    var callback = {
        success: function(request) {
            alert('success');
        },
        failure: function(request) {
            alert('failure');
        }
    };

    YAHOO.example.Data = {
        areacodes: [
            {areacode: "201", state: "New Jersey"},
            {areacode: "202", state: "Washington, DC"},
            {areacode: "203", state: "Connecticut"}
        ]
    }

        YAHOO.util.Event.addListener(window, "load", function() {
    var Ex = YAHOO.namespace('example');

    Ex.dataSource = new YAHOO.util.DataSource(YAHOO.example.Data.areacodes,{
        responseType : YAHOO.util.DataSource.TYPE_JSARRAY,
        responseSchema : {
            fields : ['areacode','state']
        },
        doBeforeCallback : function (req,raw,res,cb) {
            // This is the filter function
            var data     = res.results || [],
                filtered = [],
                i,l;

            if (req) {
                req = req.toLowerCase();
                for (i = 0, l = data.length; i < l; ++i) {
                    if (!data[i].state.toLowerCase().indexOf(req)) {
                        filtered.push(data[i]);
                    }
                }
                res.results = filtered;
            }

            return res;
        }
    });

    Ex.cols = [
        { key: 'areacode', sortable: true },
        { key: 'state', sortable: true }
    ];

    Ex.paginator = new YAHOO.widget.Paginator({
        rowsPerPage   : 10,
        pageLinks     : 5
    });

    Ex.conf = {
        paginator : Ex.paginator,
        sortedBy: {key:'areacode', dir:YAHOO.widget.DataTable.CLASS_ASC}
    };

    Ex.dataTable = new YAHOO.widget.DataTable('tbl',Ex.cols,Ex.dataSource,Ex.conf);

    Ex.filterTimeout = null;
    Ex.updateFilter  = function () {
        // Reset timeout
        Ex.filterTimeout = null;

        // Reset sort
        var state = Ex.dataTable.getState();
            state.sortedBy = {key:'areacode', dir:YAHOO.widget.DataTable.CLASS_ASC};

        // Get filtered data
        Ex.dataSource.sendRequest(YAHOO.util.Dom.get('filter').value,{
            success : Ex.dataTable.onDataReturnInitializeTable,
            failure : Ex.dataTable.onDataReturnInitializeTable,
            scope   : Ex.dataTable,
            argument: state
        });
    };

    YAHOO.util.Event.on('filter','keyup',function (e) {
        clearTimeout(Ex.filterTimeout);
        setTimeout(Ex.updateFilter,600);
    });
});

</script>
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

	</body>
</html>