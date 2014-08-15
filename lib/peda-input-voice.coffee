Speakable = require "speakable"
apiKey = "AIzaSyBOti4mM-6x9WDnZIjIeyEU21OpBXqWBgw"
language = "de-DE"

speakable.recordVoice()

module.exports = (helper) ->
  helper.setType "input"
  helper.setName "voice"

  speakable = new Speakable {key: apiKey}, {lang: helper.getLanguage()}

  speakable.on 'error', ->
    console.log 'speakable error:'
    console.log err

  speakable.on 'speechResult', (recognizedWords) ->
    console.log 'onSpeechResult:'
    helper.sendInput(recognizedWords)
  
  # TODO: call speakable.recordVoice() when a hotword was detected.
