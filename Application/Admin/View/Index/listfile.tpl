<script>
function removeFile(attach_id){
    if (window.confirm('确实要删除选择项吗？'))
    {
        $.ajax({
            type: 'POST',
            url: "{:U('Index/deletefile')}",
            data: {id:attach_id},
            dataType: 'json',
            success: function(data) {
                result = data;
                if( 1 != result['status']) {
                    $('#noticefile').removeClass('alert-success').addClass("alert-danger");
                    $('#noticefile').html(result['info']);
                    $('#noticefile').fadeIn().delay(800).fadeOut(1500);          
                }else {
                    $('#attach_'+result['attach_id']).remove();
                    $('#noticefile').removeClass('alert-danger').addClass("alert-success");
                    $('#noticefile').html(result['info']);
                    $('#noticefile').fadeIn().delay(800).fadeOut(1500);
                }
            }
        });
    }
}
</script>
<div id="noticefile" style="display:none" class="alert" role="alert">
</div> 
<div class="table-responsive">
  <table class="table table-striped">
    <thead>
      <tr>
        <th width="50%">文件名</th>
        <th width="20%">最新修改时间</th>
        <th width="25%">上传用户</th>
        <th width="5%">下载</th>
      </tr>
    </thead>
    <tobdy>
    <volist name="attaches" id="attach" key="k">
      <tr id="attach_{$attach.id}">
        <td>{$attach.savename}</td>
        <td>{$attach.update_time|date="Y-m-j H:i:s",###}</td>
        <td>{$attach.username}</td>
        <td class="text-center"><a href="__APP__/Uploads/{$attach.savepath}{$attach.savename}"><i class="glyphicon glyphicon-download-alt"></i></a></td>
      </tr>
    </volist>
    </tobdy>
  </table>
</div>