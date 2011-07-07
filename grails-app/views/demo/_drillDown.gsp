<%@ page contentType="text/html;charset=UTF-8" %>
<h1>${demo.name}</h1>
<ul>
    <li>ID: ${demo.id}</li>
    <li>Birthdate: ${demo.birthDate.toString()}</li>
    <li>Age: ${demo.age}</li>
    <li>Net Worth: ${demo.netWorth}</li>
    <li><a href="http://weblog.dangertree.net">Test Link</a>
    <li><gui:dialog
                width="400px"
                title="Dialog within row expansion"
                triggers="[show:[type:'link', text:'Click for Dialog', on:'click']]">
            <p style="color:black"/>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis at dolor. Sed quis mi eu lectus pretium luctus. Ut placerat adipiscing turpis. Quisque eu nisl id nibh hendrerit sagittis. Sed in erat elementum mi euismod pretium. Pellentesque augue. Duis rhoncus varius sapien. Nunc imperdiet neque sed ipsum. Nullam molestie gravida felis. Etiam pellentesque, urna a cursus blandit, lacus felis luctus augue, viverra mattis dolor massa commodo quam. Nullam nulla. Vivamus malesuada aliquam est. Etiam orci sapien, interdum quis, eleifend eu, blandit quis, orci. Aenean vulputate porttitor lacus. 
        </gui:dialog>
    </li>
</ul>

