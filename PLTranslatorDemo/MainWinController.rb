# MainWinController.rb
# PLTranslatorDemo
#
# Created by xhan on 10-10-11.
# Copyright 2010 ixHan.com. All rights reserved.


class MainWinController < NSWindowController
  
  attr_accessor :textFieldPure, :textFieldResult, :popupButtonFrom, :popupButtonTo
  
  def awakeFromNib
    # puts "hello from nib"
    textFieldPure.setStringValue("Hello China")
    popupButtonTo.removeAllItems
    popupButtonTo.addItemsWithTitles(["zh-cn","zh-tw","ja","en"])
  end
  
  
  def onTranslate(sender)
    puts "origin:#{textFieldPure.stringValue}"
    
    # url = PLTranslator.URLforText(textFieldPure.stringValue, :fromLang => nil, :toLang => "zh-tw")
    # url = PLTranslator.URLforText(textFieldPure.stringValue, :fromLang => nil, :toLang => PLLangJapanese)    
    url = PLTranslator.URLforText(textFieldPure.stringValue, :fromLang => nil, :toLang => popupButtonTo.titleOfSelectedItem)
    # puts "url:#{url}"
    results = PLHttpClient.syncGet(url)
    puts "results#{results}"
    textFieldResult.setStringValue PLTranslator.TranslatedTextFromResponse(results)    
  end
  
end