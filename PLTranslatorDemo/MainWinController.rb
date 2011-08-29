# MainWinController.rb
# PLTranslatorDemo
#
# Created by xhan on 10-10-11.
# Copyright 2010 ixHan.com. All rights reserved.


class MainWinController < NSWindowController
  
    attr_accessor :textFieldPure, :textFieldResult, :popupButtonFrom, :popupButtonTo

    def awakeFromNib
        # puts "hello from nib"
        textFieldPure.setStringValue("Hello world\u2028我们")
        popupButtonTo.removeAllItems
        popupButtonTo.addItemsWithTitles(["zh-cn","zh-tw","ja","en"])
        popupButtonFrom.removeAllItems
        popupButtonFrom.addItemsWithTitles(["","zh-cn","zh-tw","ja","en"])        

        @zhTranslator = PLTranslatorZh.alloc.init
    end
  
  
    # def onTranslate(sender)
    # 
    #     time = Time.now
    #     url = PLTranslator.URLforText(textFieldPure.stringValue, :fromLang => popupButtonFrom.titleOfSelectedItem, :toLang => popupButtonTo.titleOfSelectedItem)
    #     # puts "url:#{url}"
    #     results = PLHttpClient.syncGet(url)
    #     puts "results#{results}"
    #     time = Time.now - time
    #     puts time
    #     textFieldResult.setStringValue PLTranslator.TranslatedTextFromResponse(results)    
    # end
    def onTranslate(sender)
        time = Time.now
        to_lang = popupButtonTo.titleOfSelectedItem
        if  to_lang == "zh-cn"
          rst = @zhTranslator.translateToSimplifed(textFieldPure.stringValue)
        elsif to_lang == "zh-tw"
          rst = @zhTranslator.translateToTraditional(textFieldPure.stringValue)
        else
          rst = @zhTranslator.translateToMars(textFieldPure.stringValue)
        end
        textFieldPure.setStringValue rst
        puts time
    end
    
    def on_translate_to_zh_hans(sender)
        textFieldResult.setStringValue @zhTranslator.translateToSimplifed(textFieldPure.stringValue)
    end
    
    def on_translate_to_zh_hant(sender)
        textFieldResult.setStringValue @zhTranslator.translateToTraditional(textFieldPure.stringValue)
    end
    
    def on_translate_to_zh_mars(sender)
        textFieldResult.setStringValue @zhTranslator.translateToMars(textFieldPure.stringValue)
    end    
  
end