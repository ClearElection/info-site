$(document).ready ->

    $(document).foundation()
    $sections = $("#MainContents > section")
    $buttons = $("#HeaderTopBar .button")
    $downarrows = $(".tab-down-arrow")

    activate = ($button) ->
        $sections.hide()
        $buttons.removeClass("active")
        $button.addClass("active")
        hashid = $button.attr("href")
        $(hashid).show()
        $button.append $downarrows
        window.location.hash = hashid
        return false

    $cur = $buttons.filter("[href='#{window.location.hash}']")
    activate if $cur.length == 0 then $buttons.first() else $cur

    $buttons.on "click", -> activate $(@)
