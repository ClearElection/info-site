ClearElection.technical = ->
    $root = $("#technical")
    
    $root.find(".codeview textarea").each ->
        $textarea = $(this)
        cm = CodeMirror.fromTextArea $textarea[0],
                mode:
                    name: 'javascript'
                    json: true
                readonly: true
                lineNumbers: true
        $(document).on 'opened.fndtn.reveal', '[data-reveal]', -> cm.refresh()
