# ASCON-ZYNQ
Compare the results of implementing ASCON on ZYNQ's PS and PS-PL 
采用NIST基准三（https://lwc.las3.de/）的测试向量文件和性能指标。
选择硬件平台ZYNQ-7000实现了轻量级认证加密算法ASCON的软硬件协同工作，并将其性能测试结果和ZYNQ的同频ARM下的软件测试结果以及NIST官方基准三的测试结果进行横向、纵向对比。
ASCON-PS为ASCON在ARM核下的测试代码，ASCON-PL-PS为软硬件协同工作测试代码。
