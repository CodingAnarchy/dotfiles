function pip_upgrade --description="Upgrade python packages using pip"
    pip install --upgrade pip
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
end
