#Add repos and install software
for i in $(grep -vE "^\s*#" repo_list.txt  | tr "\n" " ")
do
    sudo add-apt-repository "ppa:$i"
done
sudo apt-get install $(grep -vE "^\s*#" install_list.txt  | tr "\n" " ")

#Download vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
