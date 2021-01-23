<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$assetUrl       = $this->config->item( 'base_url' );
if($messgeInfo->isEnImageSame1 == 1){ $checked1 = 'checked'; }else{ $checked1 = ''; }
if($messgeInfo->isEnImageSame2 == 1){ $checked2 = 'checked'; }else{ $checked2 = ''; }
if($messgeInfo->isEnImageSame3 == 1){ $checked3 = 'checked'; }else{ $checked3 = ''; }
if($messgeInfo->isEnImageSame4 == 1){ $checked4 = 'checked'; }else{ $checked4 = ''; }
if($messgeInfo->isEnImageSame5 == 1){ $checked5 = 'checked'; }else{ $checked5 = ''; }
if($messgeInfo->isEnFileSame == 1){ $checked6 = 'checked'; }else{ $checked6 = ''; }
if($messgeInfo->enableNotification == 1){ $checked7 = 'checked'; }else{ $checked7 = ''; }
?>
<style type="text/css">
.placeImg { display:none !important;}
</style>
<link href="${pageContext.request.contextPath}/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<div class="row">
  <div class="col-md-12 col-sm-12">
    <div class="portlet box">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-user font-green-sharp"></i>
          <span class="caption-subject font-green-sharp sbold">Edit Case</span>
        </div>
        <div class="actions">
          <div class="btn-group">
            <a href="${pageContext.request.contextPath}/messages/pendinglist" data-toggle="tooltip" title="Back" class="btn green-haze btn-outline btn-xs pull-right" data-toggle="tooltip" title="" style="margin-right: 5px;" data-original-title="Back">
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
      <form novalidate="" id="edit_message_form" role="form" method="post" class="form-horizontal" enctype="multipart/form-data">
        <div class="box-body">
          <div class="row">
            <div class="col-sm-10 col-md-10 col-xs-12">
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgGroup">Select Group <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgGroup" id="msgGroup" class="form-control" tabindex="-1" >
                    <?php 
                    if($groupLists){
                      foreach ($groupLists as $groupInfo) {
                        ?><option value="<?php echo $groupInfo->groupId; ?>" <?php if($groupInfo->groupId == $messgeInfo->msgGroup){ echo 'selected'; } ?>><?php echo $groupInfo->groupName; ?></option><?php
                      }
                    }
                    ?>
                  </select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgRegion">Select Region <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgRegion[]" id="msgRegion" class="form-control select2-multiple" tabindex="-1" multiple>
                    <option value="">Select</option>
                    
                  </select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgChannel">Select Channel <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgChannel" id="msgChannel" class="form-control select2" tabindex="-1">
                    <option value="">Select</option>
                    
                  </select>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="msgCategory">Select Category <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <select name="msgCategory" id="msgCategory" class="form-control select2" tabindex="-1">
                    <option value="">Select</option>
                    
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="postDateTime">Broadcast Post Date Time <span class="text-danger">*</span></label>
                <div class="col-md-8">
                    <div class="input-group date form_datetime">
                        <input type="text" name="postDateTime" id="postDateTime" size="30" value="<?= $messgeInfo->msgPostTime; ?>" readonly class="form-control">
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
                        <input type="text" name="expiryDate" id="expiryDate" size="30" value="<?= $messgeInfo->msgExpiryDate; ?>" readonly class="form-control">
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
                  <input type="text" required="" name="refNo" id="refNo" maxlength="40" value="<?= $messgeInfo->refNo; ?>" class="form-control" placeholder="Reference No">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgTitleEn">Case Title(En) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Case Title" name="msgTitleEn" id="msgTitleEn" value="<?= $messgeInfo->msgTitleEn; ?>" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgTitleThai">Case Title(Hindi) <span class="text-danger">*</span></label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Case Title" name="msgTitleThai" id="msgTitleThai" value="<?= $messgeInfo->msgTitleThai; ?>" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgContentEn">Case Content(En)</label>
                <div class="col-md-8">
                  <textarea required="" placeholder="" name="msgContentEn" id="msgContentEn" class="form-control" rows="6"><?= $messgeInfo->msgContentEn; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label" for="msgContentThai">Case Content(Hindi)</label>
                <div class="col-md-8">
                  <textarea required="" placeholder="" name="msgContentThai" id="msgContentThai" class="form-control" rows="6"><?= $messgeInfo->msgContentThai; ?></textarea>
                </div>
              </div>
              <div class="form-group selectDiv">
                <label class="col-md-4 control-label" for="upload_type">Content Upload Type</label>
                <div class="col-md-8">
                  <select name="upload_type" id="upload_type" class="form-control" tabindex="-1" >
                    <option value="1" <?php if($messgeInfo->upload_type == 1){ echo 'selected'; } ?>>Image</option>
                    <option value="2" <?php if($messgeInfo->upload_type == 2){ echo 'selected'; } ?>>Video</option>
                  </select>
                </div>
              </div>
              <?php
              if($messgeInfo->upload_type == 1 || $messgeInfo->upload_type == 0){
                $upload_typeCss1 = 'style="display:none;"';
                $upload_typeCss2 = '';
              }elseif ($messgeInfo->upload_type == 2) {
                $upload_typeCss1 = '';
                $upload_typeCss2 = 'style="display:none;"';
              }else{
                $upload_typeCss1 = '';
                $upload_typeCss2 = '';
              }
              ?>
              <div class="form-group" id="videoURLDiv" <?= $upload_typeCss1; ?> >
                <label class="col-md-4 control-label" for="videoURL">Video URL</label>
                <div class="col-md-8">
                  <input type="text" required="" placeholder="Video URL Link(Youtube)"  name="videoURL" id="videoURL" maxlength="150" value="<?= $messgeInfo->videoURL; ?>" class="form-control">
                </div>
              </div>
              <?php
              if($messgeInfo->msgImgEn_1){
                $imgMsgEn_1 = $messgeInfo->msgImgEn_1;
                $imgMsgEn_1S='style="display: block;"';
              }else{
                $imgMsgEn_1 = $assetUrl.'uploads/default_img.png';
                $imgMsgEn_1S='';
              }
              if($messgeInfo->msgImgEn_2){
                $imgMsgEn_2 = $messgeInfo->msgImgEn_2;
                $imgMsgEn_2S='style="display: block;"';
              }else{
                $imgMsgEn_2 = $assetUrl.'uploads/default_img.png';
                $imgMsgEn_2S='';
              }
              if($messgeInfo->msgImgEn_3){
                $imgMsgEn_3 = $messgeInfo->msgImgEn_3;
                $imgMsgEn_3S='style="display: block;"';
              }else{
                $imgMsgEn_3 = $assetUrl.'uploads/default_img.png';
                $imgMsgEn_3S='';
              }
              if($messgeInfo->msgImgEn_4){
                $imgMsgEn_4 = $messgeInfo->msgImgEn_4;
                $imgMsgEn_4S='style="display: block;"';
              }else{
                $imgMsgEn_4 = $assetUrl.'uploads/default_img.png';
                $imgMsgEn_4S='';
              }
              if($messgeInfo->msgImgEn_5){
                $imgMsgEn_5 = $messgeInfo->msgImgEn_5;
                $imgMsgEn_5S='style="display: block;"';
              }else{
                $imgMsgEn_5 = $assetUrl.'uploads/default_img.png';
                $imgMsgEn_5S='';
              }
              ?>
              <?php
              if($messgeInfo->msgImgThai_1){
                $imgMsgThai_1 = $messgeInfo->msgImgThai_1;
                $imgMsgThai_1S='style="display: block;"';
              }else{
                $imgMsgThai_1 = $assetUrl.'uploads/default_img.png';
                $imgMsgThai_1S='';
              }
              if($messgeInfo->msgImgThai_2){
                $imgMsgThai_2 = $messgeInfo->msgImgThai_2;
                $imgMsgThai_2S='style="display: block;"';
              }else{
                $imgMsgThai_2 = $assetUrl.'uploads/default_img.png';
                $imgMsgThai_2S='';
              }
              if($messgeInfo->msgImgThai_3){
                $imgMsgThai_3 = $messgeInfo->msgImgThai_3;
                $imgMsgThai_3S='style="display: block;"';
              }else{
                $imgMsgThai_3 = $assetUrl.'uploads/default_img.png';
                $imgMsgThai_3S='';
              }
              if($messgeInfo->msgImgThai_4){
                $imgMsgThai_4 = $messgeInfo->msgImgThai_4;
                $imgMsgThai_4S='style="display: block;"';
              }else{
                $imgMsgThai_4 = $assetUrl.'uploads/default_img.png';
                $imgMsgThai_4S='';
              }
              if($messgeInfo->msgImgThai_5){
                $imgMsgThai_5 = $messgeInfo->msgImgThai_5;
                $imgMsgThai_5S='style="display: block;"';
              }else{
                $imgMsgThai_5 = $assetUrl.'uploads/default_img.png';
                $imgMsgThai_5S='';
              }
              ?>
              <div id="uploadImageDiv" <?= $upload_typeCss2; ?>>
                <div class="form-group">
                  <label class="col-md-4 control-label">Upload Image</label>
                  <div class="col-md-8 col-nopadding-l">
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span class="delete_btn" data-imgID="imgMsgEnLbl_1" data-delID="delImgMsgEn_1" data-ID="imgMsgEn_1" data-linkID="link_msgImgEn_1" id="enLblDelBtn_1" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgEn_1S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgEn_1; ?>" id="link_msgImgEn_1" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgEn_1S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgEn_1; ?>" class="imgMsgEnLbl" id="imgMsgEnLbl_1" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgEn_1" id="delImgMsgEn_1" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_1', 'enLblDelBtn_1', 'link_msgImgEn_1');" name="imgMsgEn_1" id="imgMsgEn_1" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_1" id="d_link_msgImgEn_1" value="<?= $messgeInfo->link_msgImgEn_1; ?>" />

                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_2" data-delID="delImgMsgEn_2" data-ID="imgMsgEn_2" id="enLblDelBtn_2" class="delete_btn" data-linkID="link_msgImgEn_2" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgEn_2S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgEn_2; ?>" id="link_msgImgEn_2" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgEn_2S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgEn_2; ?>" class="imgMsgEnLbl" id="imgMsgEnLbl_2" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgEn_2" id="delImgMsgEn_2" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_2', 'enLblDelBtn_2', 'link_msgImgEn_2');" name="imgMsgEn_2" id="imgMsgEn_2" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_2" id="d_link_msgImgEn_2" value="<?= $messgeInfo->link_msgImgEn_2; ?>" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_3" data-delID="delImgMsgEn_3" data-ID="imgMsgEn_3" id="enLblDelBtn_3" class="delete_btn" data-linkID="link_msgImgEn_3" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgEn_3S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgEn_3; ?>" id="link_msgImgEn_3" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgEn_3S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgEn_3; ?>" class="imgMsgEnLbl" id="imgMsgEnLbl_3" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgEn_3" id="delImgMsgEn_3" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_3', 'enLblDelBtn_3', 'link_msgImgEn_3');" name="imgMsgEn_3" id="imgMsgEn_3" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_3" id="d_link_msgImgEn_3" value="<?= $messgeInfo->link_msgImgEn_3; ?>" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_4" data-delID="delImgMsgEn_4" data-ID="imgMsgEn_4" id="enLblDelBtn_4" class="delete_btn" data-linkID="link_msgImgEn_4" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgEn_4S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgEn_4; ?>" id="link_msgImgEn_4" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgEn_4S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgEn_4; ?>" class="imgMsgEnLbl" id="imgMsgEnLbl_4" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgEn_4" id="delImgMsgEn_4" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_4', 'enLblDelBtn_4', 'link_msgImgEn_4');" name="imgMsgEn_4" id="imgMsgEn_4" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_4" id="d_link_msgImgEn_4" value="<?= $messgeInfo->link_msgImgEn_4; ?>" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgEnLbl_5" data-delID="delImgMsgEn_5" data-ID="imgMsgEn_5" id="enLblDelBtn_5" class="delete_btn" data-linkID="link_msgImgEn_5" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgEn_5S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgEn_5; ?>" id="link_msgImgEn_5" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgEn_5S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgEn_5; ?>" class="imgMsgEnLbl" id="imgMsgEnLbl_5" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgEn_5" id="delImgMsgEn_5" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgEnLbl_5', 'enLblDelBtn_5', 'link_msgImgEn_5');" name="imgMsgEn_5" id="imgMsgEn_5" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgEn_5" id="d_link_msgImgEn_5" value="<?= $messgeInfo->link_msgImgEn_5; ?>" />
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
                        <input type="checkbox" <?= $checked1; ?> name="isEnImageSame1" id="isEnImageSame1" value="1">
                        Image 1
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame2">
                        <input type="checkbox" <?= $checked2; ?> name="isEnImageSame2" id="isEnImageSame2" value="1">
                        Image 2
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame3">
                        <input type="checkbox" <?= $checked3; ?> name="isEnImageSame3" id="isEnImageSame3" value="1">
                        Image 3
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame4">
                        <input type="checkbox" <?= $checked4; ?> name="isEnImageSame4" id="isEnImageSame4" value="1">
                        Image 4
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                    <div class="col-md-2">
                      <label class="control-label" for="isEnImageSame5">
                        <input type="checkbox" <?= $checked5; ?> name="isEnImageSame5" id="isEnImageSame5" value="1">
                        Image 5
                      </label>
                      <div class="text-center"><label class="control-label">OR</label></div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <label class="col-md-4 control-label">Upload Image(Hindi)</label>
                  <div class="col-md-8 col-nopadding-l">
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgThaiLbl_1" data-delID="delImgMsgThai_1" data-ID="imgMsgThai_1" id="thaiLblDelBtn_1" class="delete_btn" data-linkID="link_msgImgThai_1" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgThai_1S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgThai_1; ?>" id="link_msgImgThai_1" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgThai_1S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgThai_1; ?>" class="imgMsgThaiLbl" id="imgMsgThaiLbl_1" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgThai_1" id="delImgMsgThai_1" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgThaiLbl_1', 'thaiLblDelBtn_1', 'link_msgImgThai_1');" name="imgMsgThai_1" id="imgMsgThai_1" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgThai_1" id="d_link_msgImgThai_1" value="<?= $messgeInfo->link_msgImgThai_1; ?>" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgThaiLbl_2" data-delID="delImgMsgThai_2" data-ID="imgMsgThai_2" id="thaiLblDelBtn_2" class="delete_btn" data-linkID="link_msgImgThai_2" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgThai_2S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgThai_2; ?>" id="link_msgImgThai_2" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgThai_2S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgThai_2; ?>" class="imgMsgThaiLbl" id="imgMsgThaiLbl_2" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgThai_2" id="delImgMsgThai_2" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgThaiLbl_2', 'thaiLblDelBtn_2', 'link_msgImgThai_2');" name="imgMsgThai_2" id="imgMsgThai_2" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgThai_2" id="d_link_msgImgThai_2" value="<?= $messgeInfo->link_msgImgThai_2; ?>" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgThaiLbl_3" data-delID="delImgMsgThai_3" data-ID="imgMsgThai_3" id="thaiLblDelBtn_3" class="delete_btn" data-linkID="link_msgImgThai_3" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgThai_3S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgThai_3; ?>" id="link_msgImgThai_3" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgThai_3S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgThai_3; ?>" class="imgMsgThaiLbl" id="imgMsgThaiLbl_3" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgThai_3" id="delImgMsgThai_3" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgThaiLbl_3', 'thaiLblDelBtn_3', 'link_msgImgThai_3');" name="imgMsgThai_3" id="imgMsgThai_3" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgThai_3" id="d_link_msgImgThai_3" value="<?= $messgeInfo->link_msgImgThai_3; ?>" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgThaiLbl_4" data-delID="delImgMsgThai_4" data-ID="imgMsgThai_4" id="thaiLblDelBtn_4" class="delete_btn" data-linkID="link_msgImgThai_4" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgThai_4S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgThai_4; ?>" id="link_msgImgThai_4" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgThai_4S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgThai_4; ?>" class="imgMsgThaiLbl" id="imgMsgThaiLbl_4" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgThai_4" id="delImgMsgThai_4" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgThaiLbl_4', 'thaiLblDelBtn_4', 'link_msgImgThai_4');" name="imgMsgThai_4" id="imgMsgThai_4" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgThai_4" id="d_link_msgImgThai_4" value="<?= $messgeInfo->link_msgImgThai_4; ?>" />
                      </a>
                    </div>
                    <div class="col-md-3">
                      <a href="javascript:void(0);">
                        <div class="uploadFileDiv">
                          <span data-imgID="imgMsgThaiLbl_5" data-delID="delImgMsgThai_5" data-ID="imgMsgThai_5" id="thaiLblDelBtn_5" class="delete_btn" data-linkID="link_msgImgThai_5" data-toggle="tooltip" data-toggle="tooltip" title="Remove" <?= $imgMsgThai_5S; ?>>
                            <i class="fa fa-remove"></i>
                          </span>
                          <span class="add_link_btn" data-val="<?= $messgeInfo->link_msgImgThai_5; ?>" id="link_msgImgThai_5" data-toggle="tooltip" data-toggle="tooltip" title="Update hyperlink" <?= $imgMsgThai_5S; ?>>
                            <i class="fa fa-link"></i>
                          </span>
                          <img src="<?php echo $imgMsgThai_5; ?>" class="imgMsgThaiLbl" id="imgMsgThaiLbl_5" style="height:120px;width: 100%;" data-src="#" data-toggle="tooltip" data-toggle="tooltip" title="Click to upload" />
                          <input type="hidden" name="delImgMsgThai_5" id="delImgMsgThai_5" value="0" />
                        </div>
                        <input type="file" onchange="displayUploadImg(this, 'imgMsgThaiLbl_5', 'thaiLblDelBtn_5', 'link_msgImgThai_5');" name="imgMsgThai_5" id="imgMsgThai_5" class="placeImg" accept="image/*" />
                        <input type="hidden" name="d_link_msgImgThai_5" id="d_link_msgImgThai_5" value="<?= $messgeInfo->link_msgImgThai_5; ?>" />
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <?php
              if($messgeInfo->msgFileEn){
                $msgFileEnEx  = explode('/', $messgeInfo->msgFileEn);
                $fileNameEn   = end($msgFileEnEx);
                $fileLabelEn  = '<a target="_blank" style="color: #fff;" href="'.$messgeInfo->msgFileEn.'">'. $fileNameEn . '...</a>';
              }else{
                $fileLabelEn  = '';
              }
              ?>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload PDF(En)</label>
                <div class="col-md-8">
                  <input type="file" name="msgEnFile" id="msgEnFile" accept="application/pdf" />
                  <p><?php if($fileLabelEn){ ?><span class="label label-info" id="msgEnLabel"><?= $fileLabelEn; ?></span> <?php } ?></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-offset-4 col-md-8 control-label text-left2" for="isEnFileSame">
                  <input type="checkbox" <?= $checked6; ?> name="isEnFileSame" id="isEnFileSame" value="1">
                  Same as English File
                </label>
                <div class="col-md-offset-4 col-md-8"><div class="control-label text-left2">OR</div></div>
              </div>
              <?php
              if($messgeInfo->msgFileThai){
                $msgFileThaiEx  = explode('/', $messgeInfo->msgFileThai);
                $fileNameThai   = end($msgFileThaiEx);
                $fileLabelThai  = '<a target="_blank" style="color: #fff;" href="'.$messgeInfo->msgFileThai.'">'. $fileNameThai .'</a>';
              }else{
                $fileLabelThai  = '';
              }
              ?>
              <div class="form-group">
                <label class="col-md-4 control-label">Upload PDF(Hindi)</label>
                <div class="col-md-8">
                  <input type="file" name="msgThaiFile" id="msgThaiFile" accept="application/pdf" />
                  <p><?php if($fileLabelThai){ ?><span class="label label-info" id="msgThaiLabel"><?= $fileLabelThai; ?></span> <?php } ?></p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-4 control-label">Enable Notification</label>
                <label class="col-md-8 control-label text-left2" for="enableNotification">
                  <input type="checkbox" <?= $checked7; ?> name="enableNotification" id="enableNotification" value="1">
                </label>
              </div>
              <div class="box-footer">
                <div class="col-md-offset-4 col-md-8">
                  <input type="hidden" id="msgId" name="msgId" value="<?= $msgId; ?>" />
                  <button class="btn btn-info" id="editmessagesubmit" type="submit">Update Broadcast</button>
                  <a href="<?= base_url(); ?>messages/pendinglist" class="btn btn-danger">Back</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.box-body -->
      </form>
    </div>
  </div>
