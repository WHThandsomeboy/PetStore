<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="scripts/toastr.css" rel="stylesheet">
 <script src="scripts/jquery-3.3.1.js"></script>
	<script src="scripts/toastr.min.js"></script>
</head>
<body>
<div class="pay">
	<!--主内容开始编辑-->
	<div class="tr_recharge">
		<form action="" class="am-form" id="doc-vld-msg">
			<div class="tr_rechbox">
				<div class="tr_rechhead">
					<img src="images/ys_head2.jpg" /> 
					<p>充值帐号：
						<a>${user.name==null?"无":user.name}</a>
					</p>
					<div class="tr_rechheadcion">
						<img src="images/coin.png" alt="" />
						<span>当前余额：<span id="balance">${user.balance}</span></span>
					</div>				
				</div>
				<input type="hidden" value="${user.id }" id="cid">
				<div class="tr_rechli am-form-group">
					<ul class="ui-choose am-form-group" id="uc_01">
						<li>
							<label class="am-radio-inline">
									<input type="radio"  value="10" name="docVlGender" required data-validation-message="请选择一项充值额度"> 10￥
								</label>
						</li>
						<li>
							<label class="am-radio-inline">
									<input type="radio" value="20" name="docVlGender" data-validation-message="请选择一项充值额度"> 20￥
								</label>
						</li>

						<li>
							<label class="am-radio-inline">
									<input type="radio" value="50" name="docVlGender" data-validation-message="请选择一项充值额度"> 50￥
								</label>
						</li>
						<li>
							<label class="am-radio-inline">
									<input type="radio" name="docVlGender" value="-1" data-validation-message="请选择一项充值额度"> 其他金额
								</label>
						</li>
					</ul>
				</div>
				<div class="tr_rechoth am-form-group">
					<span>其他金额：</span>
					<input type="number" min="10" max="10000" value="10.00元" id="Money" class="othbox" data-validation-message="充值金额范围：10-10000元" />
					<!--<p>充值金额范围：10-10000元</p>-->
				</div>
				<div class="tr_rechcho am-form-group">
					<span>充值方式：</span>
					<label class="am-radio">
							<input type="radio" name="radio1" value="" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="images/wechatpay.png">
						</label>
					<label class="am-radio" style="margin-right:30px;">
							<input type="radio" name="radio1" value="" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="images/zfbpay.png">
						</label>
				</div>
				<div class="tr_rechnum">
					<span>应付金额：</span>
					<p class="rechnum">0.00元</p>
				</div>
			</div>
			<div class="tr_paybox">
				<input type="button" value="确认支付" class="tr_pay am-btn"  id="submit"/>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="js/amazeui.min.js"></script>
<script type="text/javascript" src="js/ui-choose.js"></script>
<script type="text/javascript">
toastr.options = {
		"positionClass" : "toast-top-center"
	}
	// 将所有.ui-choose实例化
	$('.ui-choose').ui_choose();
	// uc_01 ul 单选
	var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
	uc_01.click = function(index, item) {
		console.log('click', index, item.text())
	}
	uc_01.change = function(index, item) {
		console.log('change', index, item.text())
	}
	$(function() {
		$('#uc_01 li:eq(3)').click(function() {
			$('.tr_rechoth').show();
			$('.tr_rechoth').find("input").attr('required', 'true')
			$('.rechnum').text('10.00元');
		})
		$('#uc_01 li:eq(0)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('10.00元');
			$('.othbox').val('');
		})
		$('#uc_01 li:eq(1)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('20.00元');
			$('.othbox').val('');
		})
		$('#uc_01 li:eq(2)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('50.00元');
			$('.othbox').val('');
		})
		$(document).ready(function() {
			$('.othbox').on('input propertychange', function() {
				var num = $(this).val();
				$('.rechnum').html(num + ".00元");
			});
		});
	})

	$(function() {
		$('#doc-vld-msg').validator({
			onValid: function(validity) {
				$(validity.field).closest('.am-form-group').find('.am-alert').hide();
			},
			onInValid: function(validity) {
				var $field = $(validity.field);
				var $group = $field.closest('.am-form-group');
				var $alert = $group.find('.am-alert');
				// 使用自定义的提示信息 或 插件内置的提示信息
				var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

				if(!$alert.length) {
					$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
					appendTo($group);
				}
				$alert.html(msg).show();
			}
		});
	});
	$("#submit").click(function() {
		var m1 = $('input:radio:checked').val();
		if (m1=="-1") {
			m1=$("#Money").val();
		}
		$.ajax({
			type:"post",
			url:"recharge",
			data:{
				money:m1,
				cid:$("#cid").val(),
				total:'${user.balance}',
			},
			success:function(data){
				if(data.isSuccess=="true"){
	                   toastr.success(data.msg);
	                   $("#balance").html(data.msg2);
	                   $("#Balance", parent.document).html(data.msg2);
	                }else{
	                    toastr.error(data.msg);
	                }
			}
		})
	})
</script>
</body>
</html>