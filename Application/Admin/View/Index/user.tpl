<a type="button" class="btn btn-primary">添加新用户</a>
<br/><br/>
<div id="noticefile" style="display:none" class="alert" role="alert">
</div> 
<div class="table-responsive">
  <table class="table table-striped">
    <thead>
      <tr>
        <th width="30%">用户名</th>
        <th width="40%">邮箱</th>
        <th width="20%">地区</th>
        <th width="5%">修改</th>
        <th width="5%">删除</th>
      </tr>
    </thead>
    <tobdy>
    <volist name="users" id="user" key="k">
      <tr id="user_{$user.id}">
        <td>{$user.username}</td>
        <td>{$user.email}</td>
        <td>{$user.location}</td>
        <td class="text-center"><a href="#" onclick="removeFile({$user.id})"><i class="glyphicon glyphicon-pencil"></i></a></td>
        <td class="text-center"><a href="#" onclick="removeFile({$user.id})"><i class="glyphicon glyphicon-remove"></i></a></td>
      </tr>
    </volist>
    </tobdy>
  </table>
</div>