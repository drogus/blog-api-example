module PostsHelper
  def users_for_select
    User.all.map { |u| [u.name, u.id] }
  end
end
