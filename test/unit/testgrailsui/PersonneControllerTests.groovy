package testgrailsui



import org.junit.*
import grails.test.mixin.*


@TestFor(PersonneController)
@Mock(Personne)
class PersonneControllerTests {


    @Test
    void testIndex() {
        controller.index()
        assert "/personne/list" == response.redirectedUrl
    }

    @Test
    void testList() {

        def model = controller.list()

        assert model.personneInstanceList.size() == 0
        assert model.personneInstanceTotal == 0

    }

    @Test
    void testCreate() {
        def model = controller.create()

        assert model.personneInstance != null


    }

    @Test
    void testSave() {
        controller.save()

        assert model.personneInstance != null
        assert view == '/personne/create'

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/personne/show/1'
        assert controller.flash.message != null
        assert Personne.count() == 1
    }


    @Test
    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/personne/list'


        def personne = new Personne()

        // TODO: populate domain properties

        assert personne.save() != null

        params.id = personne.id

        def model = controller.show()

        assert model.personneInstance == personne
    }

    @Test
    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/personne/list'


        def personne = new Personne()

        // TODO: populate valid domain properties

        assert personne.save() != null

        params.id = personne.id

        def model = controller.edit()

        assert model.personneInstance == personne
    }

    @Test
    void testUpdate() {

        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/personne/list'

        response.reset()


        def personne = new Personne()

        // TODO: populate valid domain properties

        assert personne.save() != null

        // test invalid parameters in update
        params.id = personne.id

        controller.update()

        assert view == "/personne/edit"
        assert model.personneInstance != null

        personne.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/personne/show/$personne.id"
        assert flash.message != null
    }

    @Test
    void testDelete() {
        controller.delete()

        assert flash.message != null
        assert response.redirectedUrl == '/personne/list'

        response.reset()

        def personne = new Personne()

        // TODO: populate valid domain properties
        assert personne.save() != null
        assert Personne.count() == 1

        params.id = personne.id

        controller.delete()

        assert Personne.count() == 0
        assert Personne.get(personne.id) == null
        assert response.redirectedUrl == '/personne/list'


    }


}