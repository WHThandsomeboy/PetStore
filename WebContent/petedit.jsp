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
     <link href="css/dropzone.min.css" rel="stylesheet">
    <script src="scripts/jquery-3.3.1.js"></script>
	<script src="scripts/toastr.min.js"></script>
	<script src="js/dropzone.min.js"></script>
</head>
<body>
<br/>
<div style="width: 400px;height: auto">
<form class="layui-form" lay-filter="petedit">
<div style="width: 400px;height: auto">
<div class="layui-form-item">
        <label class="layui-form-label">宠物品种：</label>
        <div class="layui-input-block">
            <select name="cid">
                <option value="1">猫</option>
                <option value="2">狗</option>
                <option value="3">鸟</option>
                <option value="4">鱼</option>
            </select>
        </div>
    </div>
    <input type="hidden" name="id">
    <div class="layui-form-item">
        <label class="layui-form-label">宠物名称：</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">宠物特征：</label>
        <div class="layui-input-block">
            <input type="text" name="tag" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
<label class="layui-form-label">宠物图片：</label>
   <div class="layui-upload-drag" id="test10">
       <i class="layui-icon"></i>
        <p>点击上传宠物图片,或将图片拖拽到此处</p>
        <div id="uploadDemoView">
            <hr>
            <img src="petImg/${pet.img}" name="petImg" alt="上传成功后渲染" style="height: 150px ">
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

        form.val("petedit", {
            id:"${pet.id}"
            ,name: "${pet.name}"
            ,tag: "${pet.tag}"
            ,description: "${pet.description}"
            ,cid: "${pet.c_id}"
            ,price: "${pet.price}"
            ,stock: "${pet.stock}"
            ,weight:"${pet.weight}"
        });

        form.render(); //更新全部
    });

    $("#submit").click(function () {
        console.info("111");
        var id=$("input[name='id']").val();
        var name=$("input[name='name']").val();
        var tag=$("input[name='tag']").val();
        var description=$("textarea[name='description']").val();
        var cid=$("select[name='cid']").val();
        var price=$("input[name='price']").val();
        var stock=$("input[name='stock']").val();
        var weight=$("input[name='weight']").val();
        var imgPath=$('img').attr('src');
        $.ajax({
            url:'./updatepet',
            type:'post',
            data:{
                'id':id,
                'name':name,
                'tag':tag,
                'description':description,
                'cid':cid,
                'price':price,
                'stock':stock,
                'weight':weight,
                'imgpath':imgPath
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
        layui.$('#uploadDemoView').find('img').attr('src', 'petImg/'+res.msg);//修改img路径,显示上传过的图片
        console.log(res)
      }
    });
    });
</script>
</body>
</html>
