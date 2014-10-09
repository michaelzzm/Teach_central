<script>
  function changepwd() {
    msg = '';
    if($('#curpas').val()==''||$('#newpas').val()==''||$('#duppas').val()==''){
      msg = '密码不能为空！';
    }else if($('#newpas').val()!=$('#duppas').val()) {
      msg = '两次输入的内容不一致！';
    }else {
      $.ajax({
        type: 'POST',
        url: "{:U('Home/User/changepwd')}",
        data: {password:$('#curpas').val(),newpassword:$('#newpas').val()},
        dataType: 'json',
        success: function(data) {
          result = data;
          if( 1 != result['status']) {
            msg = result['info'];
            $('#noticepwd').removeClass('alert-success').addClass("alert-danger");
            $('#noticepwd').html(msg).fadeIn().delay(800).fadeOut(1500);
          }else{
            msg = result['info'];
            $('#noticepwd').removeClass('alert-danger').addClass("alert-success");
            $('#noticepwd').html(msg).fadeIn().delay(800).fadeOut(500).queue(function(){
              $('#modelChangePWD').modal('hide');
            });
          }
        }
      });
    }
    if(msg!='') {
      $('#noticepwd').removeClass('alert-success').addClass("alert-danger");
      $('#noticepwd').html(msg).fadeIn().delay(800).fadeOut(1500);
    }
  }
</script>
<div class="modal fade" id="modelChangePWD" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <form action="{:U('User/changepwd')}">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title" id="myModalLabel">修改密码</h4>
      </div>
      <div class="modal-body">
        <div id="noticepwd" style="display:none" class="alert" role="alert">
        </div> 
        <div class="form-group">
          <label for="curpas">当前密码</label>
          <input type="password" class="form-control" id="curpas" placeholder="请输入当前密码" value="123456">
        </div>
        <div class="form-group">
          <label for="newpas">新密码</label>
          <input type="password" class="form-control" id="newpas" placeholder="请输入新密码" value="123458">
        </div>
        <div class="form-group">
          <label for="curpas">重复密码</label>
          <input type="password" class="form-control" id="duppas" placeholder="请重复新密码"  value="123458">
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="changepwd()">修改</button>
      </div>
    </div>
    </form>
  </div>
</div>

<div class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">展开导航</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <p class="navbar-text" style="color:#333"><strong>教学部互动平台 - 管理员平台</strong></p>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
      <?php
        if(isset($_SESSION['authId'])) {
      ?>
        <li style="background-color:#428bca;" class="dropdown">
          <a style="color:#fff;background-color:#428bca;" href="#" class="dropdown-toggle" data-toggle="dropdown">{$_SESSION['account']}&nbsp;<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a data-toggle="modal" data-target="#modelChangePWD" href="#">修改密码</a></li>
            <li class="divider"></li>
            <li><a href="{:U('Home/Index/logout')}">登出</a></li>
          </ul>
        </li>
      <?php
        } else {
      ?>
        <li style="background-color:#777"><a href="#" style="color:#fff" data-toggle="modal" data-target="#SignupModal"><strong>登录</strong></a></li>
      <?php } ?>
      </ul>
    </div>
  </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
        <?php
        if(!isset($_SESSION['authId'])) {
        ?>
            <ul class="nav nav-sidebar">
                <li <?php echo isActive($_SERVER[PHP_SELF], 'index'); ?> ><a href="{:U('Index/index')}"><i class="glyphicon glyphicon-cog"></i>&nbsp;&nbsp;公告</a></li>
            </ul>
        <?php 
        } else {
        ?>
            <ul class="nav nav-sidebar">
                <li <?php echo isActive($_SERVER[PHP_SELF], 'user'); ?> ><a href="{:U('Index/user')}"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;学员管理</a></li>
                <li <?php echo isActive($_SERVER[PHP_SELF], 'listfile'); ?> ><a href="{:U('Index/listfile')}"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;所有教学计划</a></li>
            </ul>
        <?php } ?>
        </div><!--sidebar-->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            
        <!--</div>
    </div>
</div>-->


<div class="modal fade" id="SignupModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title"><strong>登 录</strong></h4>
      </div>
      <form class="loginForm" role="form" id="loginform" method="post">
      <div class="modal-body">
        <div class="row">
            <div class="col-sm-12">
            <div id="notice" style="display:none" class="alert" role="alert">
            </div> 
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" id="username" value="michael" class="form-control" placeholder="用户名">
                </div>
                <br/>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="text" id="pwd" value="123456" class="form-control" placeholder="密码">
                </div>
                <!--<div class="checkbox">
                <label>
                <input id="inputRememberme" name="inputRememberme" type="checkbox" value="1"> 记住登录 </label>
                </div>-->
            </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <div class="container-fluid">
            <div class="row">
                <a id="login" class="btn btn-info">登录</a>
            </div>
        </div>
      </div>
      </form>
    </div><!-- /.SignupModal-content -->
  </div><!-- /.SignupModal-dialog -->
</div><!-- /.SignupModal -->