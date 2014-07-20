class Task
    constructor: (@title) ->
        @isDone = ko.observable false

class TaskListViewModel
    constructor: ->
        @tasks = ko.observableArray([])
        @newTaskText = ko.observable()
        
        @incompleteTasks = ko.computed =>
            ko.utils.arrayFilter(@tasks(), (task) -> !task.isDone())
        @addTask = ->
            @tasks.push new Task @newTaskText()
            @newTaskText("")
        @removeTask = (task) =>
            @tasks.remove(task)

ko.applyBindings new TaskListViewModel()