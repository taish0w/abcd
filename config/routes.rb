Rails.application.routes.draw do
  get 'quiz/login'

  get 'quiz/answer'
  get 'quiz/answer/:ansid' => "quiz#answer"

  get 'quiz/master'
  get 'quiz/init'
  get 'quiz/prev'
  get 'quiz/next'
  get 'quiz/start'
  get 'quiz/close'
  get 'quiz/nq'
  get 'quiz/list'

  get 'quiz/button'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
