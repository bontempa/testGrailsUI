<%@ page import="testgrailsui.Demo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'demo.label', default: 'Demo')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-demo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-demo" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list demo">

        <g:if test="${demoInstance?.age}">
            <li class="fieldcontain">
                <span id="age-label" class="property-label"><g:message code="demo.age.label" default="Age"/></span>

                <span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${demoInstance}"
                                                                                       field="age"/></span>

            </li>
        </g:if>

        <g:if test="${demoInstance?.birthDate}">
            <li class="fieldcontain">
                <span id="birthDate-label" class="property-label"><g:message code="demo.birthDate.label"
                                                                             default="Birth Date"/></span>

                <span class="property-value" aria-labelledby="birthDate-label"><g:formatDate
                        date="${demoInstance?.birthDate}"/></span>

            </li>
        </g:if>

        <g:if test="${demoInstance?.favoriteColors}">
            <li class="fieldcontain">
                <span id="favoriteColors-label" class="property-label"><g:message code="demo.favoriteColors.label"
                                                                                  default="Favorite Colors"/></span>

                <span class="property-value" aria-labelledby="favoriteColors-label"><g:fieldValue bean="${demoInstance}"
                                                                                                  field="favoriteColors"/></span>

            </li>
        </g:if>

        <g:if test="${demoInstance?.gender}">
            <li class="fieldcontain">
                <span id="gender-label" class="property-label"><g:message code="demo.gender.label"
                                                                          default="Gender"/></span>

                <span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${demoInstance}"
                                                                                          field="gender"/></span>

            </li>
        </g:if>

        <g:if test="${demoInstance?.isDumb}">
            <li class="fieldcontain">
                <span id="isDumb-label" class="property-label"><g:message code="demo.isDumb.label"
                                                                          default="Is Dumb"/></span>

                <span class="property-value" aria-labelledby="isDumb-label"><g:formatBoolean
                        boolean="${demoInstance?.isDumb}"/></span>

            </li>
        </g:if>

        <g:if test="${demoInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="demo.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${demoInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${demoInstance?.netWorth}">
            <li class="fieldcontain">
                <span id="netWorth-label" class="property-label"><g:message code="demo.netWorth.label"
                                                                            default="Net Worth"/></span>

                <span class="property-value" aria-labelledby="netWorth-label"><g:fieldValue bean="${demoInstance}"
                                                                                            field="netWorth"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${demoInstance?.id}"/>
            <g:link class="edit" action="edit" id="${demoInstance?.id}"><g:message code="default.button.edit.label"
                                                                                   default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
