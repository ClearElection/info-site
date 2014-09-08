$(document).ready ->

    $(document).foundation()
    $sections = $("#MainContents > section")
    $buttons = $("#HeaderTopBar .button")
    $downarrows = $(".tab-down-arrow")

    $buttons.first().addClass("active")
    $sections.hide()
    $sections.first().show()

    activate = ($button) ->
        hashid = $button.attr("href")
        $sections.hide()
        $buttons.removeClass("active")
        $button.addClass("active")
        $button.append $downarrows
        $section = $(hashid)
        $section.show()
        return hashid

    select = ($button) ->
        hashid = activate $button
        history.replaceState(null, null, hashid)
        $("html, body").animate
            scrollTop: $('#Header').height()+2
        ,
            500
        return false

    $cur = $buttons.filter("[href='#{window.location.hash}']")
    activate (if $cur.length == 0 then $buttons.first() else $cur), hoist:false

    $buttons.on "click", -> select $(@)

    $(".logo").on "click", ->
        $("html, body").animate
            scrollTop: 0
        ,
            300
        window.location.hash = ""
