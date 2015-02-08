json.message_boards @message_boards do |message_board|
  json.partial! 'v1/message_boards/message_board', message_board: message_board

  json.comment_count message_board.comments.count
end