<%@ page import="testgrailsui.Personne" %>



<div class="fieldcontain ${hasErrors(bean: personneInstance, field: 'age', 'error')} required">
    <label for="age">
        <g:message code="personne.age.label" default="Age"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="age" required="" value="${fieldValue(bean: personneInstance, field: 'age')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personneInstance, field: 'nom', 'error')} ">
    <label for="nom">
        <g:message code="personne.nom.label" default="Nom"/>

    </label>
    <g:textField name="nom" value="${personneInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personneInstance, field: 'prenom', 'error')} ">
    <label for="prenom">
        <g:message code="personne.prenom.label" default="Prenom"/>

    </label>
    <g:textField name="prenom" value="${personneInstance?.prenom}"/>
</div>

