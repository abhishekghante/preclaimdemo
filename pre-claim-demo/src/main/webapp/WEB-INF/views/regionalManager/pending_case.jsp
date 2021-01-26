<%@page import="javax.print.attribute.standard.OutputDeviceAssigned"%>
<%@page import="com.preclaim.models.CaseDetailList"%>
<%@page import="java.util.List" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "com.preclaim.models.Region" %>
<%@page import = "com.preclaim.models.IntimationType" %>
<%@page import = "com.preclaim.models.Channel" %>
<%
List<String>user_permission=(List<String>)session.getAttribute("user_permission");
boolean allow_statusChg = user_permission.contains("messages/status");
boolean allow_delete = user_permission.contains("messages/delete");
List<CaseDetailList> pendingCaseDetailList = (List<CaseDetailList>)session.getAttribute("pendingCaseDetailList");
session.removeAttribute("pendingCaseDetailList");
%>
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<div class="row">
  <div class="col-xs-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
            <i class="icon-users font-green-sharp"></i>
            <span class="caption-subject font-green-sharp sbold">Case Lists</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/resources/messages/add" data-toggle="tooltip" title="Add" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Add New">
                <i class="fa fa-plus"></i>
              </a>
            </div>
        </div>
      </div>
    </div>
    <div class="portlet light bordered">
			<div class="portlet-body">
				<div id="message_account"></div>
				<form novalidate id="add_region_form" role="form" method="post"
					class="form-horizontal">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="supervisorZone">Supervisor Zone
									<span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
								<select name = "assigneeZone" id="assigneeZone" class = "form-control">
								</select>
<!-- 									<input type="text" required id="supervisorZone" name="supervisorZone"  -->
<!-- 										class="form-control" placeholder="Supervisor Zone" -->
<!-- 										value =""> -->
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="supervisorState">Supervisor State 
								<span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
								<select name = "assigneeState" id="assigneeState" class = "form-control">
								</select>

<!-- 									<input type="text" required id="supervisorState" name="supervisorState"  -->
<!-- 										class="form-control" placeholder="Supervisor State" -->
<!-- 										value =""> -->
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-md-4 control-label" for="supervisorCity">Supervisor City
									<span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
								<select name = "assigneeCity" id="assigneeCity" class = "form-control">
								</select>
<!-- 									<input type="text" required id="supervisorCity" name="supervisorCity"  -->
<!-- 										class="form-control" placeholder="Supervisor City" -->
<!-- 										value =""> -->
								</div>
							</div>
						</div>
					</div>
					<div class="row">						
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-4 control-label" for="supervisorName">Supervisor Name 
								<span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
								<select name = "assigneeName" id="assigneeName" class = "form-control">
								</select>
<!-- 									<input type="text" required id="supervisorName" name="supervisorName"  -->
<!-- 										class="form-control" placeholder="Supervisor Name" -->
<!-- 										value =""> -->
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-4 col-md-8">
							<input type="hidden" id="regionId" name="regionId"
								value = "">
							<button class="btn btn-info" id="assignSupervisor" type="button">Assign
							</button>
							<a href="${pageContext.request.contextPath}/message/pending"
								class="btn btn-danger">Back</a>							 
						</div>
					</div>
				</form>
			</div>
		</div>

    <div class="box box-primary">
      <div class="box-body">
          <div class="row">
            <div class="col-md-12 table-container">
                <div class="box-body no-padding">
                  <div class="table-responsive">
                    <table id="pending_message_list" class="table table-striped table-bordered table-hover table-checkable dataTable data-tbl">
                      <thead>
                        <tr class="tbl_head_bg">
                          <th class="head1 no-sort"><input type = "checkbox" name = "selectAllCase"></th>
                          <th class="head1 no-sort">Case ID</th>
                          <th class="head1 no-sort">Policy No</th>
                          <th class="head1 no-sort">Name of Insured</th>
                          <th class="head1 no-sort">Zone</th>
                          <th class="head1 no-sort">Sum Assured</th>
                          <th class="head1 no-sort">View history</th>
                          <th class="head1 no-sort">Status</th>
                          <th class="head1 no-sort">Action</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr class="tbl_head_bg">
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"><input type="text" class="form-control"></th>
                          <th class="head2 no-sort"><input type="text" class="form-control"></th>
                          <th class="head2 no-sort"><input type="text" class="form-control"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"><input type="text" class="form-control"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                          <th class="head2 no-sort"></th>
                        </tr>
                      </tfoot>
                      <tbody>
                        <%if(pendingCaseDetailList!=null){
                        	for(CaseDetailList list_case :pendingCaseDetailList){                       
                          		if(!list_case.getCaseSubstatus().equalsIgnoreCase("ARM"))
                          			continue;
                          		%>
                          <tr>
                          		<td><input type = "checkbox" name = "selectCase"></td>
                  				<td><%=list_case.getSrNo()%></td>
                  				<td><%=list_case.getPolicyNumber()%></td>
                  				<td><%=list_case.getInsuredName()%></td>
                  				<td><%=list_case.getClaimantZone()%></td>
                  				<td><%=list_case.getSumAssured()%></td>
                                <td><a href = "#">Case Details</a></td>
                                <td><span class="label label-sm label-warning">Pending</span></td>
                                <td>
		                             <a href="${pageContext.request.contextPath}/message/edit?caseId=<%=list_case.getCaseId()%>" 
		                             	data-toggle="tooltip" title="Edit" class="btn btn-primary btn-xs">
		                         		 <i class="glyphicon glyphicon-edit"></i>
		                         	 </a>
		           
		                             <a href="#" data-toggle="tooltip" title="Active" onClick="return updateCaseStatus('<%=list_case.getCaseId() %>','AAS',<%=allow_statusChg%>);" 
		                         		 class="btn btn-success btn-xs">
		                         		 <i class="glyphicon glyphicon-ok-circle"></i>
		                       		 </a>
		                       		 
		                             <a href="#" data-toggle="tooltip" title="Delete" onClick="return deleteMessage('<%=list_case.getCaseId() %>',<%=allow_statusChg%>);" 
		                             	class="btn btn-danger btn-xs">
		                             	<i class="glyphicon glyphicon-remove"></i>
		                           	 </a>
		                         
                         		</td>
                          </tr>                                     
                       <%}
                       	}%>                      
                      </tbody>
                    </table>
                  </div>
                </div>
              <div class="clearfix"></div>
            </div>
          </div>
        <div class="clearfix"></div>
      </div><!-- panel body -->
    </div>
  </div><!-- content -->
