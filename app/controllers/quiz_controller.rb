class QuizController < ApplicationController
  def answer
    @ansid = params[:ansid]
    @ans_obj = AnsSeq.find_by(status:"active")
    if !@ans_obj.nil?
      # 複数指定
      @chk = UserAnswer.find_by(question_no:AnsSeq.maximum('ansnum'),user:cookies[:tean_name])
      if @chk.nil?
        @ans = UserAnswer.new
        @ans.question_no = AnsSeq.maximum('ansnum')
        @ans.ans_num = params[:ansid]
        @ans.user = cookies[:tean_name]
        @ans.ans_time = Time.now
        @ans.ans_sec = (Time.now - AnsSeq.maximum('ans_time')).round(2)
        @ans.save
      else
        @ansid = @chk.ans_num
        @already ="受付済み"
      end
    else
      @no_ready ="回答受付前"
    end
  end

  def master
    @userAns = UserAnswer.all
    @ans_start = AnsSeq.maximum('ans_time')
    @msg = flash[:msg]
  end

  def button
    if params[:teamname].blank?
      @team = cookies[:tean_name]
    else
      cookies[:tean_name] = params[:teamname]
    end
    if cookies[:tean_name].blank?
      redirect_to '/quiz/login'
    else
      @team = cookies[:tean_name]
    end
  end

  def init
    ActiveRecord::Base.connection.execute('DELETE FROM `user_answers`')
    ActiveRecord::Base.connection.execute('DELETE FROM `ans_seqs`')
    @ans = AnsSeq.new
    @ans.ansnum = 0
    @ans.status = "-"
    @ans.ans_time = Time.now
    @ans.save

    flash[:msg] = "初期化完了"
     redirect_to '/quiz/master'
  end
  def prev
    flash[:msg] = "前の問題へ移動完了"
    redirect_to '/quiz/master'
  end
  def next
    flash[:msg] = "次の問題へ移動完了"
    redirect_to '/quiz/master'
  end
  def start
    @ans = AnsSeq.new
    @ans.ansnum = AnsSeq.maximum('ansnum') + 1
    @ans.status = "active"
    @ans.ans_time = Time.now
    @ans.save
    flash[:msg] = "回答受付開始"
    redirect_to '/quiz/master'
  end
  def close
    @ans = AnsSeq.find_by status: "active"
    if not @ans.nil?
    @ans.status = "close"
    @ans.save
  end
    flash[:msg] = "回答受付終了"
    redirect_to '/quiz/master'
  end
  def nq
    flash[:msg] = "次の問題へ"
    redirect_to '/quiz/master'
  end
  def list
    flash[:msg] = "一覧を表示"
    redirect_to '/quiz/master'
  end

  def login

  end
end
