<%@ page import="testgrailsui.Demo" %>



<div class="fieldcontain ${hasErrors(bean: demoInstance, field: 'age', 'error')} required">
    <label for="age">
        <g:message code="demo.age.label" default="Age"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="age" required="" value="${fieldValue(bean: demoInstance, field: 'age')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demoInstance, field: 'birthDate', 'error')} required">
    <label for="birthDate">
        <g:message code="demo.birthDate.label" default="Birth Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="birthDate" precision="day" value="${demoInstance?.birthDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demoInstance, field: 'favoriteColors', 'error')} ">
    <label for="favoriteColors">
        <g:message code="demo.favoriteColors.label" default="Favorite Colors"/>

    </label>
    <g:textField name="favoriteColors" value="${demoInstance?.favoriteColors}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demoInstance, field: 'gender', 'error')} ">
    <label for="gender">
        <g:message code="demo.gender.label" default="Gender"/>

    </label>
    <g:textField name="gender" value="${demoInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demoInstance, field: 'isDumb', 'error')} ">
    <label for="isDumb">
        <g:message code="demo.isDumb.label" default="Is Dumb"/>

    </label>
    <g:checkBox name="isDumb" value="${demoInstance?.isDumb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demoInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="demo.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${demoInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: demoInstance, field: 'netWorth', 'error')} required">
    <label for="netWorth">
        <g:message code="demo.netWorth.label" default="Net Worth"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="netWorth" required="" value="${fieldValue(bean: demoInstance, field: 'netWorth')}"/>
</div>

