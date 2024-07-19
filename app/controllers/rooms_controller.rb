class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_new_work

  def index
    current_user_room_ids = current_user.user_rooms.pluck(:room_id)
    other_user_ids = UserRoom.where(room_id: current_user_room_ids)
                              .where.not(user_id: current_user.id)
                              .pluck(:user_id)
    @rooms_user = User.where(id: other_user_ids)
  end
end
