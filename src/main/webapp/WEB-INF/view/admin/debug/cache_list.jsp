<%@page import="com.blog.comm.util.DateUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../base/title.jsp" />

<body data-type="widgets">
	<script src="../assets/js/theme.js"></script>
	<div class="am-g tpl-g">
		<!-- 头部 -->
		<jsp:include page="../base/header.jsp" />
		<jsp:include page="../base/left.jsp" />
		<!-- 内容区域 -->
		<div class="tpl-content-wrapper">
			<div class="row-content am-cf">
				<div class="row">
					<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
						<div class="widget am-cf">
							<div class="widget-head am-cf">
								<div class="widget-title  am-cf">缓存列表</div>
							</div>
							<div class="widget-body  am-fr">
								<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
									<div
										class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
										<input type="text" class="am-form-field" placeholder="请输入缓存KEY" id="cacheKey"> <span
											class="am-input-group-btn">
											<button
												class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-trash"
												type="button" onclick="delCacheTrigger()">清理缓存</button>
										</span>
									</div>
								</div>
								<div class="widget-head am-cf">
								<div class="widget-title  am-cf"></div>
							</div>
								<div class="am-u-sm-12">
									<table width="100%"
										class="am-table am-table-compact am-table-striped tpl-table-black "
										id="example-r">
										<thead>
											<tr>
												<th>KEY</th>
												<th>数目</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${entitys }" var="entity">
											<tr class="even gradeC">
												<td>${entity.fieldValue }</td>
												<td>${entity.cacheNum }</td>
												<td>
													<div class="tpl-table-black-operation">
														<a href="javascript:delCache('${entity.fieldValue }')"
															class="tpl-table-black-operation"> <i
															class="am-icon-trash"></i> 清理缓存
														</a>
													</div>
												</td>
											</tr>
											</c:forEach>
											<!-- more data -->
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../assets/js/amazeui.min.js"></script>
	<script src="../assets/js/amazeui.datatables.min.js"></script>
	<script src="../assets/js/dataTables.responsive.min.js"></script>
	<script src="../assets/js/app.js"></script>
	<script>
	function delCache(key) {
		if (!confirm("该KEY所有缓存都将清理,是否继续?")) {
			return;
		}
		$.ajax({
			type : "POST",
			dataType : 'json',
			data : 'key=' + key,
			url : 'cacheClean.${suffix}',
			timeout : 60000,
			success : function(json) {
				alert(json.msg);
			},
			error : function() {
				alert("系统繁忙");
			}

		});
	}
	function delCacheTrigger() {
		var key=$("#cacheKey").val();
		delCache(key);
	}
	</script>
</body>
<style>
.t4 {
	font: 1.2rem 宋体;
	color: #800000;
}
</style>
</html>