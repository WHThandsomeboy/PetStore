<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>宠物信息编辑</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="src/css/layui.css"  media="all">
    <link href="scripts/toastr.css" rel="stylesheet">
    <script src="scripts/jquery-3.3.1.js"></script>
	<script src="scripts/toastr.min.js"></script>
</head>
<body>
<br/>
<div style="width: 400px;height: auto">
<form class="layui-form" lay-filter="addpet">
    <div class="layui-form-item">
        <label class="layui-form-label">宠物品种：</label>
        <div class="layui-input-block">
            <select name="cid">
                <option value="1">猫</option>
                <option value="2">犬</option>
                <option value="3">鸟</option>
                <option value="4">鱼</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宠物名称：</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宠物特征：</label>
        <div class="layui-input-block">
            <input type="text" name="tag" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <label class="layui-form-label">宠物图片：</label>
   <div class="layui-upload-drag" id="test10">
  <i class="layui-icon"></i>
  <p>点击上传，或将文件拖拽到此处</p>
  <div class="layui-hide" id="uploadDemoView">
    <hr>
    <img src="" alt="上传成功后渲染" style="max-width: 196px">
  </div>
</div>
    <div class="layui-form-item">
        <label class="layui-form-label">宠物重量：</label>
        <div class="layui-input-inline">
            <input type="text" name="weight" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宠物价格：</label>
        <div class="layui-input-inline">
            <input type="text" name="price" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">宠物库存：</label>
        <div class="layui-input-inline">
            <input type="text" name="stock"  placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div> 
    <div class="layui-form-item">
        <label class="layui-form-label">宠物score：</label>
        <div class="layui-input-block">
            <input type="text" name="score" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否出售：</label>
        <div class="layui-input-block">
            <input type="text" name="is_offsale" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
        </div>
    </div> 
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">宠物描述：</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="description" style="height: 200px"></textarea>
        </div>
    </div> 
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn"  id="submit">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>
<script src="src/layui.js" charset="utf-8"></script>
<script>
toastr.options = {
		"positionClass" : "toast-top-center"
	}
layui.use('form', function(){
    var form = layui.form;
    form.render();
});
    $("#submit").click(function () {
        var name=$("input[name='name']").val();
        var tag=$("input[name='tag']").val();
        var description=$("textarea[name='description']").val();
        var cid=$("select[name='cid']").val();
        var price=$("input[name='price']").val();
        var stock=$("input[name='stock']").val();
        var img=$("input[name='img']").val();
        var weight=$("input[name='weight']").val();
        var score=$("input[name='score']").val();
        var is_offsale=$("input[name='is_offsale']").val();
        $.ajax({
            url:"./addpet",
            type:'post',
            data:{
                'name':name,
                'tag':tag,
                'description':description,
                'cid':cid,
                'price':price,
                'stock':stock,
                'img':$('img').attr('src'),
                'weight':weight,
                'score':score,
                'is_offsale':is_offsale,
                
            },
            success:function(data){
                if(data.isSuccess=="true"){
                   toastr.success(data.msg);
                }else{
                    toastr.error(data.msg);
                }

            }
        });
    });
  //拖拽上传
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;
    upload.render({
      elem: '#test10'
      ,url: 'uploadImg' 
      ,done: function(res){
        layer.msg('上传成功');
        layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', 'petImg/'+res.msg);//删除hide,修改img路径,显示上传过的图片
        console.log(res)
      }
    });
    });

</script>
</body>
</html>
