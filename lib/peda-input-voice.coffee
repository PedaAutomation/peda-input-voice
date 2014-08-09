Speakable = require "speakable"
apiKey = "AIzaSyBOti4mM-6x9WDnZIjIeyEU21OpBXqWBgw"
language = "de-DE"

speakable = new Speakable {key: apiKey}, {lang: language}

speakable.on 'speechStart', ->
  console.log 'onSpeechStart'


speakable.on 'speechStop', ->
  console.log 'onSpeechStop'


speakable.on 'speechReady', ->
  console.log 'onSpeechReady'


speakable.on 'error', ->
  console.log 'onError:'
  console.log err
  speakable.recordVoice()

speakable.on 'speechResult', (recognizedWords) ->
  console.log 'onSpeechResult:'
  console.log recognizedWords
  speakable.recordVoice()


speakable.recordVoice()

module.exports = (helper) ->
  helper.setType "input"
  helper.setName "voice"
  # call helper.sendInput(string) when an input thing should get send
