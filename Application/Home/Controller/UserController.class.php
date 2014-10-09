<?php
namespace Home\Controller;
use Think\Controller;
class UserController extends Controller {
    public function changepwd() {
        $User = M('User');
        $curId=$_SESSION['authId'];
        $result = $User->find($curId);
        $data = I('post.');
        if(pwdHash($data[password])!=$result[password]) {
            $this->error('当前密码不正确！');
        }else {
            $User->password = pwdHash($data[newpassword]);
            $updateresult = $User->where('id=%s',$curId)->save();
            if(1 == $updateresult)
                $this->success('密码修改成功！');
            else
                $this->error('系统正忙，请重试！');
        }
    }
}