</div>
<?php
$datetime = date('Y-m-d H:i:s');
?>
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
    var delImgID = $("#"+deleteID).attr('data-delID');
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
      $("#"+delImgID).val(0);
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
  $(".imgMsgThaiLbl").on('click', function() {
    var imgMsgThaiId = $(this).attr('id');
    var ret   = imgMsgThaiId.split("_");
    var imgId = ret[1];
    $("#imgMsgThai_"+imgId).trigger('click');
  });
  $(".delete_btn").on('click', function() {
    var msgImgID = $(this).attr('data-imgID');
    var delImgID = $(this).attr('data-delID');
    var imgID    = $(this).attr('data-ID');
    var linkID   = $(this).attr('data-linkID');
    $("#"+msgImgID).attr("src", adminurl+'uploads/default_img.png');
    $("#"+delImgID).val(1);
    $("#"+imgID).val('');
    $("#"+this.id).hide();
    $("#"+linkID).hide();
    $('#d_'+linkID).val('');
    $('#'+linkID).attr('data-val','');
  });
  $(".add_link_btn").on('click', function() {
    var linkVal  = $(this).attr('data-val');
    var linkKey  = $(this).attr('id');
    var msgId    = $( '#edit_message_form #msgId').val();
    
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
            url  : adminurl + 'messages/updateHperLink',
            data : { 'hyperlink' : linkvalue,'linkKey' : linkKey,'msgId' : msgId },
            beforeSend: function() {
                $("#continuemodal"+linkKey).html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
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
  

  $("#edit_message_form").on('submit', function(e){
    e.preventDefault();
    var msgGroup        = $( '#edit_message_form #msgGroup' ).val();
    var msgRegion       = $( '#edit_message_form #msgRegion' ).val();
    var msgChannel      = $( '#edit_message_form #msgChannel' ).val();
    var msgCategory     = $( '#edit_message_form #msgCategory' ).val();
    var postDateTime    = $( '#edit_message_form #postDateTime' ).val();
    var expiryDate      = $( '#edit_message_form #expiryDate' ).val();
    var msgTitleEn      = $( '#edit_message_form #msgTitleEn' ).val();
    var msgTitleThai    = $( '#edit_message_form #msgTitleThai' ).val();
    var msgEnUpload     = $( '#edit_message_form #msgEnUpload' ).val();
    var msgThaiUpload   = $( '#edit_message_form #msgThaiUpload' ).val();
    var msgId           = $( '#edit_message_form #msgId').val();
    if(msgGroup == ''){
      toastr.error('Group Cannot be empty','Error');
      return false;
    }
    if(msgRegion == null || msgRegion == ''){
      toastr.error('Region Cannot be empty','Error');
      return false;
    }
    if(msgChannel == ''){
      toastr.error('Channel Cannot be empty','Error');
      return false;
    }
    if(msgCategory == ''){
      toastr.error('Category Cannot be empty','Error');
      return false;
    }
    if(postDateTime == ''){
      toastr.error('Broadcast Post Date Time Cannot be empty','Error');
      return false;
    }
    if(expiryDate == ''){
      toastr.error('Expiry Date Cannot be empty','Error');
      return false;
    }
    if(msgTitleEn == ''){
      toastr.error('Title English Cannot be empty','Error');
      return false;
    }
    if(msgTitleThai == ''){
      toastr.error('Title Thai Cannot be empty','Error');
      return false;
    }
    if(msgGroup && msgCategory && msgChannel && msgRegion && msgTitleEn && msgTitleThai && msgId){
        $.ajax({
          type: "POST",
          url: adminurl + 'messages/updateMessage',
          data: new FormData(this),
          contentType: false,
          cache: false,
          processData:false,
          beforeSend: function() { 
              $("#editmessagesubmit").html('<img src="'+adminurl+'assets/img/input-spinner.gif"> Loading...');
              $("#editmessagesubmit").prop('disabled', true);
              $('#edit_message_form').css("opacity",".5");
          },
          success: function( data ) {
            if(data == 1){
              window.location.reload();
              $("#editmessagesubmit").html('Update Broadcast');
              $("#editmessagesubmit").prop('disabled', false);
              toastr.success( 'Message Updated successfully.','Success' );
            }else{
              toastr.error( data,'Error' );
              $("#editmessagesubmit").html('Update Broadcast');
              $("#editmessagesubmit").prop('disabled', false);
            }
            $('#edit_message_form').css("opacity","");
          }
        });
    }
  });
});
</script>