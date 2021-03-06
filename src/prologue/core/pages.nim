import htmlgen


proc errorPage*(errorMsg: string, version: string): string =
  result = html(head(title(errorMsg)),
                body(h1(errorMsg),
                     "<hr/>",
                     p("Prologue " & version),
                     style = "text-align: center;"),
                xmlns = "http://www.w3.org/1999/xhtml")

proc loginPage*(): string =
  result = html(form(action = "/login",
                `method` = "post",
                "Username: ", input(name = "username", `type` = "text"),
                "Password: ", input(name = "password", `type` = "password"),
                input(value = "login", `type` = "submit")),
                xmlns = "http://www.w3.org/1999/xhtml")

proc multiPartPage*(): string =
  result = html(form(action = "/multipart?firstname=red green&lastname=tenth",
               `method` = "post", enctype = "multipart/form-data",
                input(name = "username", `type` = "text", value = "play game"),
                input(name = "password", `type` = "password", value = "start"),
                input(value = "submit", `type` = "submit")),
                xmlns = "http://www.w3.org/1999/xhtml")

proc internalServerErrorPage*(): string {.inline.} =
  result = """<html>

<head>
  <title>500 Internal Server Error</title>
</head>

<body>
  <h1>500 Internal Server Error</h1>
  <div>
    <p>
      The Server encountered an internal error and unable to complete
      you request.
    </p>
  </div>
</body>

</html>
"""
