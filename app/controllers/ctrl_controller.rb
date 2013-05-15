# coding: utf-8
require 'kconv'
class CtrlController < ApplicationController
before_filter :authenticate_user!
 def upload_process
   file = params[:upfile]
   name = file.original_filename 
   #ext = name[name.rindex('.') + 1, 4].downcase
   #perms = ['.png', '.jpeg', '.caf', '.txt']
   #if !perms.include?(File.extname(name).downcase)
   # result = 'アップロードできるのは画像ファイルのみです。'
   #elsif file.size > 5.megabyte
   # result = 'ファイルサイズは5MBまでです。'
   #else 
    name = name.kconv(Kconv::SJIS, Kconv::UTF8)
    username = current_user.username
    outlet = params[:id]
    path = "public/docs/"
    FileUtils.mkdir_p("public/docs/#{username}/#{outlet}") unless File.exist?("/public/docs/#{username}/#{outlet}")
    #File.open("public/docs/#{name}", 'wb') { |f| f.write(file.read) }
    File.open("#{path}/#{username}/#{outlet}/#{name}", 'wb') { |f| f.write(file.read) }
    result = "#{name.toutf8}をアップロードしました。"
   #end
   render :text => result
  end
  
  def act4
  	render :text => 1
  end
  
  def act3
  	username = current_user.username
  	outlet = params[:id]
    send_file("public/docs/#{username}/#{outlet}/DayEnd.txt")
  end
  
  def act2
  	username = current_user.username
  	outlet = params[:id]
    send_file("public/docs/#{username}/#{outlet}/DayEndN.txt")
  end
  
  def act1
  	username = current_user.username
    send_file("public/docs/#{username}/menu.xml")
  end
  
  def upfile
     params[:text].each do |text|
     $ss = text['text']
     end
     username = current_user.username
     
     File.write("public/docs/#{username}/DayEnd.txt", $ss)
  	  render :text => '1'
  end
end
