function clean_cellar --description="Clean up Cellar directories"
    for d in /usr/local/Cellar/*
      echo "Cleaning up "$d"..."
      for i in (ls -t $d | tail -n +2)
          echo "Removing "$d"/"$i
          rm -rf $d"/"$i
      end
    end
end
