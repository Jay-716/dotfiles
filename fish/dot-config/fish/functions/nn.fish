function nn --wraps='env NNN_TRASH=1 NNN_OPTS=d nnn' --description 'alias nn env NNN_TRASH=1 NNN_OPTS=d nnn'
  env NNN_TRASH=1 NNN_OPTS=edAB nnn $argv
        
end
