<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>

<%@page import = "com.preclaim.models.Region" %>
<%@page import = "com.preclaim.models.IntimationType" %>
<%@page import = "com.preclaim.models.Channel" %>
<%
List<String>user_permission=(List<String>)session.getAttribute("user_permission");
List<Region> regionList = (List<Region>) session.getAttribute("region_list");
List<IntimationType> groupList = (List<IntimationType>) session.getAttribute("group_list");
List<Channel> channelList = (List<Channel>) session.getAttribute("channel_list");
if(regionList == null)
	regionList = new ArrayList<Region>();
if(groupList == null)
	groupList = new ArrayList<IntimationType>();
if(channelList == null)
	channelList = new ArrayList<Channel>();
%>
<style type="text/css">
.placeImg { display:none !important;}
</style>
<link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-user font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Add Case</span>
        </div>
        <div class="actions">
            <div class="btn-group">
              <a href="${pageContext.request.contextPath}/message/pending_message" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" data-toggle="tooltip" title="Back" style="margin-right: 5px;" data-original-title="Back">
                <i class="fa fa-reply"></i>
              </a>
            </div>
        </div>
      </div>
    </div>
    <div class="box box-primary">
      <!-- /.box-header -->
      <!-- form start -->
      <div id="message_alert"></div>
      <form novalidate id="add_message_form" role="form" method="post" class="form-horizontal" enctype="multipart/form-data">
        <div class="box-body">
          <div class="row">
            <div class="col-sm-10 col-md-10 col-xs-12">
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgGroup">Select Group <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgGroup" id="msgGroup" class="form-control" tabindex="-1" >
                    <option value = "-1" selected disabled>Select</option>
                  </select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgRegion">Select Region <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgRegion[]" id="msgRegion" class="form-control select2-multiple" tabindex="-1" multiple>
                    <option value="" disabled>Select</option>
                   <%for(Region region : regionList) {%>
                    	<option value = "<%= region.getRegionId()%>"><%=region.getRegionName()%></option>
                   	<%} %>
                  </select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgChannel">Select Channel <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgChannel" id="msgChannel" class="form-control select2" tabindex="-1">
                    <option value="">Select</option>
                    <%for(Channel channel : channelList) {%>
                    	<option value = "<%= channel.getChannelCode()%>"><%= channel.getChannelName()%></option>
                   	<%} %>
                  </select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgCategory">Select Category <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgCategory" id="msgCategory" class="form-control select2" tabindex="-1">
                    <option value="-1" selected disabled>Select</option>
                    <!-- <?php 
                    if($categoryLists){
                      foreach ($categoryLists as $categoryInfo) {
                        ?><option value="<?php echo $categoryInfo->categoryId; ?>"><?php echo $categoryInfo->categoryNameEn; ?></option><?php
                      }
                    }
                    ?> -->
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="postDateTime">Broadcast Post Date Time <span class="text-danger">*</span></label>
                <div class="col-md-8">
                    <div class="input-group date form_datetime">
                        <input type="text" name="postDateTime" id="postDateTime" size="30" readonly class="form-control">
                        <span class="input-group-btn">
                            <button class="btn default date-set" type="button">
                                <i class="fa fa-calendar"></i>
                            </button>
                        </span>
                    </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="expiryDate">Expiry Date Time <span class="text-danger">*</span></label>
                <div class="col-md-8">
                    <div class="input-group date form_datetime">
                        <input type="text" name="expiryDate" id="expiryDate" size="30" readonly class="form-control">
                        <span class="input-group-btn">
                            <button class="btn default date-set" type="button">
                                <i class="fa fa-calendar"></i>
                            </button>
                        </span>
                    </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="refNo">Reference No</label>
                <div class="col-md-8">
                  <input type="text" required="" name="refNo" id="refNo" maxlength="40" class="form-control" placeholder="Reference No">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgTitleEn">Case Title(En) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Case Title" name="msgTitleEn" id="msgTitleEn" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgTitleHin">Case Title(Hindi) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Case Title" name="msgTitleHin" id="msgTitleHin" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgContentEn">Case Content(En)</label>
                <div class="col-md-8">
                  <textarea required="" placeholder="" name="msgContentEn" id="msgContentEn" class="form-control" rows="6"></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgContentHin">Case Content(Hindi)</label>
                <div class="col-md-8">
                  <textarea required="" placeholder="" name="msgContentHin" id="msgContentHin" class="form-control" rows="6"></textarea>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="upload_type">Content Upload Type</label>
                <div class="col-md-8">
                  <select name="upload_type" id="upload_type" class="form-control" tabindex="-1" >
                    <option value="1">Image</option>
                    <option value="2">Video</option>
                  </select>
                </div>
              </div>
              <div class="form-group" id="videoURLDiv" style="display:none;">
                <label class="col-md-4 control-label" for="videoURL">Video URL</label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Video URL Link(Youtube)" name="videoURL" id="videoURL" maxlength="150" class="form-control">
                </div>
              </div>
              <div id="uploadImageDiv">
                <div class="form-group">
                  <label class="col-md-4 control-label">Upload Image(En)</label>
                  <div class="col-md-8 col-nopadding-l">
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_1" data-ID="imgMsgEn_1" id="enLblDelBtn_1" class="delete_btn" data-linkID="link_msgImgEn_1" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_1" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_1" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 1" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_1', 'enLblDelBtn_1', 'link_msgImgEn_1');" name="imgMsgEn_1" id="imgMsgEn_1" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_1" id="d_link_msgImgEn_1" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_2" data-ID="imgMsgEn_2" id="enLblDelBtn_2" class="delete_btn" data-linkID="link_msgImgEn_2" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_2" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_2" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 2" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_2', 'enLblDelBtn_2', 'link_msgImgEn_2');" name="imgMsgEn_2" id="imgMsgEn_2" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_2" id="d_link_msgImgEn_2" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_3" data-ID="imgMsgEn_3" id="enLblDelBtn_3" class="delete_btn" data-linkID="link_msgImgEn_3" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_3" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_3" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 3" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_3', 'enLblDelBtn_3', 'link_msgImgEn_3');" name="imgMsgEn_3" id="imgMsgEn_3" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_3" id="d_link_msgImgEn_3" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_4" data-ID="imgMsgEn_4" id="enLblDelBtn_4" class="delete_btn" data-linkID="link_msgImgEn_4" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_4" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_4" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 4" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_4', 'enLblDelBtn_4', 'link_msgImgEn_4');" name="imgMsgEn_4" id="imgMsgEn_4" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_4" id="d_link_msgImgEn_4" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_5" data-ID="imgMsgEn_5" id="enLblDelBtn_5" class="delete_btn" data-linkID="link_msgImgEn_5" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgEn_5" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgEnLbl" id="imgMsgEnLbl_5" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 5" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_5', 'enLblDelBtn_5', 'link_msgImgEn_5');" name="imgMsgEn_5" id="imgMsgEn_5" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_5" id="d_link_msgImgEn_5" />
                      </a>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-md-6 text-center2 control-label"><span><b>Upload Hindi Image</b></span></label>
                </div>
                <div class="form-group">
                  <label class="col-md-4 control-label">Same as English Image</label>
                  <div class="col-md-8 col-nopadding-l">
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame1">
                        <input type="checkbox" name="isEnImageSame1" id="isEnImageSame1" value="1">
                        Image 1
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame2">
                        <input type="checkbox" name="isEnImageSame2" id="isEnImageSame2" value="1">
                        Image 2
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame3">
                        <input type="checkbox" name="isEnImageSame3" id="isEnImageSame3" value="1">
                        Image 3
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame4">
                        <input type="checkbox" name="isEnImageSame4" id="isEnImageSame4" value="1">
                        Image 4
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame5">
                        <input type="checkbox" name="isEnImageSame5" id="isEnImageSame5" value="1">
                        Image 5
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <label class="col-md-4 control-label">Upload Image(Hindi) 1</label>
                  <div class="col-md-8 col-nopadding-l">
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgHinLbl_1" data-ID="imgMsgHin_1" id="HinLblDelBtn_1" class="delete_btn" data-linkID="link_msgImgHin_1" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgHin_1" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgHinLbl" id="imgMsgHinLbl_1" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 1" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgHinLbl_1', 'HinLblDelBtn_1', 'link_msgImgHin_1');" name="imgMsgHin_1" id="imgMsgHin_1" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgHin_1" id="d_link_msgImgHin_1" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgHinLbl_2" data-ID="imgMsgHin_2" id="HinLblDelBtn_2" class="delete_btn" data-linkID="link_msgImgHin_2" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgHin_2" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgHinLbl" id="imgMsgHinLbl_2" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 2" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgHinLbl_2', 'HinLblDelBtn_2', 'link_msgImgHin_2');" name="imgMsgHin_2" id="imgMsgHin_2" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgHin_2" id="d_link_msgImgHin_2" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgHinLbl_3" data-ID="imgMsgHin_3" id="HinLblDelBtn_3" class="delete_btn" data-linkID="link_msgImgHin_3" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgHin_3" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgHinLbl" id="imgMsgHinLbl_3" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 3" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgHinLbl_3', 'HinLblDelBtn_3', 'link_msgImgHin_3');" name="imgMsgHin_3" id="imgMsgHin_3" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgHin_3" id="d_link_msgImgHin_3" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgHinLbl_4" data-ID="imgMsgHin_4" id="HinLblDelBtn_4" class="delete_btn" data-linkID="link_msgImgHin_4" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgHin_4" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgHinLbl" id="imgMsgHinLbl_4" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 4" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgHinLbl_4', 'HinLblDelBtn_4', 'link_msgImgHin_4');" name="imgMsgHin_4" id="imgMsgHin_4" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgHin_4" id="d_link_msgImgHin_4" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgHinLbl_5" data-ID="imgMsgHin_5" id="HinLblDelBtn_5" class="delete_btn" data-linkID="link_msgImgHin_5" data-toggle="tooltip" data-toggle="tooltip" title="Remove">
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="" id="link_msgImgHin_5" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink">
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="${pageContext.request.contextPath}/resources/uploads/default_img.png" class="imgMsgHinLbl" id="imgMsgHinLbl_5" style="height:height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload Image 5" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgHinLbl_5', 'HinLblDelBtn_5', 'link_msgImgHin_5');" name="imgMsgHin_5" id="imgMsgHin_5" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgHin_5" id="d_link_msgImgHin_5" />
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload PDF(En)</label>
                <div class="col-md-8">
                  <input type="file" name="msgEnFile" id="msgEnFile" accept="application/pdf" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-offset-4 col-md-8 control-label text-left2" for="isEnFileSame">
                  <input type="checkbox" name="isEnFileSame" id="isEnFileSame" value="1">
                  Same as English File
                </label>
                <div class="col-md-offset-4 col-md-8"><div class="control-label text-left2">OR</div></div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload PDF(Hindi)</label>
                <div class="col-md-8">
                  <input type="file" name="msgHinFile" id="msgHinFile" accept="application/pdf" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Enable Notification</label>
                <label class="col-md-8 control-label text-left2" for="enableNotification">
                  <input type="checkbox" name="enableNotification" id="enableNotification" value="1">
                </label>
              </div>
              <div class="box-footer">
                <div class="row">
                  <div class="col-md-offset-4 col-md-8">
                <!-- <?php
                    $token_name = $this->security->get_csrf_token_name();
                    $token_hash = $this->security->get_csrf_hash();
                    ?> -->
                    <input type="hidden" id="csrf" name="<?= $token_name; ?>" value="<?= $token_hash; ?>" />
                    <button class="btn btn-info" id="addmessagesubmit" type="submit">Broadcast</button>
                    <button class="btn btn-danger" onClick="return clearForm();" type="button">Clear</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<!--  <?php
