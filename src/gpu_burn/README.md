# CUDA 8.0 AND GPU_BURN INSTALLATION 

# Cuda Installation
Download cuda 8.0 from https://developer.nvidia.com/cuda-80-ga2-download-archive

Two files need to be installed:

`cuda_8.0.61_375.26_linux.run` and `cuda_8.0.61.2_linux.run` (cuBLAS Patch Update to CUDA8.0)

CUDA 8.0 requires gcc <= 5.3  However Ubuntu 18.04 LTS installs gcc-5.5 when  `sudo apt get install gcc5` is run.

Thefore run `sudo apt-get install gcc-4.8`

To check the gcc version, run `gcc -v`

Follow the instructions to install both programs and install the dependecies if needed or missing.

During Instalaltion, In case there is an error:

`Can’t locate InstallUtils.pm in @INC (you may need to install the InstallUtils module)` then:

run `sh ./cuda_8.0.61_375.26_linux.run --tar mxvf` and 
`sudo cp cuda/InstallUtils.pm /usr/lib/x86_64-linux-gnu/perl-base`

To check if you have installed cuda correctly run `nvcc -V`

The output should be:

`nvcc: NVIDIA (R) Cuda compiler driver`

`Copyright (c) 2005-2016 NVIDIA Corporation`

`Built on Tue_Jan_10_13:22:03_CST_2017`

`Cuda compilation tools, release 8.0, V8.0.61`

At this point, you may get the following error when you try to run `nvidia-smi`:

`NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running`

This is because you are currently using gcc-4.8 and the driver won't be detected initially unless it's the original gcc-7 version.

To solve this issue, 

run  `sudo apt install --reinstall gcc`

`sudo apt-get --purge -y remove 'nvidia*'`

`sudo apt install nvidia-driver-390`

`sudo reboot`

run `nvidia-smi` and you should see info about your gpu

# gpu_burn Installation

Download the gp_burn commit either from https://github.com/wilicc/gpu-burn/tree/ace04173bf19d72178949b26a9874e2606cc354f

or 

https://github.com/wilicc/gpu-burn/tree/35cfc4045d8435ffac20035bab31e8c412aa1cb4

`ace04173bf19d72178949b26a9874e2606cc354f` is the most recent of the two so this is preferred.

In the Makefile change the CUDAPATH to `CUDAPATH=/usr/local/cuda-8.0` and the -arch flag to `-arch=compute_20` 

run `make`

# Gpu_burn Usage

    GPU Burn
    Usage: gpu_burn [OPTIONS] [TIME]
    
    -d	Use doubles
    -tc	Use Tensor cores
    -h	Show this help message
    
    Example:
    gpu_burn -d 3600
