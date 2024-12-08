function uuid4gen --wraps=python\ -c\ \'import\ uuid\;\ print\(uuid.uuid4\(\)\)\' --description alias\ uuid4gen\ python\ -c\ \'import\ uuid\;\ print\(uuid.uuid4\(\)\)\'
  python -c 'import uuid; print(uuid.uuid4())' $argv
        
end
