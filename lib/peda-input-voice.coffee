Speakable        = require "speakable"
OkayPedaDetector = require 'okay-peda-detector'

apiKey = "AIzaSyBOti4mM-6x9WDnZIjIeyEU21OpBXqWBgw"
language = "de-DE"

module.exports = (helper) ->
  helper.setType "input"
  helper.setName "voice"

  detector = new OkayPedaDetector()

  speakable = new Speakable {key: apiKey}, {lang: language} #TODO: use the lang with country codes here

  speakable.on 'error', (err) ->
    console.log 'speakable error:'
    console.log err

  speakable.on 'speechResult', (recognizedWords) ->
    console.log 'onSpeechResult:'
    if(recognizedWords)
      helper.sendInput(recognizedWords.join(" "))

  detector.on 'hotword', ->
    helper.sendOutput("Yo.")
    speakable.recordVoice()

  detector.listen()
