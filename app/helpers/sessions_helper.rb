module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  # 現在ログイン中のユーザーを返す (いる場合)
 def current_user
  #  Rubyでは、「変数の値がnilなら変数に代入するが、nilでなければ代入しない (変数の値を変えない)」という操作が非常によく使われます。(https://railstutorial.jp/chapters/basic_login?version=5.1#cha-basic_login)
  # >> @foo
  # => nil
  # >> @foo = @foo || "bar"
  # => "bar"
  # >> @foo = @foo || "baz"
  # => "bar"
   @current_user ||= User.find_by(id: session[:user_id])

 end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  # 現在のユーザーをログアウトする
def log_out
  session.delete(:user_id)
  @current_user = nil
end
end
