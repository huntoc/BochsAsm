```
    _ _           ___               
 _ | (_)_ _  __ _| _ \___ _ _  __ _ 
| || | | ' \/ _` |  _/ -_) ' \/ _` |
 \__/|_|_||_\__, |_| \___|_||_\__, |
            |___/             |___/ 
```

# Bochs Linux 运行环境



# Arch Linux

## 程序安装

```shell
yay -S nasm		# 安装NASM汇编编译器
yay -S bochs	# 安装IA32虚拟机
```



## 创建虚拟硬盘

```shell
bximage -func="create" -hd=60M -imgmode="flat" -sectsize=512 -q disk.img
```



```shell
[bximage 会生产Bochs的参数， 类似以下类型可以拷贝到bochsrc] Path: <./vwork/bochsrc.disk>
Output Info: 
========================================================================
                                bximage
  Disk Image Creation / Conversion / Resize and Commit Tool for Bochs
         $Id: bximage.cc 14091 2021-01-30 17:37:42Z sshwarts $
========================================================================

Creating hard disk image 'sys.img' with CHS=121/16/63 (sector size = 512)

The following line should appear in your bochsrc:
  ata0-master: type=disk, path="sys.img", mode=flat
```



## 编译与运行

- 编译程序

  ```makefile
  make 
  ```

- 将编译的文件二进制文件写入虚拟光驱/硬盘

  ```makefile
  make install
  ```

- 运行程序

  ```makefile
  make run # 注意: 运行后需要在bochs命令行中输入字符'c'用于继续运行程序
  ```

  
