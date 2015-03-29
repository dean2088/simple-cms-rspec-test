class DemoController < ApplicationController
  
  layout 'application'
  
  def index #action name
    #render('demo/hello')
  end
  
  def hello
    @array = [1,2,3,4,5]
    @id=params['id']
    @page=params[:page]
  end
  
  def other_hello
    redirect_to(:controller=>'demo',:action=>'index')#跳转
  end
  
  def text_helpers
    
  end
  
end
