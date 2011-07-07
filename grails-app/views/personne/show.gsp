<%@ page import="testgrailsui.Personne" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'personne.label', default: 'Personne')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-personne" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-personne" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list personne">

        <g:if test="${personneInstance?.age}">
            <li class="fieldcontain">
                <span id="age-label" class="property-label"><g:message code="personne.age.label" default="Age"/></span>

                <span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${personneInstance}"
                                                                                       field="age"/></span>

            </li>
        </g:if>

        <g:if test="${personneInstance?.nom}">
            <li class="fieldcontain">
                <span id="nom-label" class="property-label"><g:message code="personne.nom.label" default="Nom"/></span>

                <span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${personneInstance}"
                                                                                       field="nom"/></span>

            </li>
        </g:if>

        <g:if test="${personneInstance?.prenom}">
            <li class="fieldcontain">
                <span id="prenom-label" class="property-label"><g:message code="personne.prenom.label"
                                                                          default="Prenom"/></span>

                <span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${personneInstance}"
                                                                                          field="prenom"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${personneInstance?.id}"/>
            <g:link class="edit" action="edit" id="${personneInstance?.id}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
