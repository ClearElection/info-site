class ClearElection.Header
    constructor: () ->
        @$header = $("#Header")
        @$panels = $("#MainContents > section")
        @$buttons = $("#HeaderTopBar .button")
        @$downarrows = $(".tab-down-arrow")
        @$logo = $(".logo")

        @$buttons.first().addClass("active")
        @$panels.hide()
        @activateTab @$buttons.first().attr("href")

        @$buttons.on "click", (e) =>
            @selectTab $(e.target).attr('href')
            return false

        @$logo.on "click", =>
            $("html, body").animate
                scrollTop: 0
            ,
                300
            window.location.hash = ""

    activateTab: (tabId) ->
        $button = @$buttons.filter("[href='#{tabId}']")
        @$panels.hide()
        @$buttons.removeClass("active")
        $button.addClass("active")
        $button.append @$downarrows
        @$panel = $(tabId)
        @$panel.show()

    selectTab: (tab) ->
        @activateTab(tab)
        hashid = tab
        history.replaceState(null, null, hashid)
        scrollTo = @$header.height()+2
        $("html, body").animate { scrollTop: scrollTo }, 500
