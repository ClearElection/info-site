ClearElection.what = ->
    return

    $root = $("#what")
    $returns = $root.find(".returns")
    $returns_aside = $returns.find("aside")

    $returns_aside.show()
    $returns.hover(
        -> $returns_aside.fadeOut(300)
        -> $returns_aside.fadeIn(300)
    )


    $$(".returns")
