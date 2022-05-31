require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 99999999
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:USE_MULTILINE] = false
