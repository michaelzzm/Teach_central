<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    // 检查用户是否登录
    protected function checkUser() {
        if(islogged()&&isUser()) {
            $this->error('没有权限', __APP__);
        }
        if(!islogged()) {
            //$this->error('没有登录', 'Admin-Index/index');
            $this->redirect('Index/index');
        }
    }

    public function index() {
        $this->display();
    }

    public function listfile() {
        $this->checkUser();
        $authUser = $_SESSION;
        $Attach = M('Attach');
        $Attaches = $Attach->join('tc_user ON tc_user.id = tc_attach.user_id')->select();
        $this->assign('attaches',$Attaches);
        $this->display();
    }

    public function user() {
        $this->checkUser();
        $User = M('User');
        $Users = $User->where('group_id=3')->select();
        $this->assign('users',$Users);
        $this->display();
    }
}