$datetime = date('Y-m-d H:i:s');
?>-->
<script type="text/javascript">
function displayUploadImg(input, PlaceholderID, deleteID, linkID) {
  if (input.files && input.files[0]) {
    var upfile = input.files[0];
    var imagefile = upfile.type;
    var match= ["image/jpeg","image/png","image/jpg"];
    if(!((imagefile==match[0]) || (imagefile==match[1]) || (imagefile==match[2]))){
        alert('Please select a valid image file (JPEG/JPG/PNG).');
        $("#"+input.id).val('');
        return false;
    }
    var file_size = upfile.size/1024/1024;
    if(file_size < 5){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#'+PlaceholderID)
            .attr('src', e.target.result)
            .width('100%')
            .height(120);
        };
      reader.readAsDataURL(upfile);
      $('#'+deleteID).show();
      $('#'+linkID).show();
    }else{
      alert('File too large. File must be less than 5 MB.');
      $("#"+input.id).val('');
      return false;
    }
  }
}
$('select#upload_type').on('change', function() {
  if(this.value == 1){
    $('#uploadImageDiv').show();
    $('#videoURLDiv').hide();
  }else if(this.value == 2){
    $('#videoURLDiv').show();
    $('#uploadImageDiv').hide();
  }else{
    $('#videoURLDiv').hide();
    $('#uploadImageDiv').hide();
  }
});
$('.form_datetime').datetimepicker({
  startDate: '<?= $datetime; ?>',
  autoclose:!0,
  dateFormat:'yyyy-mm-dd',
  timeFormat: 'hh:mm:ss',
  pickerPosition: 'bottom-left'
});
$(".select2, .select2-multiple").select2({placeholder:"Select"});
$(document).ready(function(){
  //MESSAGE ENG IMAGE
  $(".imgMsgEnLbl").on('click', function() {
    var imgMsgEnId = $(this).attr('id');
    var ret   = imgMsgEnId.split("_");
    var imgId = ret[1];
    $("#imgMsgEn_"+imgId).trigger('click');
  });
  //MESSAGE Hindi Image
  $(".imgMsgHinLbl").on('click', function() {
    var imgMsgHinId = $(this).attr('id');
    var ret   = imgMsgHinId.split("_");
    var imgId = ret[1];
    $("#imgMsgHin_"+imgId).trigger('click');
  });
  $(".delete_btn").on('click', function() {
    var msgImgID = $(this).attr('data-imgID');
    var imgID    = $(this).attr('data-ID');
    var linkID   = $(this).attr('data-linkID');

    $("#"+msgImgID).attr("src", '${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#"+imgID).val('');
    $("#"+this.id).hide();
    $("#"+linkID).hide();
    $('#d_'+linkID).val('');
    $('#'+linkID).attr('data-val','');
  });

  $(".add_link_btn").on('click', function() {
    var linkVal  = $(this).attr('data-val');
    var linkKey  = $(this).attr('id');
    var msgId    = 0;
    
    $( '#medium_modal' ).modal();
    $( '#md_modal_title' ).html( 'Update Hperlink' );
    $( '#md_modal_body' ).html( '<div class="row"><div class="form-group"><div class="col-md-12">'
                        +'<input type="text" required="" value="'+linkVal+'" placeholder="Link" id="popup_'+linkKey+'" class="form-control" name="popup_'+linkKey+'">'
                        +'</div></div></div>' );
    $( '#md_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Close</button><button type="button" id="continuemodal'+linkKey+'" class="btn green">Ok</button>' );
    $( '#continuemodal'+linkKey ).click( function() {
        var linkvalue  = $( '#popup_'+linkKey).val();
        if(linkvalue == ''){
          toastr.error('Hyperlink Cannot be empty','Error');
          return false;
        }
        $.ajax({
            type : 'POST',
            url  : 'messages/updateHperLink',
            data : { 'hyperlink' : linkvalue,'linkKey' : linkKey,'msgId' : msgId },
            beforeSend: function() {
                $("#continuemodal"+linkKey).html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
                $("#continuemodal"+linkKey).prop('disabled', true);
            },
            success : function( msg ) {
              $('#'+linkKey).attr('data-val',linkvalue);
              $('#d_'+linkKey).val(linkvalue);
              $("#continuemodal"+linkKey).html('Ok');
              $("#continuemodal"+linkKey).prop('disabled', false);
              if(msg==1){
                $('#medium_modal').modal('hide');
                //toastr.success( 'Hyperlink updated successfully.','Success' );
              }else if(msg==2){
                toastr.error( 'Some error occurred. Please try later','Error' );
              }else{
                toastr.error( msg,'Error' );
              }
            }
        });
        return false;
    });
  });

  $("#add_message_form").on('submit', function(e){
    e.preventDefault();
    var msgGroup        = $( '#add_message_form #msgGroup' ).val();
    var msgRegion       = $( '#add_message_form #msgRegion' ).val();
    var msgChannel      = $( '#add_message_form #msgChannel' ).val();
    var msgCategory     = $( '#add_message_form #msgCategory' ).val();
    var postDateTime    = $( '#add_message_form #postDateTime' ).val();
    var expiryDate      = $( '#add_message_form #expiryDate' ).val();
    var msgTitleEn      = $( '#add_message_form #msgTitleEn' ).val();
    var msgTitleHin    = $( '#add_message_form #msgTitleHin' ).val();
    if(msgGroup == '-1'){
      toastr.error('Group cannot be empty','Error');
      return false;
    }
    if(msgRegion == '-1'){
      toastr.error('Region cannot be empty','Error');
      return false;
    }
    if(msgChannel == '-1'){
      toastr.error('Channel cannot be empty','Error');
      return false;
    }
    if(msgCategory == '-1'){
      toastr.error('Category cannot be empty','Error');
      return false;
    }
    if(postDateTime == ''){
      toastr.error('Broadcast Post Date Time Cannot be empty','Error');
      return false;
    }
    if(expiryDate == ''){
      toastr.error('Expiry Date cannot be empty','Error');
      return false;
    }
    if(msgTitleEn == ''){
      toastr.error('Title English cannot be empty','Error');
      return false;
    }
    if(msgTitleHin == ''){
      toastr.error('Title Hin cannot be empty','Error');
      return false;
    }
    if(msgGroup && msgCategory && msgChannel && msgRegion && msgTitleEn && msgTitleHin){
        $.ajax({
          type: "POST",
          url: 'messages/addMessage',
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          beforeSend: function() { 
              $("#addmessagesubmit").html('<img src="${pageContext.request.contextPath}/resources/img/input-spinner.gif"> Loading...');
              $("#addmessagesubmit").prop('disabled', true);
              $('#add_message_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == 1){
              $("#addmessagesubmit").html('Broadcast');
              $("#addmessagesubmit").prop('disabled', false);
              toastr.success( 'Message Added successfully.','Success' );
              $("form#add_message_form").trigger("reset");
              $("#msgCategory").select2("val", "");
              $("#msgChannel").select2("val", "");
              $("#imgMsgEnLbl_1").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgEnLbl_2").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgEnLbl_3").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgEnLbl_4").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgEnLbl_5").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgHinLbl_1").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgHinLbl_2").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgHinLbl_3").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgHinLbl_4").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $("#imgMsgHinLbl_5").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
              $(".delete_btn").hide();
              $(".add_link_btn").hide();
              $('.add_link_btn').attr('data-val','');
            }else{
              toastr.error( data,'Error' );
              $("#addmessagesubmit").html('Broadcast');
              $("#addmessagesubmit").prop('disabled', false);
            }
            $('#add_message_form').css("opacity","");
          }
        });
    }
  });
});
function clearForm(){
  $( '#small_modal' ).modal();
  $( '#sm_modal_title' ).html( 'Are you Sure?' );
  $( '#sm_modal_body' ).html( 'Do you really want to clear this form data?' );
  $( '#sm_modal_footer' ).html( '<button type="button" class="btn dark btn-outline" data-dismiss="modal">Cancel</button><button type="button" id="continuemodal_cl" class="btn green">Yes</button>' );
  $( '#continuemodal_cl' ).click( function() {
    $("form#add_message_form").trigger("reset");
    $("#msgCategory").select2("val", "");
    $("#msgChannel").select2("val", "");
    $("#imgMsgEnLbl_1").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgEnLbl_2").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgEnLbl_3").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgEnLbl_4").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgEnLbl_5").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgHinLbl_1").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgHinLbl_2").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgHinLbl_3").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgHinLbl_4").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $("#imgMsgHinLbl_5").attr("src",'${pageContext.request.contextPath}/resources/uploads/default_img.png');
    $(".delete_btn").hide();
    $(".add_link_btn").hide();
    $('.add_link_btn').attr('data-val','');
    $('#small_modal').modal('hide');
  });
}
</script>