function clip --wraps='curl -F "c=@-" "http://fars.ee/"' --description 'alias clip curl -F "c=@-" "http://fars.ee/"'
  curl -F "c=@-" "http://fars.ee/" $argv
        
end
