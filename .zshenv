case ${OSTYPE} in
    darwin*)
        #for Mac
        export PATH=$HOME/.nodebrew/current/bin:$PATH
        export PYENV_ROOT=$HOME/.pyenv
        export PATH=$PYENV_ROOT/bin:$PATH
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
        ;;
    linux*)
        #for Ubuntu
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
        export CUDA_HOME=/usr/local/cuda
        export PATH=$PATH:/usr/local/cuda/bin
        export PYTHONPATH=$PYTHONPATH:$HOME/mylib/python
        export PATH=$PATH:$HOME/bin
        export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
        ;;
esac

export PATH=$PATH:/usr/local/bin
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs
