$(document).ready ->

    $(document).foundation()
    header = new ClearElection.Header
    tab = window.location.hash
    header.selectTab tab if tab != ""
    ClearElection.what()
    ClearElection.technical()

    # if running as clearelection.org.dev, change clearelection.org links
    # to clearelection.org.dev
    if window.location.hostname.match /clearelection.org.dev$/
        $("a[href*='clearelection.org']").each ->
            $(this).attr 'href', $(this).attr('href').replace /clearelection.org/, "clearelection.org.dev"
