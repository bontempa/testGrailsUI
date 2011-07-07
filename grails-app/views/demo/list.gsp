<%@ page import="testgrailsui.Demo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'demo.label', default: 'Demo')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <gui:resources components="['dataTable','datePicker']"/>
</head>

<body>
<a href="#list-demo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-demo" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="age" title="${message(code: 'demo.age.label', default: 'Age')}"/>

            <g:sortableColumn property="birthDate"
                              title="${message(code: 'demo.birthDate.label', default: 'Birth Date')}"/>

            <g:sortableColumn property="favoriteColors"
                              title="${message(code: 'demo.favoriteColors.label', default: 'Favorite Colors')}"/>

            <g:sortableColumn property="gender" title="${message(code: 'demo.gender.label', default: 'Gender')}"/>

            <g:sortableColumn property="isDumb" title="${message(code: 'demo.isDumb.label', default: 'Is Dumb')}"/>

            <g:sortableColumn property="name" title="${message(code: 'demo.name.label', default: 'Name')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${demoInstanceList}" status="i" var="demoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${demoInstance.id}">${fieldValue(bean: demoInstance, field: "age")}</g:link></td>

                <td><g:formatDate date="${demoInstance.birthDate}"/></td>

                <td>${fieldValue(bean: demoInstance, field: "favoriteColors")}</td>

                <td>${fieldValue(bean: demoInstance, field: "gender")}</td>

                <td><g:formatBoolean boolean="${demoInstance.isDumb}"/></td>

                <td>${fieldValue(bean: demoInstance, field: "name")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${demoInstanceTotal}"/>
    </div>
</div>


<div class="yui-skin-sam">

<gui:dataTable
        draggableColumns="true"
        columnDefs="[
            [id:'Id', sortable:true, resizeable: true],
            [name:'Name', sortable:true, resizeable: true],
            [birthDate:'Birth Date', formatter:'date', sortable:true, resizeable: true],
            [age:'Age', formatter:'number', sortable:true, resizeable: true],
        ]"
        sortedBy='name'

        controller="demo" action="dataTableDataAsJSON"
        caption="click on a row, and it will expand"
        paginate="true"
        rowExpansion="false"
        rowsPerPage="40"
        totalRecordsKey="meTotalRecs"
    />

     <gui:dataTable
            caption="Click row to navigate"
            draggableColumns="true"
            id="dt_2"
            columnDefs="[
                [key:'id', sortable:true, resizeable: true, label:'ID'],
                [key:'name', sortable:true, resizeable: true, label:'Name'],
                [key:'birthDate', sortable:true, resizeable: true, label: 'Birth Date'],
                [key:'age', sortable:true, resizeable: true, label: 'Age'],
                [key:'netWorth', sortable:true, resizeable: true, label: 'Net Worth']
            ]"
            paginatorConfig="[
                template:'{PreviousPageLink} {PageLinks} {NextPageLink} {CurrentPageReport}',
                pageReportTemplate:'{totalRecords} total records'
            ]"
            controller="demo" action="nonStandardDataTableDataAsJSON"
            params="[maxAge:52]"
            resultsList="myResults"
            rowClickNavigation="true"
            collapseOnExpansionClick="true"
            rowsPerPage="3"
    />

    </div>

<div class="markup">
    <label for="filter">Filter by state:</label> <input type="text" id="filter" value="">

    <div id="tbl"></div>
</div>

</body>
</html>
