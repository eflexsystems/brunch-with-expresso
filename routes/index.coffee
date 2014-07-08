exports.messages = (req, res) ->
  json =
    message:
      id: 1
      text: "Web Service Is Functional!"

  res.json(json)
