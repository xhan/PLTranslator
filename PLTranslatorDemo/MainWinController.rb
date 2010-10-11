# MainWinController.rb
# PLTranslatorDemo
#
# Created by xhan on 10-10-11.
# Copyright 2010 Baidu.com. All rights reserved.


class MainWinController < NSWindowController
  
  attr_accessor :textFieldPure, :textFieldResult, :popupButtonFrom, :popupButtonTo
  
  def awakeFromNib
    puts "hello from nib"
    a = OBJC.new
    a.print
  end
  
  
  def onTranslate(sender)
    
  end
  
end