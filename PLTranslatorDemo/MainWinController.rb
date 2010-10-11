# MainWinController.rb
# PLTranslatorDemo
#
# Created by xhan on 10-10-11.
# Copyright 2010 Baidu.com. All rights reserved.


class MainWinController < NSWindowController
  
  attr_accessor :textFieldPure, :textFieldResult, :popupButtonFrom, :popupButtonTo
  
  def awakeFromNib
    # puts "hello from nib"
    textFieldPure.setStringValue("Hello China")
  end
  
  
  def onTranslate(sender)
    puts "origin:#{textFieldPure.stringValue}"
    
    url = PLTranslator.URLforText(textFieldPure.stringValue, :fromLang => nil, :toLang => "zh-tw")
    puts "url:#{url}"
    results = PLHttpClient.syncGet(url)
    puts "results#{results}"
    textFieldResult.setStringValue PLTranslator.TranslatedTextFromResponse(results)    
  end
  
end