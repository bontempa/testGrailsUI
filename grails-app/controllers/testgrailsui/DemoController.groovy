package testgrailsui

import grails.converters.JSON

class DemoController {

    def grailsUITagLibService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [demoInstanceList: Demo.list(params), demoInstanceTotal: Demo.count()]
    }

    def create = {
        def demoInstance = new Demo()
        demoInstance.properties = params
        return [demoInstance: demoInstance]
    }

    def save = {
        def demoInstance = new Demo(params)
        if (demoInstance.save(flush: true)) {
            flash.message = message(code: 'default.created.message', args: [message(code: 'demo.label', default: 'Demo'), demoInstance.id])
            redirect(action: "show", id: demoInstance.id)
        }
        else {
            render(view: "create", model: [demoInstance: demoInstance])
        }
    }

    def show = {
        def demoInstance = Demo.get(params.id)
        if (!demoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'demo.label', default: 'Demo'), params.id])
            redirect(action: "list")
        }
        else {
            [demoInstance: demoInstance]
        }
    }

    def edit = {
        def demoInstance = Demo.get(params.id)
        if (!demoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'demo.label', default: 'Demo'), params.id])
            redirect(action: "list")
        }
        else {
            return [demoInstance: demoInstance]
        }
    }

    def update = {
        def demoInstance = Demo.get(params.id)
        if (demoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (demoInstance.version > version) {

                    demoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'demo.label', default: 'Demo')] as Object[], "Another user has updated this Demo while you were editing")
                    render(view: "edit", model: [demoInstance: demoInstance])
                    return
                }
            }
            demoInstance.properties = params
            if (!demoInstance.hasErrors() && demoInstance.save(flush: true)) {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'demo.label', default: 'Demo'), demoInstance.id])
                redirect(action: "show", id: demoInstance.id)
            }
            else {
                render(view: "edit", model: [demoInstance: demoInstance])
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'demo.label', default: 'Demo'), params.id])
            redirect(action: "list")
        }
    }

    def delete = {
        def demoInstance = Demo.get(params.id)
        if (demoInstance) {
            try {
                demoInstance.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'demo.label', default: 'Demo'), params.id])
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'demo.label', default: 'Demo'), params.id])
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'demo.label', default: 'Demo'), params.id])
            redirect(action: "list")
        }
    }

     def dataTableDataAsJSON = {
        def list = []
        def demoList = Demo.list(params)
        response.setHeader("Cache-Control", "no-store")
        demoList.each {
            list << [
                    id: it.id,
                    name: it.name,
                    birthDate: grailsUITagLibService.dateToJs(it.birthDate),
                    age: it.age,
                    netWorth: it.netWorth,
                    gender: it.gender,
                    isDumb: it.isDumb,
                    favoriteColors: it.favoriteColors.split(','),
                    dataUrl: g.createLink(action: 'dataDrillDown') + "/$it.id"
            ]
        }
        def data = [
                meTotalRecs: Demo.count(),
                results: list
        ]
        render data as JSON
    }

    def dataDrillDown = {
        render(template: 'drillDown', var: 'demo', bean: Demo.get(params.id))
    }
    def nonStandardDataTableDataAsJSON = {
        def list = []
        def criteria = Demo.createCriteria()
        def maxAge = Integer.parseInt(params.maxAge)
        def demoList = criteria.list {
            lt('age', maxAge)
            order(params.sort, params.order)
        }
        def offset = Integer.parseInt(params.offset)
        def max = Integer.parseInt(params.max)
        def endRange = (offset + max -1) <= (demoList.size()-1) ? (offset + max -1) : demoList.size()-1
        def range = offset..endRange
        def result = Demo.list(params)
        result.each {
            list << [
                    id: it.id,
                    name: it.name,
                    birthDate: it.birthDate.toString(),
                    age: it.age,
                    gender: it.gender,
                    netWorth: it.netWorth,
                    dataUrl: g.createLink(action: 'dataDrillDown') + "/$it.id"
            ]
        }
        def data = [
                totalRecords: demoList.size(),
                myResults: list
        ]
        render data as JSON
    }

    def tabLoader = {
        render """
            <h3>From the Server!!</h3>
            <p/>This data came straight from the controller.
        """
    }

    def toolTipLoader = {
        render """
            <h3>Tool tip markup from the server!</h3>
            <p/>Here are my params: ${params}.
        """
    }

    def ajaxDialogSelectionMade = {
        render "Your selection (${params.selection_id}:${params.selection}) has been updated to the server for id ${params.id}."
    }

    def acceptForm = {
        render "These params were sent to the server: $params"
    }

    def tableChange = {
        println "table Change!"
        println params
        def demo = Demo.get(params.id)
        if (params.field == 'age') demo."$params.field" = params.newValue.toInteger()
        else if (params.field == 'birthDate') demo."$params.field" = new Date(params.newValue)
        else if (params.field == 'name' && params.newValue==''){
          response.status = response.SC_INTERNAL_SERVER_ERROR
          return;
        }
        else demo."$params.field" = params.newValue
        demo.save()
        render "success"
    }

}
