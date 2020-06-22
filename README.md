# MotifDGE
- 开发：赵作翰，祝云篪
## 安装
安装R环境：
```shell
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo apt update
sudo apt install r-base -y
sudo apt-get install libcurl4-openssl-dev libxml2-dev -y
```
安装R依赖包：
```R
install.packages(c('magrittr','devtools'))
devtools::install_github('robertamezquita/marge', ref = 'master')
```
在安装位置执行以下命令：
```shell
git clone https://github.com/Site-428/MotifDGE.git
chmod 777 -R MotifDGE
echo 'PATH=$PATH:'$(pwd)'/MotifDGE' >> ~/.bashrc
source ~/.bashrc
```
## 格式
在目标文件夹下执行以下命令：
```shell
motifDGE.R /path/to/yourDGE /path/to/yourMotif
```
其中，差异表达基因文件格式请参阅[sample.txt](https://raw.githubusercontent.com/Site-428/MotifDGE/master/sample.txt)（目前只支持双样本）；Motif为Homer工具生成的结果文件夹。
最终生成result.up、result.down两个文件，分别表示与TF相关的差异表达基因。
