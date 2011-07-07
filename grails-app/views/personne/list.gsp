<%@ page import="testgrailsui.Personne" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'personne.label', default: 'Personne')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-personne" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-personne" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="age" title="${message(code: 'personne.age.label', default: 'Age')}"/>

            <g:sortableColumn property="nom" title="${message(code: 'personne.nom.label', default: 'Nom')}"/>

            <g:sortableColumn property="prenom" title="${message(code: 'personne.prenom.label', default: 'Prenom')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${personneInstanceList}" status="i" var="personneInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${personneInstance.id}">${fieldValue(bean: personneInstance, field: "age")}</g:link></td>

                <td>${fieldValue(bean: personneInstance, field: "nom")}</td>

                <td>${fieldValue(bean: personneInstance, field: "prenom")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${personneInstanceTotal}"/>
    </div>
</div>



    <gui:dataTable
        draggableColumns="true"
        columnDefs="[
            [id:'Id', sortable:true, resizeable: true],
            [name:'Nom', sortable:true, resizeable: true],
            [age:'Age', formatter:'number', sortable:true, resizeable: true],
        ]"
        sortedBy='nom'

        controller="personne" action="dataTableDataAsJSON"
        caption="click on a row, and it will expand"
        paginate="true"
        rowExpansion="false"
        rowsPerPage="40"
        totalRecordsKey="meTotalRecs"
    />

</body>
</html>
