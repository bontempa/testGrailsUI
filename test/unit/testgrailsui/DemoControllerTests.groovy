package testgrailsui



import org.junit.*
import grails.test.mixin.*


@TestFor(DemoController)
@Mock(Demo)
class DemoControllerTests {


    @Test
    void testIndex() {
        controller.index()
        assert "/demo/list" == response.redirectedUrl
    }

    @Test
    void testList() {

        def model = controller.list()

        assert model.demoInstanceList.size() == 0
        assert model.demoInstanceTotal == 0

    }

    @Test
    void testCreate() {
        def model = controller.create()

        assert model.demoInstance != null


    }

    @Test
    void testSave() {
        controller.save()

        assert model.demoInstance != null
        assert view == '/demo/create'

        // TODO: Populate valid properties

        controller.save()

        assert response.redirectedUrl == '/demo/show/1'
        assert controller.flash.message != null
        assert Demo.count() == 1
    }


    @Test
    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/demo/list'


        def demo = new Demo()

        // TODO: populate domain properties

        assert demo.save() != null

        params.id = demo.id

        def model = controller.show()

        assert model.demoInstance == demo
    }

    @Test
    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/demo/list'


        def demo = new Demo()

        // TODO: populate valid domain properties

        assert demo.save() != null

        params.id = demo.id

        def model = controller.edit()

        assert model.demoInstance == demo
    }

    @Test
    void testUpdate() {

        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/demo/list'

        response.reset()


        def demo = new Demo()

        // TODO: populate valid domain properties

        assert demo.save() != null

        // test invalid parameters in update
        params.id = demo.id

        controller.update()

        assert view == "/demo/edit"
        assert model.demoInstance != null

        demo.clearErrors()

        // TODO: populate valid domain form parameter
        controller.update()

        assert response.redirectedUrl == "/demo/show/$demo.id"
        assert flash.message != null
    }

    @Test
    void testDelete() {
        controller.delete()

        assert flash.message != null
        assert response.redirectedUrl == '/demo/list'

        response.reset()

        def demo = new Demo()

        // TODO: populate valid domain properties
        assert demo.save() != null
        assert Demo.count() == 1

        params.id = demo.id

        controller.delete()

        assert Demo.count() == 0
        assert Demo.get(demo.id) == null
        assert response.redirectedUrl == '/demo/list'


    }


}