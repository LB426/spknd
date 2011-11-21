class AboutusController < ApplicationController

  def index
  end

  def lnk1
  end
  
  def lnk3
  end
  
  def lnk4
  end
  
  def lnk5
  end
  
  def questions
    page = params[:page] || 1
    @question = Question.new
    if "Отправить" == params[:commit] then
      if params[:question]["question"] != ""
        @question.question = params[:question]["question"]
        if @question.save
        else
          flash[:notice] = "Вопрос не создан!"
        end
      else
        flash[:notice] = "Заполниете форму!"
      end
    end
    @questions = Question.paginate :page => page, :order => 'updated_at DESC'
  end
  
  def answer
    if /manager/ =~ current_user.groups
      @question = Question.find(params[:id])
      if "Отправить" == params[:commit] then
        @question.answer = params[:question]["answer"]
        @question.user_id = current_user.id
        if @question.save
          redirect_to "/aboutus/questions"
        else
          flash[:notice] = "Ответ не создан!!"
        end
      end
    else
      redirect_to "/aboutus/questions"
    end
      
  end
  
  def delquestion
    if /manager/ =~ current_user.groups
      @question = Question.find(params[:id])
      @question.destroy
      flash[:notice] = "Вопрос успешно удалён"
      redirect_to "/aboutus/questions"
    else
      redirect_to "/aboutus/questions"
    end
  end
  
end
