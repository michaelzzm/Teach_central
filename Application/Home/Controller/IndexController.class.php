<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    // 检查用户是否登录
    protected function checkUser() {
        if(!islogged()) {
            $this->error('没有登录', __APP__);
        }
    }

    public function index() {        
        $this->display();
    }

    public function login() {
        $postdata = I('post.');
        $User = M('User');

        $authInfo = $User->where("username='%s' and status=1", $postdata[username])->find();
        if(!isset($authInfo)) {
            $this->error('帐号不存在或已禁用！'); 
        }
        else {
            if($authInfo[password] != pwdHash($postdata[password])) {
                $this->error('密码错误！');
            }
            saveSession($authInfo);
            $ip     = get_client_ip();
            $time   = time();
            $data   = array();
            
            $data['id'] =   $authInfo['id'];
            $data['last_login_time']    =   $time;
            $data['last_login_ip']  =   $ip;
            $User->save($data);
            $User->where('id=%s',$authInfo['id'])->setInc('login_count');
            if(!isUser())
                $this->success('登录成功！','Admin/Index/index');
            else
                $this->success('登录成功！','Index/upload'); 
        }
    }

    public function logout() {
        unset($_SESSION);
        session_destroy();
        redirect(__APP__);
    }

    public function upload() {
        $this->checkUser();
        $data = I('post.');
        if(!empty($data)) {
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   = 3145728 ;// 设置附件上传大小
            $upload->exts      = array('pdf');// 设置附件上传类型
            $upload->rootPath  = './Uploads/'; // 设置附件上传根目录
            $upload->saveName  = $data[fileName];
            $upload->replace   = true;
            $upload->savePath  =     ''; // 设置附件上传（子）目录
            $upload->subName   = $_SESSION['account'];
            // 上传文件 
            $info   =   $upload->upload();
            if(!$info) {// 上传错误提示错误信息
                $this->error($upload->getError());
            }else{// 上传成功

                //保存登录信息
                $file_crtm = time();
                $info = $info['fileUpload'];
                $Attach = M('Attach');
                $file = array();
                $file['name'] = $info['name'];
                $file['type'] = $info['type'];
                $file['size'] = $info['size'];
                $file['extension'] = $info['ext'];
                $file['savepath'] = $info['savepath'];
                $file['savename'] = $info['savename'];
                $file['user_id'] = $_SESSION['authId'];
                $file['create_time'] = $file_crtm;
                $file['hash'] = $info['md5'];
                $file['version'] = 0;
                $file['update_time'] = $file_crtm;
                $file['status'] = 1;

                $result = $Attach->add($file);

                if(false !== $result) {
                    $this->success('资料修改成功！');
                }else{
                    $this->error('资料修改失败!');
                }

                //$this->success('上传成功！');
            }
        }
        $this->display();
    }

    public function listfile() {
        $this->checkUser();
        $authUser = $_SESSION;
        $Attach = M('Attach');
        $Attaches = $Attach->where("user_id='%s'", $authUser[authId])->select();
        $this->assign('attaches',$Attaches);
        $this->display();
    }

    public function deletefile($id) {
        $Attach = M('Attach');
        $file = $Attach->find($id);
        //dump($_SERVER);
        $filepath = $_SERVER[DOCUMENT_ROOT].__ROOT__."/Uploads/".$file[savepath].$file[savename];
        if(file_exists($filepath)){
            if(unlink($filepath)) {
                $Attach->delete();

                $data['info']       =   "文件已删除！"; // 提示信息内容
                $data['status']     =   1;  // 状态 如果是success是1 error 是0
                $data['url']        =   ''; // 成功或者错误的跳转地址
                $data['attach_id']  =   $id;

                $this->ajaxReturn($data);
            }
            else {
                $this->error('文件未删除，请重新删除！');
            }
        }   
        else {
            $this->error('文件不存在！');
        }
    }
}