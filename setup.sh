#Add repos and install software
for i in $(grep -vE "^\s*#" repo_list.txt  | tr "\n" " ")
do
    add-apt-repository "ppa:$i"
done
apt-get install $(grep -vE "^\s*#" install_list.txt  | tr "\n" " ")

#Download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
