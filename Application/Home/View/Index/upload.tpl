<h4 id="transitions" class="page-header">上传文件</h4>

<form class="form-horizontal" role="form" action="upload" enctype="multipart/form-data" method="post">
  <div class="form-group">
    <label for="inputFileName" class="col-sm-2 control-label">文件名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputFileName" name="fileName" placeholder="请输入文件名，如：2014_Q1_Lesson_Plan" />
    </div>
  </div>
  <div class="form-group">
    <label for="inputFilePath" class="col-sm-2 control-label">文件路径</label>
    <div class="col-sm-10">
      <input type="file" class="form-control" id="inputFilePath" name="fileUpload" placeholder="请选择文件" />
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">提交</button>
    </div>
  </div>
</form>