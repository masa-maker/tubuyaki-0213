class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "message_channel" #サーバーとクライアントを関連付けるメソッド
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
