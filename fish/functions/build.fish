function build --description "Compile by running ./configure and make"
    switch (count $argv)
        case "0"
            sh ./configure --prefix=/usr/local; and time make
        case "*"
            sh ./configure --prefix=$argv[1]; and time make
    end
end
