$(document).ready ->

    $(document).foundation()
    header = new ClearElection.Header
    tab = window.location.hash
    header.selectTab tab if tab != ""
    ClearElection.what()
