export PATH=$PATH:$HOME/bin:/usr/local/bin:/opt/miniconda3/bin:/opt/blender-2.79b:/opt/opensmile-2.3.0/inst/bin:$HOME/.mujoco/mjpro150/bin:$PATH
export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}

export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64:$HOME/.mujoco/mjpro150/bin

export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so:/usr/lib/x86_64-linux-gnu/libGL.so

export PYTHONPATH=/opt/PySDL2-0.9.5:$PYTHONPATH

#export MUJOCO_PY_MJPRO_PATH=$MUJOCO_PY_MJPRO_PATH:/opt
#export MUJOCO_PY_MJKEY_PATH=$MUJOCO_PY_MJKEY_PATH:/opt
