<%@page import="java.util.List"%>
<%@page import="com.preclaim.models.MailConfigList"%>
<%
List<MailConfigList> pending_config = (List<MailConfigList>) session.getAttribute("pendingConfig");
session.removeAttribute("pendingConfig");
List<String> user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("mailConfig/status");
boolean allow_delete = user_permission.contains("mailConfig/delete");
%>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<!-- <div class="row"> -->
<!-- 	<div class="col-md-12 col-sm-12"> -->
<!-- 		<div class="portlet box"> -->
<!-- 			<div class="portlet-title"> -->
<!-- 				<div class="caption"> -->
<!-- 					<i class="icon-users font-green-sharp"></i> -->
<!-- 					<span class="caption-subject font-green-sharp sbold"> -->
<%-- 						<%= region == null ? "Add " : "Update " %> --%>
<!-- 						Region -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="portlet light bordered"> -->
<!-- 			<div class="portlet-body"> -->
<!-- 				<div id="message_account"></div> -->
<!-- 				<form novalidate id="add_region_form" role="form" method="post" -->
<!-- 					class="form-horizontal"> -->
<!-- 					<div class="row"> -->
<!-- 						<div class="col-md-6"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label class="col-md-4 control-label" for="regionName">Region -->
<!-- 									Name <span class="text-danger">*</span> -->
<!-- 								</label> -->
<!-- 								<div class="col-md-8"> -->
<!-- 									<input type="text" required id="regionName" name="regionName"  -->
<!-- 										class="form-control" placeholder="Region Name" -->
<%-- 										value ="<%= region == null ? "" : region.getRegionName().trim() %>"> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<div class="col-md-offset-4 col-md-8"> -->
<%-- 								<% if(region != null){ %> --%>
<!-- 									<input type="hidden" id="regionId" name="regionId" -->
<%-- 										value = "<%= region.getRegionId()%>"> --%>
<!-- 									<button class="btn btn-info" id="editregionsubmit" -->
<!-- 										onClick="return updateRegion();" type="button">Update</button> -->
<%-- 									<a href="${pageContext.request.contextPath}/region/pending_region" --%>
<!-- 										class="btn btn-danger">Back</a> -->
<%-- 									<% }else{ %>  --%>
<!-- 									<button class="btn btn-info" id="addregionsubmit" -->
<!-- 										onClick="return addRegion();" type="button">Add -->
<!-- 										Region</button> -->
<!-- 									<button class="btn btn-danger" type="reset" value="">Clear</button> -->
<%-- 									<% } %>  --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="portlet box">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-inbox font-green-sharp" style = "font-size:20px"></i> <span
						class="caption-subject font-green-sharp sbold">Pending
						Mail Configuration</span>
				</div>
				<div class="actions">
					<div class="btn-group">
						<a href="${pageContext.request.contextPath}/mailConfig/add"
							data-toggle="tooltip" title="Add" data-original-title="Add New"
							class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip"
							style="margin-right: 5px;"><i class="fa fa-plus"></i>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-primary">
			<div class="box-body">
				<div class="row">
					<div class="col-md-12 table-container">
						<div class="box-body no-padding">
							<table id="pending_config_list"
								class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
								<thead>
									<tr class="tbl_head_bg">
										<th class="head1 no-sort">#</th>
										<th class="head1 no-sort">Username</th>
										<th class="head1 no-sort">Password</th>
										<th class="head1 no-sort">Outgoing SMTP Server</th>
										<th class="head1 no-sort">Outgoing SMTP Port</th>
										<th class="head1 no-sort">Encryption Type</th>
										<th class="head1 no-sort">Status</th>
										<th class="head1 no-sort">Action</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="tbl_head_bg">
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
										<th class="head2 no-sort"></th>
									</tr>
								</tfoot>
								<tbody>
									<%
									if (pending_config != null) {
										int i = 1;
										for (MailConfigList list_config : pending_config) {
									%>
									<tr>
										<td><%=i++%></td>
										<td><%= list_config.getUsername() %></td>
										<td><%= list_config.getPassword() %></td>
										<td><%= list_config.getOutgoingServer() %></td>
										<td><%= list_config.getOutgoingPort() %></td>
										<td><%= list_config.getEncryptionType() %></td>
										<td><span class="label label-sm label-danger">Pending</span></td>
										<td>
										   <a href="${pageContext.request.contextPath}/mailConfig/edit?mailConfigId=<%=list_config.getMailConfigId() %>" 										   										   
										   		data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
										   		<i class="glyphicon glyphicon-edit"></i>
									   		</a> 
											<a href="javascript:;" data-toggle="tooltip" title="Active" onClick="return updateConfigStatus(<%=list_config.getMailConfigId() %>,2,<%=allow_statusChg%>);"
											    class="btn btn-success btn-xs"><i class="glyphicon glyphicon-ok-circle"></i></a> 
											<a href="javascript:;" data-toggle="tooltip" title="Delete" onClick="return deleteConfig('<%=list_config.getMailConfigId()%>',<%=allow_delete %>);"
										        class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></a>
										</td>
									</tr>
									<%
										}
									}
									%>


								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- panel body -->
		</div>
	</div>
	<!-- content -->
