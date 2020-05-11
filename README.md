# 登录界面：
UserLogIn_Interface（包含脚本与guide）:登陆界面主程序，包括PCA+SVM人脸识别登陆与字符识别登陆；
登录模式1如下：运行UserLogIn_Interface.m—>点击初始化按钮进行faceinitialize.m，完成样本训练工作—>点击facerecognition.m即可完成人脸识别进入登录确认界面
登录模式2如下：运行UserLogIn_Interface.m—>输入账号：qinyuao密码：qinyuao123—>点击登录确认按钮即可完成字符匹配进入登录确认界面
人脸识别程序构架如下：读入人脸照片—>灰度化—>检测人脸—>扣出人脸—>归一化尺寸—>在训练集的特征子空间中降维—>在训练集每维的最大最小值上数据归一化—>利用训练好的模型预测—>显示
faceinitialize:初始化主程序，进行图像训练，进行数据读入、快速PCA、归一化、样本训练
faceContainer.mat、scaling.mat、PCA.mat、s1-s41为此部分生成数据集，不可删除
facerecognition:人脸识别主程序，调用摄像头捕捉图像，进行数据读入、快速PCA、归一化、训练、完成人脸识别；
faceCapture:首先采集需要被识别人的人脸，每人采取10张，统一格式大小，放入人脸数据库中，在系统程序中不涉及；
ReadFace:读入待训练的ORL人脸数据，s1-s41；
fastPCA:对于读入数据进行快速PCA降维；
scaling:对降维后数据进行归一化；
svmtrain:使用SVM支持向量机训练模型；
testscaling:测试数据归一化；
svmpredict:使用SVM支持向量机预测模型；

# 登陆确认界面：
untitled（包含脚本与guide）:登陆确认界面主程序、包含有串口参数和cdSRC参数修改；
本窗口参数皆使用全局变量定义，进入此界面后点击“确认”即可进入系统主界面，点击“取消”即可退回登录界面

# 主页面：
包含产品质量检测模块、串口模块、图像处理模块：
srcmain：主页面主程序构架包含产品质量检测模块：cdSRC、串口模块：com_ceshi、图像处理主程序：Main_Interface

基于图像内容的产品质量检测主程序操作流程如下：点击“选择图像”可运行GUIopen.m，可选择文件夹中1、2两种图像—>点击“下采样”可运行downsample_ori.m，可对选择图像进行三次卷积下采样—>点击“图像识别”可运行cdSRC.m,可进行识别
orisample.mat、identifyresult.mat为此部分必须数据集，不可删除
1.jpg、2.jpg是测试图像，不可删除
GUIopen.m 选取测试图像；
downsample_ori.m 对图像进行三次卷积采样；
downSample.m 含有三种常用采样算法；
S.m 三次卷积采样中的三次多项式函数；
cdSRC.m  基于图像内容的产品质量检测主程序，主要是通过下采样技术与基于类别的稀疏表示分类方法完成基于图像内容的产品质量检测；
cdSRC主程序构架如下：进行数据整合—>数据归一化—>对数据进行LDA数据降维—>进行cdOMP迭代—>运行cdKNN程序—>整合相关度信息和欧氏距离信息—>完成检测
normalize_data.m  用来对原始数据归一化；
lda.m  用来对原始数据进行降维；
cdKNN.m  用来进行cdKNN得到欧氏距离信息；OMP.m  用来在cdOMP过程中得到关于每类的稀疏矩阵，进而求得残差作为相关度信息；


cdOMP.m 和 gradient_descent.m 是用梯度下降法求解cdOMP中的优化公式，速度很慢，接近不能用，但没舍得删，此程序没有用在系统中；
LFDA.m 最开始降维用LFDA，效果不是很好，最终此程序没用在系统中；
select_train_data.m  用来按比例选择训练样本，在此部分没有使用；

# 串口模块操作流程如下：
启动vspd搭建com3和com4通道—>打开模拟串口助手设置自动发送字符以及与本系统匹配相关参数—>点击串口模块“启动”按钮，即可模拟连接、发送、接收操作；
com_ceshi.m  串口模块,运用了serial函数完成串口通讯模拟，包含连接、发送、接收等操作；

# 图像处理主程序启动如下：
点击系统主页面图像处理“启动”按钮即可启动
图标.jpg为本部分测试图像，不可删除
图像处理界面操作流程如下：点击右上角即可“选择图像”，可选取示例图像：图标—>右下角工作框输入相关数据即可完成对图像相关操作—>右上角亦可“保存图像”
Main_Interface:图像处理主程序，包含图像加噪、去噪、增强、边缘检测、频谱图、灰度图、负片、傅里叶谱图等各类操作
isbw:二进制图像判断；
otsu:自动阈值分割法；
