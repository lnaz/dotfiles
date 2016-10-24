source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs

case ${OSTYPE} in
    linux*)
        #for Ubuntu
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
        export CUDA_HOME=/usr/local/cuda
        export PATH=$PATH:/usr/local/cuda/bin
        export PYTHONPATH=$PYTHONPATH:$HOME/mylib/python
        export PATH=$PATH:$HOME/bin
        ;;
esac
