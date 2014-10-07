<?php
/* 密码处理 */
function pwdHash($password,$type='sha1') {
    return hash($type,$password);
}

function isLogged() {
    return isset($_SESSION['authId']);
}

function saveSession($authInfo) {
    $info = $authInfo;
    $_SESSION['authId']   = $info['id'];
    $_SESSION['account']  = $info['username'];
    if (0 == $info['group_id'])
        $_SESSION['type'] = 'users';
    else if (1 == $info['group_id'])
        $_SESSION['type'] = 'super';
    else
        $_SESSION['type'] = 'admin';
}

function make_safe($variable) {
    $variable = mysql_real_escape_string(trim($variable));
    return $variable;
}

function isActive($curURL, $keyword) {
    if(strpos(strtolower($curURL),$keyword)>0)
        return 'class="active"';
    else
        return '';
}
?>