$(document).ready ->

    $(document).foundation()
    $sections = $("#MainContents > section")
    $sections.each ->
        $section = $(@)
        sectionID = $section.attr("id")
        template = JST[sectionID]
        if template
            $section.html template()
        else
            $section.html "No template for section #{sectionID}"

    $buttons = $("#HeaderTopBar .button")
    $downarrows = $(".tab-down-arrow")

    activate = ($button) ->
        $sections.hide()
        $buttons.removeClass("active")
        $button.addClass("active")
        $($button.attr("href")).show()
        $button.append $downarrows

    $cur = $buttons.filter("[href='#{window.location.hash}']")
    activate if $cur.size == 0 then $buttons.first() else $cur

    $buttons.on "click", -> activate $(@)