</div>
<script type="text/javascript">
$(document).ready(function() {
					
	var i = 0;					 
	$('#pending_config_list tfoot th').each(function() {									
		if (i == 1 || i == 2 || i == 3 || i == 4) 
		{										
			$(this).html('<input type="text" class="form-control" placeholder="" />');										
		}
		else if (i == 5)
		{
			var select_box = "<select class = 'form-control'><option value = 'TLS'>TLS</option>" +
							 "<option value = 'SSL'>SSL</option></select>";
			$(this).html(select_box);
		}
		else if(i == 6)
		{
			var select_box = "<select class = 'form-control'><option value = '1'>Active</option>" +
			 "<option value = '2'>Inactive</option>" +
			 "</select>";
			$(this).html(select_box);
		}
		i++;									
	});

	// DataTable
	var table = $('#pending_config_list').DataTable();

	// Apply the search
	table.columns().every(function() {
	var that = this;
	$('input', this.footer()).on('keyup change',function() 
	{
		if (that.search() !== this.value) {
			that.search(this.value).draw();
		}
	});
										
	$('select', this.footer()).on('change',function()
	{
		if (that.search() !== this.value) {
			that.search(this.value).draw();
		}
	});
									
	});
				
});
// function addRegion() {
<%-- 	<%if(!user_permission.contains("regions/add")){%> --%>
// 		toastr.error("Access Denied","Error");
// 		return false;
<%-- 	<%}%> --%>
// 	var regionName = $('#add_region_form #regionName').val();
// 	if (regionName == '') {
// 		toastr.error('Region Name Cannot be empty', 'Error');
// 		return false;
// 	}
// 	var formdata = {'regionName' : regionName};
// 	$.ajax({		
// 		type : "POST",
// 		url : '${pageContext.request.contextPath}/region/addRegion',
// 		data : formdata,
// 		beforeSend : function() {
// 			$("#addregionsubmit")
// 					.html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
// 			$("#addregionsubmit").prop('disabled', true);
// 		},
// 		success : function(data) {
// 			if (data == "****") {
// 				$("#addregionsubmit").html('Add Region');
// 				$("#addregionsubmit").prop('disabled', false);
// 				toastr.success('Region Added successfully.',
// 						'Success');
// 				$('#add_region_form #regionName').val('');
// 				location.reload();
// 			} else {
// 				toastr.error(data, 'Error');
// 				$("#addregionsubmit").html('Add Region');
// 				$("#addregionsubmit").prop('disabled', false);
// 			}
// 		}
// 	});
// }

// function updateRegion() {
<%-- 	<%if(!user_permission.contains("regions/add")){%> --%>
// 		toastr.error("Access Denied","Error");
// 		return false;
<%-- 	<%}%> --%>
// 	var table2 = $('#pending_region_list').DataTable();
// 	var regionName = $('#add_region_form #regionName').val();
// 	var regionId = $('#add_region_form #regionId').val();
// 	if (regionName == '') {
// 		toastr.error('Region Name Cannot be empty', 'Error');
// 		return false;
// 	}
// 	var formdata = {'regionName' : regionName, 'regionId' : regionId};
// 	$.ajax({
// 		type : "POST",
// 		url : '${pageContext.request.contextPath}/region/updateRegion',
// 		data : formdata,
// 		beforeSend : function() {
// 			$("#editregionsubmit")
// 					.html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
// 			$("#editregionsubmit").prop('disabled', true);
// 		},
// 		success : function(data) {
// 			$("#editregionsubmit").html('Update');
// 			$("#editregionsubmit").prop('disabled', true);
// 			if (data == "****") 
// 			{
// 				$("#editregionsubmit").html('Update');
// 				$("#editregionsubmit").prop('disabled', false);
// 				toastr.success('Region Updated successfully.', 'Success');
// 				location.href ="${pageContext.request.contextPath}/region/pending_region";
// 			} 
// 			else 
// 			{
// 				toastr.error(data, 'Error');
// 				$("#editregionsubmit").html('Update');
// 				$("#editregionsubmit").prop('disabled', false);
// 			}
// 		}
// 	});
// }
</script>