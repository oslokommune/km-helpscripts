: "${INSTALL_DIR:?Needs to be non-empty.}"

KUBECTX_DIR=$INSTALL_DIR/kubectx

echo Git clone to $KUBECTX_DIR...

git clone https://github.com/ahmetb/kubectx.git $KUBECTX_DIR

echo Adding completions to $COMPDIR

COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
sudo ln -sf $KUBECTX_DIR/completion/kubens.bash $COMPDIR/kubens
sudo ln -sf $KUBECTX_DIR/completion/kubectx.bash $COMPDIR/kubectx

echo Adding to PATH in .bashrc...

cat << FOE >> ~/.bashrc

# kubectx and kubens
export PATH=$KUBECTX_DIR:\$PATH
FOE
