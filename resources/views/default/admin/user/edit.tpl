{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			用户编辑 #{$user->id}


			<small>Edit User</small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div id="msg-success" class="alert alert-success alert-dismissable" style="display: none;">
					<button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
					<h4>
					<i class="icon fa fa-info"></i> 成功!</h4>

						<p id="msg-success-p"></p>
					</div>
					<div id="msg-error" class="alert alert-warning alert-dismissable" style="display: none;">
						<button type="button" class="close" id="error-close" aria-hidden="true">&times;</button>
						<h4>
						<i class="icon fa fa-warning"></i> 出错了!</h4>

							<p id="msg-error-p"></p>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-body">
								<div class="form-horizontal">

									<fieldset class="col-sm-6">
										<div class="row">
											<legend>帐号信息<small>({$user->user_name})</small></legend>


											<div class="form-group">
												<label class="col-sm-3 control-label">邮箱</label>

												<div class="col-sm-9">
													<input class="form-control" id="email" type="email" value="{$user->email}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">密码</label>

												<div class="col-sm-9">
													<input class="form-control" id="pass" value="" placeholder="不修改时留空">


												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">是否管理员</label>


												<div class="col-sm-9">
													<select class="form-control" id="is_admin">
														<option value="0" {if $user->is_admin==0}selected="selected"{/if}>
															否
														</option>
														<option value="1" {if $user->is_admin==1}selected="selected"{/if}>
															是
														</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">用户状态</label>


												<div class="col-sm-9">
													<select class="form-control" id="enable">
														<option value="1" {if $user->enable==1}selected="selected"{/if}>
															正常

														</option>
														<option value="0" {if $user->enable==0}selected="selected"{/if}>
															禁用

														</option>
													</select>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">账户过期时间</label>


												<div class="col-sm-9">
												  <input class="form-control" id="expire_at" type="date" value="{$user->expire_at}">													
												</div>
											</div>
											
											<div class="form-group">
											  <label class="col-sm-3 control-label" for="user_class"><p Title="用户只能访问用户等级大于等于节点类别的节点">用户等级</p></label>


											  <div class="col-sm-9">
												  <input class="form-control" id="user_class" type="number" value="{$user->user_class}">
											  </div>
										 </div>
											
										<div class="form-group">
											<label class="col-sm-3 control-label" for="node_group"><p Title="用户只能访问用户所属节点群组和节点群组为0的节点">用户群组</p></label>


											<div class="col-sm-9">
												<input class="form-control" id="node_group" type="number" value="{$user->node_group}">
											</div>
										</div>
										<div class="form-group">
											<label for="info" class="col-md-3 control-label bold">联系方式</label>


											<div class="col-md-9">
												<textarea class="form-control" id="contact" rows="2">{$user->contact}</textarea>
											</div>
										</div>
										
										</div>

										<div class="row">
											<legend>流量</legend>

											<div class="form-group">
												<label class="col-sm-3 control-label">总流量</label>

												<div class="col-sm-9">
													<div class="input-group">
														<input class="form-control" id="transfer_enable" type="number" value="{$user->enableTrafficInGB()}">
														<div class="input-group-addon">GiB</div>
													</div>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">已用流量</label>


												<div class="col-sm-9">
													<input class="form-control" id="traffic_usage" type="text" value="{$user->usedTraffic()}" readonly>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label"><p Title="默认0为不重置流量，其他数字表示系统会在该日将已使用流量重置为0">自动重置流量日</p></label>
												
												<div class="col-sm-9">
													<div class="input-group">
														<input class="form-control" id="auto_reset_day" type="number" value="{$user->auto_reset_day}">
														<div class="input-group-addon">日</div>
													</div>
												</div>
											</div>
											
										</div>
										<div class="row">
											<legend>邀请</legend>

											<div class="form-group">
												<label class="col-sm-3 control-label">可用邀请数量</label>


												<div class="col-sm-9">
													<input class="form-control" id="invite_num" type="number" value="{$user->invite_num}">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">邀请人ID</label>

												<div class="col-sm-9">
													<input class="form-control" id="ref_by" type="number"
													value="{$user->ref_by}" readonly>
												</div>
											</div>
										</div>
									</fieldset>

									<fieldset class="col-sm-6" >
										<legend>ShadowsocksR连接信息</legend>


										<div class="form-group">
											<label class="col-sm-3 control-label">连接端口</label>


											<div class="col-sm-9">
												<input class="form-control" id="port" type="number" value="{$user->port}">
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 control-label">连接密码</label>


											<div class="col-sm-9">
												<input class="form-control" id="passwd" value="{$user->passwd}">
											</div>
										</div>

										<div class="form-group">
											<label for="protocol" class="col-sm-3 control-label">协议插件</label>


											<div class="col-sm-9">
												<select class="form-control" id="protocol" onchange="disprotocolparam();">
													<option value="origin" {if $user->protocol=="origin"}selected="selected"{/if}>origin</option>
													<option value="verify_deflate" {if $user->protocol=="verify_deflate"}selected="selected"{/if}>verify_deflate</option>
													<option data-subtext="推荐" value="auth_sha1_v4" {if $user->protocol=="auth_sha1_v4"}selected="selected"{/if}>auth_sha1_v4</option>
													<option value="auth_sha1_v4_compatible" {if $user->protocol=="auth_sha1_v4_compatible"}selected="selected"{/if}>auth_sha1_v4_compatible</option>
													<option data-subtext="推荐" value="auth_aes128_md5" {if $user->protocol=="auth_aes128_md5"}selected="selected"{/if}>auth_aes128_md5</option>
													<option data-subtext="推荐" value="auth_aes128_sha1" {if $user->protocol=="auth_aes128_sha1"}selected="selected"{/if}>auth_aes128_sha1</option>
													<option data-subtext="推荐" value="auth_chain_a" {if $user->protocol=="auth_chain_a"}selected="selected"{/if}>auth_chain_a</option>
													<option data-subtext="推荐" value="auth_chain_b" {if $user->protocol=="auth_chain_b"}selected="selected"{/if}>auth_chain_b</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 control-label" for="protocol_param">协议参数</label>


											<div class="col-sm-9">
												<input class="form-control" id="protocol_param" type="text" value="{$user->protocol_param}" {if $user->protocol != "auth_chain_a" && $user->protocol != "auth_chain_b" && $user->protocol != "auth_sha1_v4" && $user->protocol != "auth_aes128_md5" && $user->protocol != "auth_aes128_sha1"} disabled="disabled" {/if}>
											</div>
										</div>

										<div class="form-group">
											<label for="obfs" class="col-sm-3 control-label">混淆插件</label>


											<div class="col-sm-9">
												<select class="form-control" id="obfs" onchange="disobfsparam();">
													<option data-subtext="推荐" value="plain" {if $user->obfs=="plain"}selected="selected"{/if}>plain</option>
													<option value="http_post" {if $user->obfs=="http_post"}selected="selected"{/if}>http_post</option>
													<option value="http_post_compatible" {if $user->obfs=="http_post_compatible"}selected="selected"{/if}>http_post_compatible</option>
													<option data-subtext="推荐" value="http_simple" {if $user->obfs=="http_simple"}selected="selected"{/if}>http_simple</option>
													<option value="http_simple_compatible" {if $user->obfs=="http_simple_compatible"}selected="selected"{/if}>http_simple_compatible</option>
													<option value="random_head" {if $user->obfs=="random_head"}selected="selected"{/if}>random_head</option>
													<option data-subtext="推荐" value="tls1.2_ticket_auth" {if $user->obfs=="tls1.2_ticket_auth"}selected="selected"{/if}>tls1.2_ticket_auth</option>
													<option value="tls1.2_ticket_auth_compatible" {if $user->obfs=="tls1.2_ticket_auth_compatible"}selected="selected"{/if}>tls1.2_ticket_auth_compatible</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 control-label" for="obfs_param">混淆参数</label>


											<div class="col-sm-9">
												<input class="form-control" id="obfs_param" type="text" value="{$user->obfs_param}" {if $user->obfs != "http_simple" && $user->obfs != "http_post"} disabled="disabled"{/if}>
											</div>
										</div>

										<div class="form-group">
											<label for="method" class="col-sm-3 control-label">加密方式</label>


											<div class="col-sm-9">
												<select class="form-control" id="method">
													<option value="none" {if $user->protocol !="auth_chain_a" && $user->protocol !="auth_chain_b"} data-subtext="协议插件为:auth_chain_a或auth_chain_b时可用" disabled="disabled"{/if} {if $user->method=="none"}selected="selected"{/if}>none</option>
													<option value="table" {if $user->method=="table"}selected="selected"{/if}>table</option>
													<option value="aes-128-cfb" {if $user->method=="aes-128-cfb"}selected="selected"{/if}>aes-128-cfb</option>
													<option value="aes-192-cfb" {if $user->method=="aes-192-cfb"}selected="selected"{/if}>aes-192-cfb</option>																
													<option data-subtext="推荐" value="aes-256-cfb" {if $user->method=="aes-256-cfb"}selected="selected"{/if}>aes-256-cfb</option>
													<option value="aes-128-ctr" {if $user->method=="aes-128-ctr"}selected="selected"{/if}>aes-128-ctr</option>
													<option value="aes-192-ctr" {if $user->method=="aes-192-ctr"}selected="selected"{/if}>aes-192-ctr</option>																
													<option value="aes-256-ctr" {if $user->method=="aes-256-ctr"}selected="selected"{/if}>aes-256-ctr</option>																
													<option value="bf-cfb" {if $user->method=="bf-cfb"}selected="selected"{/if}>bf-cfb</option>
													<option value="camellia-128-cfb" {if $user->method=="camellia-128-cfb"}selected="selected"{/if}>camellia-128-cfb</option>
													<option value="camellia-192-cfb" {if $user->method=="camellia-192-cfb"}selected="selected"{/if}>camellia-192-cfb</option>
													<option value="camellia-256-cfb" {if $user->method=="camellia-256-cfb"}selected="selected"{/if}>camellia-256-cfb</option>
													<option value="rc4-md5" {if $user->method=="rc4-md5"}selected="selected"{/if}>rc4-md5</option>
													<option value="rc4-md5-6" {if $user->method=="rc4-md5-6"}selected="selected"{/if}>rc4-md5-6</option>
													<option value="salsa20" {if $user->method=="salsa20"}selected="selected"{/if}>salsa20</option>
													<option data-subtext="推荐" value="chacha20" {if $user->method=="chacha20"}selected="selected"{/if}>chacha20</option>
													<option data-subtext="推荐" value="chacha20-ietf" {if $user->method=="chacha20-ietf"}selected="selected"{/if}>chacha20-ietf</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label for="method" class="col-sm-3 control-label"><p Title="是否允许用户自己修改加密方式">自定义加密</p></label>


											<div class="col-sm-9">
												<select class="form-control" id="custom_method">
													<option value="0" {if $user->custom_method==0}selected="selected"{/if}>不支持</option>

													<option value="1" {if $user->custom_method==1}selected="selected"{/if}>支持</option>

												</select>
											</div>
										</div>

										<div class="form-group">
											<label for="custom_rss" class="col-sm-3 control-label"><p Title="是否允许用户自己修改协议及混淆">自定义协议&混淆</p></label>


												<div class="col-sm-9">
													<select class="form-control" id="custom_rss">
														<option value="0" {if $user->custom_rss==0}selected="selected"{/if}>不支持</option>

														<option value="1" {if $user->custom_rss==1}selected="selected"{/if}>支持</option>

													</select>
												</div>
											</div>
											
											
																						
										</fieldset>

									</div>
								</div>
								<!-- /.box-body -->

							</div>
						</div>
						<!-- /.box -->
						
								<div class="box-footer">
									<button type="submit" id="submit" name="action" value="add" class="btn btn-primary">修改</button>

								</div>	
													
					</div>
					<!-- /.row -->
				</section>
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->

			<script>
				$(document).ready(function () {
					function submit() {
						$.ajax({
							type: "PUT",
							url: "/admin/user/{$user->id}",
							dataType: "json",
							data: {
								email: $("#email").val(),
								pass: $("#pass").val(),
								port: $("#port").val(),
								passwd: $("#passwd").val(),
								transfer_enable: $("#transfer_enable").val(),
								auto_reset_day: $("#auto_reset_day").val(),
								invite_num: $("#invite_num").val(),
								protocol: $("#protocol").val(),
								protocol_param: $("#protocol_param").val(),
								obfs: $("#obfs").val(),
								/*obfs_param: $("#obfs_param").val(),*/
								method: $("#method").val(),
								custom_method: $("#custom_method").val(),
								custom_rss: $("#custom_rss").val(),
								user_class: $("#user_class").val(),
								node_group: $("#node_group").val(),
								contact: $("#contact").val(),
								enable: $("#enable").val(),
								expire_at: $("#expire_at").val(),
								is_admin: $("#is_admin").val(),
								ref_by: $("#ref_by").val()
							},
							success: function (data) {
								if (data.ret) {
									$("#msg-error").hide(100);
									$("#msg-success").show(100);
									$("#msg-success-p").html(data.msg);
									window.setTimeout("location.href='/admin/user'", 2000);
								} else {
									$("#msg-error").hide(10);
									$("#msg-error").show(100);
									$("#msg-error-p").html(data.msg);
								}
							},
							error: function (jqXHR) {
								$("#msg-error").hide(10);
								$("#msg-error").show(100);
								$("#msg-error-p").html("发生错误：" + jqXHR.status);


							}
						});
					}

					$("html").keydown(function (event) {
						if (event.keyCode == 13) {
							login();
						}
					});
					$("#submit").click(function () {
						submit();
					});
					$("#ok-close").click(function () {
						$("#msg-success").hide(100);
					});
					$("#error-close").click(function () {
						$("#msg-error").hide(100);
					});
				})
			</script>

			<script>
				function disprotocolparam()
				{
					var protocol = document.getElementById("protocol");
					if (protocol.value == "auth_chain_a" || protocol.value == "auth_chain_b" || protocol.value == "auth_sha1_v4" || protocol.value == "auth_aes128_md5" || protocol.value == "auth_aes128_sha1"){
						document.getElementById("protocol_param").disabled=false
					} else {
						document.getElementById("protocol_param").disabled=true
					}
				}
			</script>

			<script>
				function disobfsparam()
				{
					var protocol = document.getElementById("obfs");
					if (obfs.value == "http_simple" || obfs.value == "http_post"){
						document.getElementById("obfs_param").disabled=false
					} else {
						document.getElementById("obfs_param").disabled=true
					}
				}
			</script>

			{include file='admin/footer.tpl'}