</div>
<script type="text/javascript">
$(document).ready(function() {
  var i = 0;
  //DataTable  
  var table = $('#pending_message_list').DataTable();

//    $('#pending_message_list tfoot th').each( function () {
// 	   i = 0;
//     else if(i == 6)
//     {
//       var channelBox = '<select name="channel" id="channel" class="form-control">'
//                               +'<option value="">All</option>';
//       channelBox += '</select>';     
//       $(this).html( channelBox );
//     }
//     i++;
//   });

  // Apply the search
  table.columns().every( function () {
    var that = this;
    $( 'input', this.footer() ).on( 'keyup change', function () {
      if ( that.search() !== this.value ) {
        that
          .search( this.value )
          .draw();
      }
    });
    $( 'select', this.footer() ).on( 'change', function () {
      if ( that.search() !== this.value ) {
        that
          .search( this.value )
          .draw();
      }
    });
  });
  
//Dropdown Validation
 $("#assigneeZone").change(function(){
	 var role_name = "AGNSUP";
	 var formdata = {"role_name":role_name};
	 $.ajax({
		method:"POST",
		data:formdata,
		url:"${pageContext.request.contextPath}/message/getActiveZone",
		success: function(data)
		{
			console.log(options);
			var options = "<option value = " + data + " > " + data + " </option>";
			$(this).append(options);
		}
	 });
 
 });
 
 $("#assigneeState").change(function(){
	 var role_name = "AGNSUP";
	 var zone = $("#asssignZone:option-selected").val();
	 var formdata = {"role_name":role_name, "zone":zone};
	 $.ajax({
		method:"POST",
		data:formdata,
		url:"${pageContext.request.contextPath}/message/getActiveState",
		success: function(data)
		{
			console.log(options);
			var options = "<option value = " + data + " > " + data + " </option>";
			$(this).append(options);	
		}
	 });
	 
  });
 
 $("#assigneeCity").change(function(){
	 var role_name = "AGNSUP";
	 var zone = $("#assigneeZone:option-selected").val();
	 var state = $("#assigneeState:option-selected").val();
	 var formdata = {"role_name":"AS", "zone":zone, "state":state};
	 $.ajax({
		method:"POST",
		data:formdata,
		url:"${pageContext.request.contextPath}/message/getActiveCity",
		success: function(data)
		{
			console.log(options);
			var options = "<option value = " + data + " > " + data + " </option>";
			$(this).append(options);
		}
	 });
	 
  });
 
 $("#assigneeName").change(function(){
	 var role_name = "AGNSUP";
	 var zone = $("#assigneeZone:option-selected").val();
	 var state = $("#assigneeState:option-selected").val();
	 var city = $("#assigneeCity:option-selected").val();
	 var formdata = {"role_name":role_name, "zone":zone , "state":state, "city":city};
	 $.ajax({
		method:"POST",
		data:formdata,
		url:"${pageContext.request.contextPath}/message/getActiveUser",
		success: function(data)
		{
			console.log(data);
		}
	 });
	 
  });
});
</script>